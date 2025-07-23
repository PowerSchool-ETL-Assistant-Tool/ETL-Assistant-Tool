{
	"encoding": "UTF-8",
	"fileExtensions": [
		".csv"
	],
	"format": {
		"@type": "Delimited",
		"formatName": "ELPAC_INITIAL_2022_COMMA",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"recordLength": "",
		"hasHeader": true,
		"naturalKey": [
			"STUDENT_LOCAL_ID",
			"TESTING_COMPLETED_DATE_LISTENING",
			"TESTING_COMPLETED_DATE_READING",
			"TESTING_COMPLETED_DATE_SPEAKING",
			"TESTING_COMPLETED_DATE_WRITING"
		],
		"fields": [{
				"physicalName": "RecordType",
				"otherPossibleNames": [

				],
				"logicalName": "ASSESSMENT_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"IE"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UIN",
				"otherPossibleNames": [

				],
				"logicalName": "UIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Blank1",
				"otherPossibleNames": [

				],
				"logicalName": "BLANK1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSID",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_STATE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "LocalStudentID",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_LOCAL_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "StudentLastName",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentFirstName",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentMiddleName",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DateofBirthforTesting",
				"otherPossibleNames": [

				],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Female",
					"Male",
					"M",
					"F"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSGrade",
				"otherPossibleNames": [

				],
				"logicalName": "CALPADS_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"KN",
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
					"UE",
					"US"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GradeAssessed",
				"otherPossibleNames": [

				],
				"logicalName": "GRADE_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"KN",
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
					"12"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSDistrictCode",
				"otherPossibleNames": [

				],
				"logicalName": "CALPADS_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADSSchoolCode",
				"otherPossibleNames": [

				],
				"logicalName": "CALPADS_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADSCharterCode",
				"otherPossibleNames": [

				],
				"logicalName": "CALPADS_CHARTER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADSCharterSchoolIndicator",
				"otherPossibleNames": [

				],
				"logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPEDACCTDist",
				"otherPossibleNames": ["SPEDAcctDist"],
				"logicalName": "SPECIAL_EDUCATION_DISTRICT_OF_ACCOUNTABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADSNPSSchoolFlag",
				"otherPossibleNames": [

				],
				"logicalName": "NPS_SCHOOL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Y",
					"N"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Section504Status",
				"otherPossibleNames": [

				],
				"logicalName": "SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSIDEAIndicator",
				"otherPossibleNames": [

				],
				"logicalName": "IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PrimaryDisabilityType",
				"otherPossibleNames": [

				],
				"logicalName": "PRIMARY_DISABILITY_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MigrantStatus",
				"otherPossibleNames": [

				],
				"logicalName": "MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELEntryDate",
				"otherPossibleNames": [

				],
				"logicalName": "EL_ENTRY_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FirstEntryDateinUSSchool",
				"otherPossibleNames": [
					"FirstEntryDateInUSSchool"
				],
				"logicalName": "FIRST_ENTRY_DATE_IN_US_SCHOOL",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EnrollmentEffectiveDate",
				"otherPossibleNames": [

				],
				"logicalName": "ENROLLMENT_EFFECTIVE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELASforTesting",
				"otherPossibleNames": [

				],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"EO",
					"IFEP",
					"EL",
					"RFEP",
					"TBD"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PrimaryLanguageforTesting",
				"otherPossibleNames": [

				],
				"logicalName": "LANGUAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CEDSLanguageCode",
				"otherPossibleNames": [

				],
				"logicalName": "LANGUAGE_CODE_CEDS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MilitaryStatus",
				"otherPossibleNames": [

				],
				"logicalName": "MILITARY_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FosterStatus",
				"otherPossibleNames": [

				],
				"logicalName": "FOSTER_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HomelessStatus",
				"otherPossibleNames": [

				],
				"logicalName": "HOMELESS_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EconomicDisadvantageStatus",
				"otherPossibleNames": [

				],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HispanicorLatino",
				"otherPossibleNames": [

				],
				"logicalName": "HISPANIC_OR_LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AmericanIndianorAlaskaNative",
				"otherPossibleNames": [

				],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [

				],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BlackorAfricanAmerican",
				"otherPossibleNames": [

				],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [

				],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HawaiianorOtherPacificIslander",
				"otherPossibleNames": [
					"HawaiianOrOtherPacificIslander"
				],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filipino",
				"otherPossibleNames": [

				],
				"logicalName": "FILIPINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TwoorMoreRaces",
				"otherPossibleNames": [

				],
				"logicalName": "TWO_OR_MORE_RACES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Yes",
					"No"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReportingEthnicity",
				"otherPossibleNames": [

				],
				"logicalName": "REPORTING_ETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"100",
					"200",
					"300",
					"400",
					"500",
					"600",
					"700",
					"800"
				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ParentEducationLevel",
				"otherPossibleNames": [

				],
				"logicalName": "PARENT_EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"10",
					"11",
					"12",
					"13",
					"14",
					"15"
				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_LEA_NAME_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NAME_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolIndicator1",
				"otherPossibleNames": [
					"TestedCharterSchoolIndicator1"
				],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate1",
				"otherPossibleNames": [

				],
				"logicalName": "TESTING_START_DATE_LISTENING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate1",
				"otherPossibleNames": [
                    "TestingCompletedDate1"
				],
				"logicalName": "TESTING_COMPLETED_DATE_LISTENING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_LEA_NAME_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NAME_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolSchoolNPSFlag2",
				"otherPossibleNames": [
					"TestedSchoolNPSFlag2"
				],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate2",
				"otherPossibleNames": [

				],
				"logicalName": "TESTING_START_DATE_SPEAKING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate2",
				"otherPossibleNames": [
					"TestingCompletedDate2"
				],
				"logicalName": "TESTING_COMPLETED_DATE_SPEAKING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_LEA_NAME_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NAME_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate3",
				"otherPossibleNames": [

				],
				"logicalName": "TESTING_START_DATE_READING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate3",
				"otherPossibleNames": [
					"TestingCompletedDate3"
				],
				"logicalName": "TESTING_COMPLETED_DATE_READING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_LEA_NAME_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NAME_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate4",
				"otherPossibleNames": [

				],
				"logicalName": "TESTING_START_DATE_WRITING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate4",
				"otherPossibleNames": [
					"TestingCompletedDate4"
				],
				"logicalName": "TESTING_COMPLETED_DATE_WRITING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID1",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_ID_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus1",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID2",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_ID_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus2",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID3",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_ID_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus3",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID4",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_ID_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus4",
				"otherPossibleNames": [

				],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentExitCode",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentExitWithdrawalDate",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentRemovedCALPADSFileDate",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ConditionCode",
				"otherPossibleNames": [

				],
				"logicalName": "CONDITION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"NT",
					"ALT"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Attemptedness",
				"otherPossibleNames": [

				],
				"logicalName": "ATTEMPTEDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IncludeIndicator",
				"otherPossibleNames": [

				],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"N",
					"T",
					"Y"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources1",
				"otherPossibleNames": [

				],
				"logicalName": "UNLISTED_RESOURCES_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources2",
				"otherPossibleNames": [

				],
				"logicalName": "UNLISTED_RESOURCES_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources3",
				"otherPossibleNames": [

				],
				"logicalName": "UNLISTED_RESOURCES_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources4",
				"otherPossibleNames": [

				],
				"logicalName": "UNLISTED_RESOURCES_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode1",
				"otherPossibleNames": [

				],
				"logicalName": "TEST_MODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode2",
				"otherPossibleNames": [

				],
				"logicalName": "TEST_MODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode3",
				"otherPossibleNames": [

				],
				"logicalName": "TEST_MODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode4",
				"otherPossibleNames": [

				],
				"logicalName": "TEST_MODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore1",
				"otherPossibleNames": [

				],
				"logicalName": "LISTENING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore2",
				"otherPossibleNames": [

				],
				"logicalName": "SPEAKING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore3",
				"otherPossibleNames": [

				],
				"logicalName": "READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore4",
				"otherPossibleNames": [

				],
				"logicalName": "WRITING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallScaleScore",
				"otherPossibleNames": [

				],
				"logicalName": "OVERALL_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "OverallPL",
				"otherPossibleNames": [

				],
				"logicalName": "OVERALL_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguagePL",
				"otherPossibleNames": [

				],
				"logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					1,
					2,
					3,
					4
				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguagePL",
				"otherPossibleNames": [

				],
				"logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					1,
					2,
					3,
					4
				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CalculatedELAS",
				"otherPossibleNames": [

				],
				"logicalName": "CALCULATED_ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTAssessment1",
				"otherPossibleNames": [

				],
				"logicalName": "LISTENING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTAssessment2",
				"otherPossibleNames": [

				],
				"logicalName": "SPEAKING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTAssessment3",
				"otherPossibleNames": [

				],
				"logicalName": "READING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTAssessment4",
				"otherPossibleNames": [

				],
				"logicalName": "WRITING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx1",
				"otherPossibleNames": [

				],
				"logicalName": "LISTENING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx2",
				"otherPossibleNames": [

				],
				"logicalName": "SPEAKING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx3",
				"otherPossibleNames": [

				],
				"logicalName": "READING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx4",
				"otherPossibleNames": [

				],
				"logicalName": "WRITING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AccommodationsIndicator",
				"otherPossibleNames": [

				],
				"logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DesignatedSupportIndicator",
				"otherPossibleNames": [

				],
				"logicalName": "DESIGNATED_SUPPORT_AVAILABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAmericanSignLanguage1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AMERICAN_SIGN_LANGUAGE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAmericanSignLanguage2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AMERICAN_SIGN_LANGUAGE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioTranscript1",
				"otherPossibleNames": [
					"EAAudioScript1"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioTranscript2",
				"otherPossibleNames": [
					"EAAudioScript2"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioTranscript3",
				"otherPossibleNames": [
					"EAAudioScript3"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioTranscript4",
				"otherPossibleNames": [
					"EAAudioScript4"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAText-to-Speech1",
				"otherPossibleNames": [
					"EATexttoSpeech1"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAText-to-Speech2",
				"otherPossibleNames": [
					"EATexttoSpeech2"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAText-to-Speech4",
				"otherPossibleNames": [
					"EATexttoSpeech4"
				],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 162
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 163
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 164
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 165
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 166
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 167
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 168
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 169
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 170
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 171
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 172
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 173
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 174
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 175
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 176
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 177
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 178
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 179
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 180
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 181
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 182
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 183
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 184
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 185
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 186
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 187
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 188
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPauseorReplayAudio1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_-_LISTENING_DOMAIN_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 189
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPauseorReplayAudio2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_-_SPEAKING_DOMAIN_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 190
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 191
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 192
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 193
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 194
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 195
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 196
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 197
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 198
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 199
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 200
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 201
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 202
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool1",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 203
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool2",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 204
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool3",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 205
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool4",
				"otherPossibleNames": [

				],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 206
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 207
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 208
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 209
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION__ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 210
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 211
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 212
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 213
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 214
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 215
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 216
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 217
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 218
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 219
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 220
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 221
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 222
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 223
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 224
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 225
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 226
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 227
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 228
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 229
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 230
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 231
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 232
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 233
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 234
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 235
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 236
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 237
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 238
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 239
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 240
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 241
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 242
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_PAPER_LISTENING_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 243
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_PAPER_SPEAKING_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 244
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-READ-ALOUD_ITEMS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 245
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 246
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 247
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 248
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 249
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 250
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 251
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 252
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 253
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections1",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 254
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections2",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 255
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections3",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 256
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections4",
				"otherPossibleNames": [

				],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 257
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted1",
				"otherPossibleNames": [

				],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 258
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted2",
				"otherPossibleNames": [

				],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 259
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted3",
				"otherPossibleNames": [

				],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 260
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted4",
				"otherPossibleNames": [

				],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 261
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank2",
				"otherPossibleNames": [

				],
				"logicalName": "BLANK_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 262
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank3",
				"otherPossibleNames": [

				],
				"logicalName": "BLANK_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 263
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressLine1",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_ADDRESS_LINE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 264
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressLine2",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_ADDRESS_LINE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 265
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressCityName",
				"otherPossibleNames": [

				],
				"logicalName": "STUDENT_ADDRESS_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 266
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentStateName",
				"otherPossibleNames": [
					"StudentAddressStateName"
				],
				"logicalName": "STUDENT_STATE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 267
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentZipCode",
				"otherPossibleNames": [
					"StudentAddressZipCode"
				],
				"logicalName": "STUDENT_ZIP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 268
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ScoreAvailableDate",
				"otherPossibleNames": [

				],
				"logicalName": "SCORE_AVAILABLE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 269
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedStatus",
				"otherPossibleNames": [

				],
				"logicalName": "TESTED_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 270
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [
					"Y",
					"N"
				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSREligible",
				"otherPossibleNames": [
					"SSR Eligible"
				],
				"logicalName": "SSREligible",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 271
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester1",
				"otherPossibleNames": [

				],
				"logicalName": "RemoteTester1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 272
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester2",
				"otherPossibleNames": [

				],
				"logicalName": "RemoteTester2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 273
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester3",
				"otherPossibleNames": [

				],
				"logicalName": "RemoteTester3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 274
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester4",
				"otherPossibleNames": [

				],
				"logicalName": "RemoteTester4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 275
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ForceComplete",
				"otherPossibleNames": [

				],
				"logicalName": "ForceComplete",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 276
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReportCreatedDate",
				"otherPossibleNames": [

				],
				"logicalName": "REPORT_CREATED_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 277
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EndofRecord",
				"otherPossibleNames": [

				],
				"logicalName": "END_OF_RECORD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 278
				},
				"fieldLength": 0,
				"fieldPrecision": null,
				"expectedValues": [

				],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	}
}