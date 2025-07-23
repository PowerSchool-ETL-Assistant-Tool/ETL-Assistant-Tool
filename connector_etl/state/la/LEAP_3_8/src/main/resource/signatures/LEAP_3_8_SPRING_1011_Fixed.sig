{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_3_8_SPRING_1011_Fixed",
    "recordLength": 3269,
    "naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR","FILE_CREATION_DATE_AND_TIME_STAMP", "DRC_UNIQUE_STUDENT_ID"],
		"fields": [{
				"physicalName": "Test Date Month",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_MONTH",
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
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Test Date Year",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 6,
					"columnNum": 2
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Straggler",
				"otherPossibleNames": [],
				"logicalName": "STRAGGLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 7,
					"columnNum": 3
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District Code",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 8,
					"offsetEnd": 10,
					"columnNum": 4
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Code",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 11,
					"offsetEnd": 13,
					"columnNum": 5
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District Name",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 14,
					"offsetEnd": 53,
					"columnNum": 6
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Name",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 54,
					"offsetEnd": 93,
					"columnNum": 7
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Grade",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 95,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 96,
					"offsetEnd": 107,
					"columnNum": 9
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student First Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 108,
					"offsetEnd": 115,
					"columnNum": 10
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 116,
					"offsetEnd": 116,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LASID",
				"otherPossibleNames": [],
				"logicalName": "LASID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 125,
					"columnNum": 12
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Barcode/Student Precode Number",
				"otherPossibleNames": [],
				"logicalName": "BARCODE/STUDENT_PRECODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 126,
					"offsetEnd": 134,
					"columnNum": 13
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Grade Placement",
				"otherPossibleNames": [],
				"logicalName": "LAP_GRADE_PLACEMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 135,
					"offsetEnd": 136,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded ELA",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 137,
					"offsetEnd": 137,
					"columnNum": 15
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Math",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 138,
					"offsetEnd": 138,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Science",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 139,
					"offsetEnd": 139,
					"columnNum": 17
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Social Studies",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 140,
					"offsetEnd": 140,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 144,
					"columnNum": 19
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized DOB Month",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_DOB_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 145,
					"offsetEnd": 146,
					"columnNum": 20
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized DOB Day",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_DOB_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 147,
					"offsetEnd": 148,
					"columnNum": 21
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized DOB Year",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_DOB_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 149,
					"offsetEnd": 152,
					"columnNum": 22
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Gender",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 153,
					"offsetEnd": 153,
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY/RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 154,
					"offsetEnd": 154,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Lunch Status",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LUNCH_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 155,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 156,
					"offsetEnd": 156,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Previously Attempted Tests - Document 1 (ELA/Math)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_PREVIOUSLY_ATTEMPTED_TESTS_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 157,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 158,
					"offsetEnd": 158,
					"columnNum": 28
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Previously Attempted Tests - Document 3 (ELA/Math)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_PREVIOUSLY_ATTEMPTED_TESTS_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 159,
					"offsetEnd": 159,
					"columnNum": 29
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Attended Remediation - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_ATTENDED_REMEDIATION_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 160,
					"offsetEnd": 160,
					"columnNum": 30
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Attended Remediation - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_ATTENDED_REMEDIATION_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 161,
					"offsetEnd": 161,
					"columnNum": 31
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 162,
					"offsetEnd": 162,
					"columnNum": 32
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Previously Attempted Tests - Document 3 (SCI/SOC)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_PREVIOUSLY_ATTEMPTED_TESTS_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 163,
					"offsetEnd": 163,
					"columnNum": 33
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 166,
					"columnNum": 34
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Gender",
				"otherPossibleNames": [],
				"logicalName": "EDIRECT_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 167,
					"offsetEnd": 167,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Ethnicity/Race",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_ETHNICITY_RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 168,
					"offsetEnd": 168,
					"columnNum": 36
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 169,
					"offsetEnd": 169,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP March Update Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_MARCH_UPDATE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 170,
					"offsetEnd": 170,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Gender",
				"otherPossibleNames": [],
				"logicalName": "LAP_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 171,
					"offsetEnd": 171,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LEAP Promotional Status",
				"otherPossibleNames": [],
				"logicalName": "LEAP_PROMOTIONAL_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 172,
					"offsetEnd": 172,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LEAP Remediation Eligibility",
				"otherPossibleNames": [],
				"logicalName": "LEAP_REMEDIATION_ELIGIBILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 173,
					"offsetEnd": 173,
					"columnNum": 41
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LEAP Summer Test Eligibility",
				"otherPossibleNames": [],
				"logicalName": "LEAP_SUMMER_TEST_ELIGIBILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 174,
					"offsetEnd": 174,
					"columnNum": 42
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 175,
					"offsetEnd": 177,
					"columnNum": 43
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 178,
					"offsetEnd": 178,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 179,
					"offsetEnd": 179,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Migrant Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_MIGRANT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 180,
					"offsetEnd": 180,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Economically Disadvantaged",
				"otherPossibleNames": [],
				"logicalName": "LAP_ECONOMICALLY_DISADVANTAGED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 181,
					"offsetEnd": 181,
					"columnNum": 47
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP McKinney-Vento (Homeless) Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_MCKINNEY-VENTO_(HOMELESS)_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 182,
					"offsetEnd": 182,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded McKinney-Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "EDIRECT_MCKINNEY-VENTO_(HOMELESS)_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 183,
					"offsetEnd": 183,
					"columnNum": 49
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized McKinney-Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_MCKINNEY-VENTO_ACT_(HOMELESS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 184,
					"offsetEnd": 184,
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 185,
					"offsetEnd": 187,
					"columnNum": 51
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 188,
					"offsetEnd": 195,
					"columnNum": 52
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 196,
					"offsetEnd": 196,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Lunch Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_LUNCH_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 197,
					"offsetEnd": 197,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Education Classification",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 198,
					"offsetEnd": 198,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 199,
					"offsetEnd": 200,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Gender",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 201,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 202,
					"offsetEnd": 202,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Calculator Use (Math Only)",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 203,
					"offsetEnd": 203,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Hispanic/Latino",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC/LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 204,
					"offsetEnd": 204,
					"columnNum": 60
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 205,
					"offsetEnd": 205,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 206,
					"offsetEnd": 206,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Black or African American",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 207,
					"offsetEnd": 207,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 208,
					"offsetEnd": 208,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 209,
					"offsetEnd": 209,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled McKinney-Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 210,
					"offsetEnd": 210,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 221,
					"columnNum": 67
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 222,
					"offsetEnd": 222,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 223,
					"offsetEnd": 223,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 224,
					"offsetEnd": 224,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 225,
					"offsetEnd": 225,
					"columnNum": 71
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 226,
					"offsetEnd": 226,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 227,
					"offsetEnd": 227,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 228,
					"offsetEnd": 228,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 229,
					"offsetEnd": 229,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 230,
					"offsetEnd": 230,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 231,
					"offsetEnd": 231,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 232,
					"offsetEnd": 232,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 233,
					"offsetEnd": 238,
					"columnNum": 79
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Limited English Proficient (LEP) Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 239,
					"offsetEnd": 239,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 240,
					"offsetEnd": 240,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 241,
					"offsetEnd": 241,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 242,
					"offsetEnd": 242,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
				"otherPossibleNames": [],
				"logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 243,
					"offsetEnd": 243,
					"columnNum": 84
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 244,
					"offsetEnd": 244,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 245,
					"offsetEnd": 245,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 246,
					"offsetEnd": 250,
					"columnNum": 87
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 251,
					"offsetEnd": 251,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 252,
					"offsetEnd": 252,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 253,
					"offsetEnd": 253,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 254,
					"offsetEnd": 254,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 255,
					"offsetEnd": 255,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 256,
					"offsetEnd": 256,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 257,
					"offsetEnd": 257,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 258,
					"offsetEnd": 258,
					"columnNum": 95
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 259,
					"offsetEnd": 259,
					"columnNum": 96
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 260,
					"offsetEnd": 260,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 261,
					"offsetEnd": 261,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 262,
					"offsetEnd": 262,
					"columnNum": 99
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 263,
					"offsetEnd": 272,
					"columnNum": 100
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Optional Local Use",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 273,
					"offsetEnd": 282,
					"columnNum": 101
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Accountability Code",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 283,
					"offsetEnd": 284,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 285,
					"offsetEnd": 290,
					"columnNum": 103
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Subjects for LEAP Tutoring",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_SUBJECTS_FOR_LEAP_TUTORING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 291,
					"offsetEnd": 291,
					"columnNum": 104
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 292,
					"offsetEnd": 301,
					"columnNum": 105
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 302,
					"offsetEnd": 309,
					"columnNum": 106
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 310,
					"offsetEnd": 324,
					"columnNum": 107
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 325,
					"offsetEnd": 325,
					"columnNum": 108
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Lunch Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_LUNCH_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 326,
					"offsetEnd": 326,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Education Classification",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 327,
					"offsetEnd": 327,
					"columnNum": 110
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 328,
					"offsetEnd": 329,
					"columnNum": 111
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Gender",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 330,
					"offsetEnd": 330,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 331,
					"offsetEnd": 331,
					"columnNum": 113
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Calculator Use (Math Only)",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 332,
					"offsetEnd": 332,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Hispanic/Latino",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC/LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 333,
					"offsetEnd": 333,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 334,
					"offsetEnd": 334,
					"columnNum": 116
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 335,
					"offsetEnd": 335,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Black or African American",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 336,
					"offsetEnd": 336,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 337,
					"offsetEnd": 337,
					"columnNum": 119
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 338,
					"offsetEnd": 338,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled McKinney-Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 339,
					"offsetEnd": 339,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 340,
					"offsetEnd": 350,
					"columnNum": 122
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 351,
					"offsetEnd": 351,
					"columnNum": 123
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 352,
					"offsetEnd": 352,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 353,
					"offsetEnd": 353,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 354,
					"offsetEnd": 354,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 355,
					"offsetEnd": 355,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 356,
					"offsetEnd": 356,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 357,
					"offsetEnd": 357,
					"columnNum": 129
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 358,
					"offsetEnd": 358,
					"columnNum": 130
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 359,
					"offsetEnd": 359,
					"columnNum": 131
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 360,
					"offsetEnd": 360,
					"columnNum": 132
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 361,
					"offsetEnd": 361,
					"columnNum": 133
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 362,
					"offsetEnd": 367,
					"columnNum": 134
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Limited English Proficient (LEP) Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 368,
					"offsetEnd": 368,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 369,
					"offsetEnd": 369,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 370,
					"offsetEnd": 370,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 371,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
				"otherPossibleNames": [],
				"logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 372,
					"offsetEnd": 372,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_READ_ALOUD/CLARIFIED_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 373,
					"offsetEnd": 373,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 374,
					"offsetEnd": 374,
					"columnNum": 141
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 375,
					"offsetEnd": 379,
					"columnNum": 142
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 380,
					"offsetEnd": 380,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 381,
					"offsetEnd": 381,
					"columnNum": 144
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 382,
					"offsetEnd": 382,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 383,
					"offsetEnd": 383,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 384,
					"offsetEnd": 384,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 385,
					"offsetEnd": 385,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 386,
					"offsetEnd": 386,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 387,
					"offsetEnd": 387,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 388,
					"offsetEnd": 388,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 389,
					"offsetEnd": 389,
					"columnNum": 152
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 390,
					"offsetEnd": 390,
					"columnNum": 153
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 391,
					"offsetEnd": 391,
					"columnNum": 154
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 392,
					"offsetEnd": 401,
					"columnNum": 155
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Optional Local Use",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 402,
					"offsetEnd": 411,
					"columnNum": 156
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 412,
					"offsetEnd": 430,
					"columnNum": 157
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 431,
					"offsetEnd": 438,
					"columnNum": 158
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER ",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 439,
					"offsetEnd": 453,
					"columnNum": 159
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 454,
					"offsetEnd": 454,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Lunch Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_LUNCH_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 455,
					"offsetEnd": 455,
					"columnNum": 161
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Education Classification",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 456,
					"offsetEnd": 456,
					"columnNum": 162
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 457,
					"offsetEnd": 458,
					"columnNum": 163
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Gender",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 459,
					"offsetEnd": 459,
					"columnNum": 164
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 460,
					"offsetEnd": 460,
					"columnNum": 165
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Calculator Use (Math Only)",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 461,
					"offsetEnd": 461,
					"columnNum": 166
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Hispanic/Latino",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC/LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 462,
					"offsetEnd": 462,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 463,
					"offsetEnd": 463,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 464,
					"offsetEnd": 464,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Black or African American",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 465,
					"offsetEnd": 465,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 466,
					"offsetEnd": 466,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 467,
					"offsetEnd": 467,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled McKinney-Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 468,
					"offsetEnd": 468,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 469,
					"offsetEnd": 479,
					"columnNum": 174
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 480,
					"offsetEnd": 480,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 481,
					"offsetEnd": 481,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 482,
					"offsetEnd": 482,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 483,
					"offsetEnd": 483,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 484,
					"offsetEnd": 484,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 485,
					"offsetEnd": 485,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Script",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 486,
					"offsetEnd": 486,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 487,
					"offsetEnd": 487,
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 488,
					"offsetEnd": 488,
					"columnNum": 183
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 489,
					"offsetEnd": 489,
					"columnNum": 184
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 490,
					"offsetEnd": 490,
					"columnNum": 185
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 491,
					"offsetEnd": 496,
					"columnNum": 186
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Limited English Proficient (LEP) Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 497,
					"offsetEnd": 497,
					"columnNum": 187
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 498,
					"offsetEnd": 498,
					"columnNum": 188
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 499,
					"offsetEnd": 499,
					"columnNum": 189
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 500,
					"offsetEnd": 500,
					"columnNum": 190
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
				"otherPossibleNames": [],
				"logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 501,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 502,
					"offsetEnd": 502,
					"columnNum": 192
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 503,
					"offsetEnd": 503,
					"columnNum": 193
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 504,
					"offsetEnd": 508,
					"columnNum": 194
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 509,
					"offsetEnd": 509,
					"columnNum": 195
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 510,
					"offsetEnd": 510,
					"columnNum": 196
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 511,
					"offsetEnd": 511,
					"columnNum": 197
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 512,
					"offsetEnd": 512,
					"columnNum": 198
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 513,
					"offsetEnd": 513,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 514,
					"offsetEnd": 514,
					"columnNum": 200
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 515,
					"offsetEnd": 515,
					"columnNum": 201
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Script",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 516,
					"offsetEnd": 516,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 517,
					"offsetEnd": 517,
					"columnNum": 203
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 518,
					"offsetEnd": 518,
					"columnNum": 204
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 519,
					"offsetEnd": 519,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 520,
					"offsetEnd": 520,
					"columnNum": 206
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Subjects for LEAP Tutoring",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_SUBJECTS_FOR_LEAP_TUTORING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 521,
					"offsetEnd": 521,
					"columnNum": 207
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Accountability Code",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 522,
					"offsetEnd": 523,
					"columnNum": 208
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 524,
					"offsetEnd": 530,
					"columnNum": 209
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Optional Local Use",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 531,
					"offsetEnd": 540,
					"columnNum": 210
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 541,
					"offsetEnd": 691,
					"columnNum": 211
				},
				"fieldLength": 151,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "English Language Arts Item Responses",
				"otherPossibleNames": [],
				"logicalName": "ELA_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 692,
					"offsetEnd": 886,
					"columnNum": 212
				},
				"fieldLength": 195,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 887,
					"offsetEnd": 911,
					"columnNum": 213
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Math Item Responses",
				"otherPossibleNames": [],
				"logicalName": "MATH_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 912,
					"offsetEnd": 1106,
					"columnNum": 214
				},
				"fieldLength": 195,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1107,
					"offsetEnd": 1131,
					"columnNum": 215
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Science Item Responses",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1132,
					"offsetEnd": 1326,
					"columnNum": 216
				},
				"fieldLength": 195,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1327,
					"offsetEnd": 1351,
					"columnNum": 217
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Social Studies Item Responses",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1352,
					"offsetEnd": 1558,
					"columnNum": 218
				},
				"fieldLength": 207,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1559,
					"offsetEnd": 1571,
					"columnNum": 219
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Total - ELA",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1572,
					"offsetEnd": 1576,
					"columnNum": 220
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1577,
					"offsetEnd": 1579,
					"columnNum": 221
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Assessment Achievement Level - ELA",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1580,
					"offsetEnd": 1582,
					"columnNum": 222
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 1: Read, comprehend, and respond / Test Session: Reading and Responding",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_1_READ_COMPREHEND_AND_RESPOND_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1583,
					"offsetEnd": 1586,
					"columnNum": 223
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 2: Write competently / Test Session: Research to Build Knowledge",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_2_WRITE_COMPETENTLY_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1587,
					"offsetEnd": 1590,
					"columnNum": 224
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 3: Use conventions of language / Test Session: Writing",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_3_USE_CONVENTIONS_OF_LANGUAGE_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1591,
					"offsetEnd": 1594,
					"columnNum": 225
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 4: Not assessed / Test Session: Language",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_4_NOT_ASSESSED_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1595,
					"offsetEnd": 1598,
					"columnNum": 226
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 5: Locate, select, and synthesize information ",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_5_LOCATE_SELECT_AND_SYNTHESIZE_INFORMATION_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1599,
					"offsetEnd": 1602,
					"columnNum": 227
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 6: Read, analyze, and respond to literature ",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_6_READ_ANALYZE_AND_RESPOND_TO_LITERATURE_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1603,
					"offsetEnd": 1606,
					"columnNum": 228
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 7: Apply reasoning and problem-solving skills",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_7_APPLY_REASONING_AND_PROBLEM_SOLVING_SKILLS_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1607,
					"offsetEnd": 1610,
					"columnNum": 229
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1611,
					"offsetEnd": 1614,
					"columnNum": 230
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 1: Writing ",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_WRITING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1615,
					"offsetEnd": 1618,
					"columnNum": 231
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 2: Using Information Resources ",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_USING_INFORMATION_RESOURCES_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1619,
					"offsetEnd": 1622,
					"columnNum": 232
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 3: Reading and Responding",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_READING_AND_RESPONDING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1623,
					"offsetEnd": 1626,
					"columnNum": 233
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 4: Proofreading ",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_PROOFREADING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1627,
					"offsetEnd": 1630,
					"columnNum": 234
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1631,
					"offsetEnd": 1638,
					"columnNum": 235
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Dimension 1: Composing",
				"otherPossibleNames": [],
				"logicalName": "DIMENSION_1_COMPOSING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1639,
					"offsetEnd": 1642,
					"columnNum": 236
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Dimension 2: Style/audience awareness",
				"otherPossibleNames": [],
				"logicalName": "DIMENSION_2_STYLE_AUDIENCE_AWARENESS_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1643,
					"offsetEnd": 1646,
					"columnNum": 237
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Dimension 3: Sentence formation",
				"otherPossibleNames": [],
				"logicalName": "DIMENSION_3_SENTENCE_FORMATION_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1647,
					"offsetEnd": 1650,
					"columnNum": 238
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Dimension 4: Usage",
				"otherPossibleNames": [],
				"logicalName": "DIMENSION_4_USAGE_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1651,
					"offsetEnd": 1654,
					"columnNum": 239
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Dimension 5: Mechanics",
				"otherPossibleNames": [],
				"logicalName": "DIMENSION_5_MECHANICS_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1655,
					"offsetEnd": 1658,
					"columnNum": 240
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Dimension 6: Spelling",
				"otherPossibleNames": [],
				"logicalName": "DIMENSION_6_SPELLING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1659,
					"offsetEnd": 1662,
					"columnNum": 241
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1663,
					"offsetEnd": 1670,
					"columnNum": 242
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Total Score for Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1671,
					"offsetEnd": 1675,
					"columnNum": 243
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Score Code for Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_SCORE_CODE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1676,
					"offsetEnd": 1676,
					"columnNum": 244
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Multiple-Choice Items",
				"otherPossibleNames": [],
				"logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1677,
					"offsetEnd": 1679,
					"columnNum": 245
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Constructed-Response Items ",
				"otherPossibleNames": [],
				"logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1680,
					"offsetEnd": 1683,
					"columnNum": 246
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1684,
					"offsetEnd": 1684,
					"columnNum": 247
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM High ELA",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1685,
					"offsetEnd": 1687,
					"columnNum": 248
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "SEM Low ELA",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1688,
					"offsetEnd": 1690,
					"columnNum": 249
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "ELA Auto Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "ELA_AUTO_RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1691,
					"offsetEnd": 1691,
					"columnNum": 250
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1692,
					"offsetEnd": 1692,
					"columnNum": 251
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Total - Math",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1693,
					"offsetEnd": 1697,
					"columnNum": 252
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Scaled Score - Math",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1698,
					"offsetEnd": 1700,
					"columnNum": 253
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Assessment Achievement Level - Math",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1701,
					"offsetEnd": 1703,
					"columnNum": 254
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 1: Number and number relations / Domain: Operations and Algebraic Thinking / Reporting Category: Fractions",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_1_NUMBER_AND_NUMBER_RELATIONS_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1704,
					"offsetEnd": 1707,
					"columnNum": 255
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 2: Algebra / Domain: Number and Operations in Base Ten / Reporting Category: Measurement, Data, and Geometry",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_2_ALGEBRA_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1708,
					"offsetEnd": 1711,
					"columnNum": 256
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 3: Measurement / Domain: Number and Operations—Fractions / Reporting Category: Multiplication and Division",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_3_MEASUREMENT_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1712,
					"offsetEnd": 1715,
					"columnNum": 257
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 4: Geometry / Domain: Measurement and Data / Reporting Category: Number",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_4_GEOMETRY_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1716,
					"offsetEnd": 1719,
					"columnNum": 258
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 5: Data analysis, probability, & discrete math / Domain: Geometry / Reporting Category:  Number and Operations",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_5_DATA_ANALYSIS_PROBABILITY_&_DISCRETE_MATH_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1720,
					"offsetEnd": 1723,
					"columnNum": 259
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 6: Patterns, Relations, & Functions / Domain: Number System / Expressions and Equations / Reporting Category: Number System",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_6_PATTERNS_RELATIONS_&_FUNCTIONS_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1724,
					"offsetEnd": 1727,
					"columnNum": 260
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Reporting Category: Ratio, Proportion, and Algebra Domain: Functions",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_RATIO_PROPORTION_AND_ALGEBRA_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1728,
					"offsetEnd": 1731,
					"columnNum": 261
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER Domain: Statistics and Probability",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_STATISTICS_AND_PROBABILITY_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1732,
					"offsetEnd": 1735,
					"columnNum": 262
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 1: Multiple-Choice Items",
				"otherPossibleNames": [],
				"logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1736,
					"offsetEnd": 1739,
					"columnNum": 263
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 2: Constructed-Response Items ",
				"otherPossibleNames": [],
				"logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1740,
					"offsetEnd": 1743,
					"columnNum": 264
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1744,
					"offsetEnd": 1805,
					"columnNum": 265
				},
				"fieldLength": 62,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM High Math",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1806,
					"offsetEnd": 1808,
					"columnNum": 266
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM Low Math",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1809,
					"offsetEnd": 1811,
					"columnNum": 267
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Math Auto Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "MATH_AUTO_RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1812,
					"offsetEnd": 1812,
					"columnNum": 268
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1813,
					"offsetEnd": 1813,
					"columnNum": 269
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Total - Science",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1814,
					"offsetEnd": 1818,
					"columnNum": 270
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Score - Science",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1819,
					"offsetEnd": 1821,
					"columnNum": 271
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Assessment Achievement Level - Science",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1822,
					"offsetEnd": 1824,
					"columnNum": 272
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 1: Science as Inquiry",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_1_SCIENCE_AS_INQUIRY_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1825,
					"offsetEnd": 1828,
					"columnNum": 273
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 2: Physical Science",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_2_PHYSICAL_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1829,
					"offsetEnd": 1832,
					"columnNum": 274
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 3: Life Science",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_3_LIFE_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1833,
					"offsetEnd": 1836,
					"columnNum": 275
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 4: Earth and Space Science",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_4_EARTH_AND_SPACE_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1837,
					"offsetEnd": 1840,
					"columnNum": 276
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 5: Science and the Environment",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_5_SCIENCE_AND_THE_ENVIRONMENT_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1841,
					"offsetEnd": 1844,
					"columnNum": 277
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1845,
					"offsetEnd": 1856,
					"columnNum": 278
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 1: Multiple-Choice Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1857,
					"offsetEnd": 1860,
					"columnNum": 279
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 2: Short Answer Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_2_SHORT_ANSWER_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1861,
					"offsetEnd": 1864,
					"columnNum": 280
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 3: Comprehensive Science Task Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_3_TASK_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1865,
					"offsetEnd": 1868,
					"columnNum": 281
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1869,
					"offsetEnd": 1916,
					"columnNum": 282
				},
				"fieldLength": 48,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM High Science",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1917,
					"offsetEnd": 1919,
					"columnNum": 283
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM Low Science",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1920,
					"offsetEnd": 1922,
					"columnNum": 284
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Multiple-Choice Items",
				"otherPossibleNames": [],
				"logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1923,
					"offsetEnd": 1925,
					"columnNum": 285
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Constructed-Response Items ",
				"otherPossibleNames": [],
				"logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1926,
					"offsetEnd": 1929,
					"columnNum": 286
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1930,
					"offsetEnd": 1932,
					"columnNum": 287
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Science Auto Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_AUTO_RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1933,
					"offsetEnd": 1933,
					"columnNum": 288
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1934,
					"offsetEnd": 1934,
					"columnNum": 289
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Total - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1935,
					"offsetEnd": 1939,
					"columnNum": 290
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Scaled Score - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1940,
					"offsetEnd": 1942,
					"columnNum": 291
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Assessment Achievement Level - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1943,
					"offsetEnd": 1945,
					"columnNum": 292
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 1: Geography",
				"otherPossibleNames": [],
				"logicalName": "GEOGRAPHY_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1946,
					"offsetEnd": 1949,
					"columnNum": 293
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 2: Civics",
				"otherPossibleNames": [],
				"logicalName": "CIVICS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1950,
					"offsetEnd": 1953,
					"columnNum": 294
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 3: Economics",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1954,
					"offsetEnd": 1957,
					"columnNum": 295
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 4: History",
				"otherPossibleNames": [],
				"logicalName": "HISTORY_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1958,
					"offsetEnd": 1961,
					"columnNum": 296
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1962,
					"offsetEnd": 1977,
					"columnNum": 297
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 1: Multiple-Choice Items ",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1978,
					"offsetEnd": 1981,
					"columnNum": 298
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 2: Constructed-Response Items ",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_2_SHORT_ANSWER_ITEMS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1982,
					"offsetEnd": 1985,
					"columnNum": 299
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 3: Task Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_3_TASK_ITEMS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1986,
					"offsetEnd": 1989,
					"columnNum": 300
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Multiple-Choice Items",
				"otherPossibleNames": [],
				"logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1990,
					"offsetEnd": 1992,
					"columnNum": 301
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Constructed-Response Items ",
				"otherPossibleNames": [],
				"logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1993,
					"offsetEnd": 1996,
					"columnNum": 302
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1997,
					"offsetEnd": 2047,
					"columnNum": 303
				},
				"fieldLength": 51,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM High SS",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2048,
					"offsetEnd": 2050,
					"columnNum": 304
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM Low SS",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2051,
					"offsetEnd": 2053,
					"columnNum": 305
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Social Studies Auto Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_AUTO_RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2054,
					"offsetEnd": 2054,
					"columnNum": 306
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2055,
					"offsetEnd": 2055,
					"columnNum": 307
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2056,
					"offsetEnd": 2056,
					"columnNum": 308
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2057,
					"offsetEnd": 2057,
					"columnNum": 309
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2058,
					"offsetEnd": 2058,
					"columnNum": 310
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2059,
					"offsetEnd": 2059,
					"columnNum": 311
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MC / CR Taken - ELA",
				"otherPossibleNames": [],
				"logicalName": "MC_/_CR_TAKEN_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2060,
					"offsetEnd": 2060,
					"columnNum": 312
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "MC / CR Taken - Math",
				"otherPossibleNames": [],
				"logicalName": "MC_/_CR_TAKEN_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2061,
					"offsetEnd": 2061,
					"columnNum": 313
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "MC / CR Taken - Science",
				"otherPossibleNames": [],
				"logicalName": "MC_/_CR_TAKEN_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2062,
					"offsetEnd": 2062,
					"columnNum": 314
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "MC / CR Taken - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "MC_/_CR_TAKEN_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2063,
					"offsetEnd": 2063,
					"columnNum": 315
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 1 - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_1_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2064,
					"offsetEnd": 2064,
					"columnNum": 316
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 1 - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_1_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2065,
					"offsetEnd": 2065,
					"columnNum": 317
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 1 - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_1_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2066,
					"offsetEnd": 2066,
					"columnNum": 318
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 1 - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_1_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2067,
					"offsetEnd": 2067,
					"columnNum": 319
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 2 - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_2_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2068,
					"offsetEnd": 2068,
					"columnNum": 320
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 2 - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_2_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2069,
					"offsetEnd": 2069,
					"columnNum": 321
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 2 - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_2_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2070,
					"offsetEnd": 2070,
					"columnNum": 322
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Taken Flag - Phase 2 - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_PHASE_2_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2071,
					"offsetEnd": 2071,
					"columnNum": 323
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2072,
					"offsetEnd": 2073,
					"columnNum": 324
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Void Flag - ELA",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_VOID_FLAG_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2074,
					"offsetEnd": 2074,
					"columnNum": 325
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Void Flag - Math",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_VOID_FLAG_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2075,
					"offsetEnd": 2075,
					"columnNum": 326
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Void Flag - Science",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_VOID_FLAG_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2076,
					"offsetEnd": 2076,
					"columnNum": 327
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Void Flag - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_VOID_FLAG_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2077,
					"offsetEnd": 2077,
					"columnNum": 328
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2078,
					"offsetEnd": 2078,
					"columnNum": 329
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District Void Flag - ELA",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_VOID_FLAG_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2079,
					"offsetEnd": 2079,
					"columnNum": 330
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District Void Flag - Math",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_VOID_FLAG_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2080,
					"offsetEnd": 2080,
					"columnNum": 331
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District Void Flag - Science",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_VOID_FLAG_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2081,
					"offsetEnd": 2081,
					"columnNum": 332
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District Void Flag - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_VOID_FLAG_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2082,
					"offsetEnd": 2082,
					"columnNum": 333
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Plagiarism Void Flag - ELA",
				"otherPossibleNames": [],
				"logicalName": "PLAGIARISM_VOID_FLAG_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2083,
					"offsetEnd": 2083,
					"columnNum": 334
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Plagiarism Void Flag - Math",
				"otherPossibleNames": [],
				"logicalName": "PLAGIARISM_VOID_FLAG_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2084,
					"offsetEnd": 2084,
					"columnNum": 335
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Plagiarism Void Flag - Science",
				"otherPossibleNames": [],
				"logicalName": "PLAGIARISM_VOID_FLAG_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2085,
					"offsetEnd": 2085,
					"columnNum": 336
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Plagiarism Void Flag - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "PLAGIARISM_VOID_FLAG_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2086,
					"offsetEnd": 2086,
					"columnNum": 337
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2087,
					"offsetEnd": 2091,
					"columnNum": 338
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include in N-counts - ELA",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_IN_N-COUNTS_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2092,
					"offsetEnd": 2092,
					"columnNum": 339
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include in N-counts - Math",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_IN_N-COUNTS_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2093,
					"offsetEnd": 2093,
					"columnNum": 340
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include in N-counts - Science",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_IN_N-COUNTS_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2094,
					"offsetEnd": 2094,
					"columnNum": 341
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include in N-counts - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_IN_N-COUNTS_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2095,
					"offsetEnd": 2095,
					"columnNum": 342
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Handscoring Complete - ELA",
				"otherPossibleNames": [],
				"logicalName": "HANDSCORING_COMPLETE_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2096,
					"offsetEnd": 2096,
					"columnNum": 343
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Handscoring Complete - Math",
				"otherPossibleNames": [],
				"logicalName": "HANDSCORING_COMPLETE_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2097,
					"offsetEnd": 2097,
					"columnNum": 344
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Handscoring Complete - Science",
				"otherPossibleNames": [],
				"logicalName": "HANDSCORING_COMPLETE_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2098,
					"offsetEnd": 2098,
					"columnNum": 345
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Handscoring Complete - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "HANDSCORING_COMPLETE_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2099,
					"offsetEnd": 2099,
					"columnNum": 346
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 1",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2100,
					"offsetEnd": 2100,
					"columnNum": 347
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 2",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2101,
					"offsetEnd": 2101,
					"columnNum": 348
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 3",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2102,
					"offsetEnd": 2102,
					"columnNum": 349
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2103,
					"offsetEnd": 2103,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Education Classification Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_EDUCATION_CLASSIFICATION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2104,
					"offsetEnd": 2104,
					"columnNum": 351
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2105,
					"offsetEnd": 2105,
					"columnNum": 352
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Primary Exceptionality",
				"otherPossibleNames": [],
				"logicalName": "LAP_PRIMARY_EXCEPTIONALITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2106,
					"offsetEnd": 2107,
					"columnNum": 353
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "LAP_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2108,
					"offsetEnd": 2109,
					"columnNum": 354
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 1",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2110,
					"offsetEnd": 2110,
					"columnNum": 355
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 2",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2111,
					"offsetEnd": 2111,
					"columnNum": 356
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 3",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2112,
					"offsetEnd": 2112,
					"columnNum": 357
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2113,
					"offsetEnd": 2113,
					"columnNum": 358
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded LEP Status",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_LEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2114,
					"offsetEnd": 2114,
					"columnNum": 359
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2115,
					"offsetEnd": 2115,
					"columnNum": 360
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP LEP Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_LEP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2116,
					"offsetEnd": 2117,
					"columnNum": 361
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP LEP Indicator Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_LEP_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2118,
					"offsetEnd": 2118,
					"columnNum": 362
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Section 504 Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_SECTION_504_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2119,
					"offsetEnd": 2119,
					"columnNum": 363
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2120,
					"offsetEnd": 2120,
					"columnNum": 364
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 1",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2121,
					"offsetEnd": 2121,
					"columnNum": 365
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 2",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2122,
					"offsetEnd": 2122,
					"columnNum": 366
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 3",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2123,
					"offsetEnd": 2123,
					"columnNum": 367
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2124,
					"offsetEnd": 2124,
					"columnNum": 368
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2125,
					"offsetEnd": 2125,
					"columnNum": 369
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Testing Status - ELA",
				"otherPossibleNames": [],
				"logicalName": "TESTING_STATUS_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2126,
					"offsetEnd": 2126,
					"columnNum": 370
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Testing Status - Math",
				"otherPossibleNames": [],
				"logicalName": "TESTING_STATUS_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2127,
					"offsetEnd": 2127,
					"columnNum": 371
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Testing Status - Science",
				"otherPossibleNames": [],
				"logicalName": "TESTING_STATUS_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2128,
					"offsetEnd": 2128,
					"columnNum": 372
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Testing Status - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TESTING_STATUS_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2129,
					"offsetEnd": 2129,
					"columnNum": 373
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Option Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_OPTION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2130,
					"offsetEnd": 2130,
					"columnNum": 374
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Initial Tester for the most recent Spring test",
				"otherPossibleNames": [],
				"logicalName": "INITIAL_TESTER_FOR_MOST_RECENT_SPRING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2131,
					"offsetEnd": 2131,
					"columnNum": 375
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assess Group Type",
				"otherPossibleNames": [],
				"logicalName": "ASSESS_GROUP_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2132,
					"offsetEnd": 2133,
					"columnNum": 376
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Home Study/Nonpublic Flag",
				"otherPossibleNames": [],
				"logicalName": "HOME_STUDY/NONPUBLIC_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2134,
					"offsetEnd": 2134,
					"columnNum": 377
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Repeating Grade",
				"otherPossibleNames": [],
				"logicalName": "REPEATING_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2135,
					"offsetEnd": 2135,
					"columnNum": 378
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Charter Type",
				"otherPossibleNames": [],
				"logicalName": "CHARTER_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2136,
					"offsetEnd": 2136,
					"columnNum": 379
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - Document 1",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2137,
					"offsetEnd": 2144,
					"columnNum": 380
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - Document 1",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2145,
					"offsetEnd": 2150,
					"columnNum": 381
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2151,
					"offsetEnd": 2151,
					"columnNum": 382
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - Document 1",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2152,
					"offsetEnd": 2158,
					"columnNum": 383
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2159,
					"offsetEnd": 2161,
					"columnNum": 384
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - Document 2",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2162,
					"offsetEnd": 2169,
					"columnNum": 385
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - Document 2",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2170,
					"offsetEnd": 2175,
					"columnNum": 386
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2176,
					"offsetEnd": 2176,
					"columnNum": 387
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - Document 2",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2177,
					"offsetEnd": 2183,
					"columnNum": 388
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2184,
					"offsetEnd": 2186,
					"columnNum": 389
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - Document 3",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2187,
					"offsetEnd": 2194,
					"columnNum": 390
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - Document 3",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2195,
					"offsetEnd": 2200,
					"columnNum": 391
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2201,
					"offsetEnd": 2201,
					"columnNum": 392
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - Document 3",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2202,
					"offsetEnd": 2208,
					"columnNum": 393
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2209,
					"offsetEnd": 2229,
					"columnNum": 394
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code from Spring - ELA",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_SPRING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2230,
					"offsetEnd": 2231,
					"columnNum": 395
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code from Spring - Math",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_SPRING_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2232,
					"offsetEnd": 2233,
					"columnNum": 396
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code from Spring - Science",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_SPRING_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2234,
					"offsetEnd": 2235,
					"columnNum": 397
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code from Spring - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_SPRING_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2236,
					"offsetEnd": 2237,
					"columnNum": 398
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 1",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2238,
					"offsetEnd": 2239,
					"columnNum": 399
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 2",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2240,
					"offsetEnd": 2241,
					"columnNum": 400
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 3",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2242,
					"offsetEnd": 2243,
					"columnNum": 401
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2244,
					"offsetEnd": 2245,
					"columnNum": 402
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code - ELA",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2246,
					"offsetEnd": 2247,
					"columnNum": 403
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code - Math",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2248,
					"offsetEnd": 2249,
					"columnNum": 404
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code - Science",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2250,
					"offsetEnd": 2251,
					"columnNum": 405
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Accountability Code - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2252,
					"offsetEnd": 2253,
					"columnNum": 406
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2254,
					"offsetEnd": 2254,
					"columnNum": 407
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accountability Achievement Level - ELA",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2255,
					"offsetEnd": 2257,
					"columnNum": 408
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accountability Achievement Level - Math",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2258,
					"offsetEnd": 2260,
					"columnNum": 409
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accountability Achievement Level - Science",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2261,
					"offsetEnd": 2263,
					"columnNum": 410
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accountability Achievement Level - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2264,
					"offsetEnd": 2266,
					"columnNum": 411
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 1",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2267,
					"offsetEnd": 2267,
					"columnNum": 412
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 2",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2268,
					"offsetEnd": 2268,
					"columnNum": 413
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 3",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2269,
					"offsetEnd": 2269,
					"columnNum": 414
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2270,
					"offsetEnd": 2270,
					"columnNum": 415
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Home-base Site District Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_HOME_BASE_SITE_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2271,
					"offsetEnd": 2273,
					"columnNum": 416
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Home-base Site School Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_HOME_BASE_SITE_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2274,
					"offsetEnd": 2276,
					"columnNum": 417
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Scholarship Student Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_SCHOLARSHIP_STUDENT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2277,
					"offsetEnd": 2277,
					"columnNum": 418
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Scholarship Site Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_SCHOLARSHIP_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2278,
					"offsetEnd": 2283,
					"columnNum": 419
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2284,
					"offsetEnd": 2286,
					"columnNum": 420
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Twin Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_TWIN_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2287,
					"offsetEnd": 2287,
					"columnNum": 421
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2288,
					"offsetEnd": 2299,
					"columnNum": 422
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous ELA Scaled Score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ELA_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2300,
					"offsetEnd": 2302,
					"columnNum": 423
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous ELA Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ELA_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2303,
					"offsetEnd": 2305,
					"columnNum": 424
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous ELA Administration",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ELA_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2306,
					"offsetEnd": 2315,
					"columnNum": 425
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Math Scaled Score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_MATH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2316,
					"offsetEnd": 2318,
					"columnNum": 426
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Math Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_MATH_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2319,
					"offsetEnd": 2321,
					"columnNum": 427
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Math Administration",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_MATH_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2322,
					"offsetEnd": 2331,
					"columnNum": 428
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Science Scaled Score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCIENCE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2332,
					"offsetEnd": 2334,
					"columnNum": 429
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Science Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCIENCE_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2335,
					"offsetEnd": 2337,
					"columnNum": 430
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Science Administration",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCIENCE_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2338,
					"offsetEnd": 2347,
					"columnNum": 431
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Social Studies Scaled Score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SOCIAL_STUDIES_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2348,
					"offsetEnd": 2350,
					"columnNum": 432
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Social Studies Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SOCIAL_STUDIES_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2351,
					"offsetEnd": 2353,
					"columnNum": 433
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Highest Previous Social Studies Administration",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SOCIAL_STUDIES_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2354,
					"offsetEnd": 2363,
					"columnNum": 434
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Scaled Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "SPRING_SCALED_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2364,
					"offsetEnd": 2366,
					"columnNum": 435
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Assessment Achievement Level - ELA",
				"otherPossibleNames": [],
				"logicalName": "SPRING_ASSESSMENT_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2367,
					"offsetEnd": 2369,
					"columnNum": 436
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Scaled Score - Math",
				"otherPossibleNames": [],
				"logicalName": "SPRING_SCALED_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2370,
					"offsetEnd": 2372,
					"columnNum": 437
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Assessment Achievement Level - Math",
				"otherPossibleNames": [],
				"logicalName": "SPRING_ASSESSMENT_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2373,
					"offsetEnd": 2375,
					"columnNum": 438
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Scaled Score - Science",
				"otherPossibleNames": [],
				"logicalName": "SPRING_SCALED_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2376,
					"offsetEnd": 2378,
					"columnNum": 439
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Assessment Achievement Level  - Science",
				"otherPossibleNames": [],
				"logicalName": "SPRING_ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2379,
					"offsetEnd": 2381,
					"columnNum": 440
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Scaled Score - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SPRING_SCALED_SCORE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2382,
					"offsetEnd": 2384,
					"columnNum": 441
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spring Assessment Achievement Level - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SPRING_ASSESSMENT_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2385,
					"offsetEnd": 2387,
					"columnNum": 442
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2388,
					"offsetEnd": 2391,
					"columnNum": 443
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Previously Taken Subject - ELA",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_TAKEN_SUBJECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2392,
					"offsetEnd": 2392,
					"columnNum": 444
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Previously Taken Subject - Math",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_TAKEN_SUBJECT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2393,
					"offsetEnd": 2393,
					"columnNum": 445
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Previously Taken Subject - Science",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_TAKEN_SUBJECT_SCEINCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2394,
					"offsetEnd": 2394,
					"columnNum": 446
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Previously Taken Subject - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_TAKEN_SUBJECT_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2395,
					"offsetEnd": 2395,
					"columnNum": 447
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Scaled Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_SCALED_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2396,
					"offsetEnd": 2398,
					"columnNum": 448
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Assessment Achievement Level - ELA",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_ASSESSMENT_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2399,
					"offsetEnd": 2401,
					"columnNum": 449
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2402,
					"offsetEnd": 2403,
					"columnNum": 450
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Scaled Score - Math",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_SCALED_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2404,
					"offsetEnd": 2406,
					"columnNum": 451
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Assessment Achievement Level - Math",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_ASSESSMENT_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2407,
					"offsetEnd": 2409,
					"columnNum": 452
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2410,
					"offsetEnd": 2411,
					"columnNum": 453
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Scaled Score - Science",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_SCALED_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2412,
					"offsetEnd": 2414,
					"columnNum": 454
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Assessment Achievement Level - Science",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2415,
					"offsetEnd": 2417,
					"columnNum": 455
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2418,
					"offsetEnd": 2419,
					"columnNum": 456
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Scaled Score - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_SCALED_SCORE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2420,
					"offsetEnd": 2422,
					"columnNum": 457
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summer Assessment Achievement Level - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SUMMER_ASSESSMENT_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2423,
					"offsetEnd": 2425,
					"columnNum": 458
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2426,
					"offsetEnd": 2472,
					"columnNum": 459
				},
				"fieldLength": 47,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Gifted",
				"otherPossibleNames": [],
				"logicalName": "GIFTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2473,
					"offsetEnd": 2473,
					"columnNum": 460
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Talented",
				"otherPossibleNames": [],
				"logicalName": "TALENTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2474,
					"offsetEnd": 2474,
					"columnNum": 461
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Autism",
				"otherPossibleNames": [],
				"logicalName": "AUTISM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2475,
					"offsetEnd": 2475,
					"columnNum": 462
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Deafblindness",
				"otherPossibleNames": [],
				"logicalName": "DEAFBLINDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2476,
					"offsetEnd": 2476,
					"columnNum": 463
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Developmental Delay",
				"otherPossibleNames": [],
				"logicalName": "DEVELOPMENTAL_DELAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2477,
					"offsetEnd": 2477,
					"columnNum": 464
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Emotional Disturbance",
				"otherPossibleNames": [],
				"logicalName": "EMOTIONAL_DISTURBANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2478,
					"offsetEnd": 2478,
					"columnNum": 465
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HI-Deaf",
				"otherPossibleNames": [],
				"logicalName": "HI_DEAF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2479,
					"offsetEnd": 2479,
					"columnNum": 466
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HI - Hard of Hearing",
				"otherPossibleNames": [],
				"logicalName": "HI_-_HARD_OF_HEARING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2480,
					"offsetEnd": 2480,
					"columnNum": 467
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Mild Mental Disability",
				"otherPossibleNames": [],
				"logicalName": "MILD_MENTAL_DISABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2481,
					"offsetEnd": 2481,
					"columnNum": 468
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Moderate Mental Disabilities",
				"otherPossibleNames": [],
				"logicalName": "MODERATE_MENTAL_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2482,
					"offsetEnd": 2482,
					"columnNum": 469
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Orthopedic Impairment",
				"otherPossibleNames": [],
				"logicalName": "ORTHOPEDIC_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2483,
					"offsetEnd": 2483,
					"columnNum": 470
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Health Impairments",
				"otherPossibleNames": [],
				"logicalName": "OTHER_HEALTH_IMPAIRMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2484,
					"offsetEnd": 2484,
					"columnNum": 471
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Specific Learning Disabilities",
				"otherPossibleNames": [],
				"logicalName": "SPECIFIC_LEARNING_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2485,
					"offsetEnd": 2485,
					"columnNum": 472
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Speech or Language Impairment",
				"otherPossibleNames": [],
				"logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2486,
					"offsetEnd": 2486,
					"columnNum": 473
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Traumatic Brain Injury",
				"otherPossibleNames": [],
				"logicalName": "TRAUMATIC_BRAIN_INJURY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2487,
					"offsetEnd": 2487,
					"columnNum": 474
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Visual Impairment",
				"otherPossibleNames": [],
				"logicalName": "VISUAL_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2488,
					"offsetEnd": 2488,
					"columnNum": 475
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2489,
					"offsetEnd": 2489,
					"columnNum": 476
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2490,
					"offsetEnd": 2500,
					"columnNum": 477
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Gifted",
				"otherPossibleNames": [],
				"logicalName": "GIFTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2501,
					"offsetEnd": 2501,
					"columnNum": 478
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Talented",
				"otherPossibleNames": [],
				"logicalName": "TALENTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2502,
					"offsetEnd": 2502,
					"columnNum": 479
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Autism",
				"otherPossibleNames": [],
				"logicalName": "AUTISM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2503,
					"offsetEnd": 2503,
					"columnNum": 480
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Deafblindness",
				"otherPossibleNames": [],
				"logicalName": "DEAFBLINDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2504,
					"offsetEnd": 2504,
					"columnNum": 481
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Developmental Delay",
				"otherPossibleNames": [],
				"logicalName": "DEVELOPMENTAL_DELAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2505,
					"offsetEnd": 2505,
					"columnNum": 482
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Emotional Disturbance",
				"otherPossibleNames": [],
				"logicalName": "EMOTIONAL_DISTURBANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2506,
					"offsetEnd": 2506,
					"columnNum": 483
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HI-Deaf",
				"otherPossibleNames": [],
				"logicalName": "HI_DEAF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2507,
					"offsetEnd": 2507,
					"columnNum": 484
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HI - Hard of Hearing",
				"otherPossibleNames": [],
				"logicalName": "HI_-_HARD_OF_HEARING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2508,
					"offsetEnd": 2508,
					"columnNum": 485
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Mild Mental Disability",
				"otherPossibleNames": [],
				"logicalName": "MILD_MENTAL_DISABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2509,
					"offsetEnd": 2509,
					"columnNum": 486
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Moderate Mental Disabilities",
				"otherPossibleNames": [],
				"logicalName": "MODERATE_MENTAL_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2510,
					"offsetEnd": 2510,
					"columnNum": 487
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Orthopedic Impairment",
				"otherPossibleNames": [],
				"logicalName": "ORTHOPEDIC_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2511,
					"offsetEnd": 2511,
					"columnNum": 488
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Health Impairments",
				"otherPossibleNames": [],
				"logicalName": "OTHER_HEALTH_IMPAIRMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2512,
					"offsetEnd": 2512,
					"columnNum": 489
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Specific Learning Disabilities",
				"otherPossibleNames": [],
				"logicalName": "SPECIFIC_LEARNING_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2513,
					"offsetEnd": 2513,
					"columnNum": 490
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Speech or Language Impairment",
				"otherPossibleNames": [],
				"logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2514,
					"offsetEnd": 2514,
					"columnNum": 491
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Traumatic Brain Injury",
				"otherPossibleNames": [],
				"logicalName": "TRAUMATIC_BRAIN_INJURY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2515,
					"offsetEnd": 2515,
					"columnNum": 492
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Visual Impairment",
				"otherPossibleNames": [],
				"logicalName": "VISUAL_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2516,
					"offsetEnd": 2516,
					"columnNum": 493
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2517,
					"offsetEnd": 2517,
					"columnNum": 494
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2518,
					"offsetEnd": 2528,
					"columnNum": 495
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Gifted",
				"otherPossibleNames": [],
				"logicalName": "GIFTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2529,
					"offsetEnd": 2529,
					"columnNum": 496
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Talented",
				"otherPossibleNames": [],
				"logicalName": "TALENTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2530,
					"offsetEnd": 2530,
					"columnNum": 497
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Autism",
				"otherPossibleNames": [],
				"logicalName": "AUTISM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2531,
					"offsetEnd": 2531,
					"columnNum": 498
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Deafblindness",
				"otherPossibleNames": [],
				"logicalName": "DEAFBLINDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2532,
					"offsetEnd": 2532,
					"columnNum": 499
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Developmental Delay",
				"otherPossibleNames": [],
				"logicalName": "DEVELOPMENTAL_DELAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2533,
					"offsetEnd": 2533,
					"columnNum": 500
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Emotional Disturbance",
				"otherPossibleNames": [],
				"logicalName": "EMOTIONAL_DISTURBANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2534,
					"offsetEnd": 2534,
					"columnNum": 501
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HI-Deaf",
				"otherPossibleNames": [],
				"logicalName": "HI-DEAF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2535,
					"offsetEnd": 2535,
					"columnNum": 502
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HI-Hard of Hearing",
				"otherPossibleNames": [],
				"logicalName": "HI-HARD_OF_HEARING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2536,
					"offsetEnd": 2536,
					"columnNum": 503
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Mild Mental Disability",
				"otherPossibleNames": [],
				"logicalName": "MILD_MENTAL_DISABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2537,
					"offsetEnd": 2537,
					"columnNum": 504
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Moderate Mental Disabilities",
				"otherPossibleNames": [],
				"logicalName": "MODERATE_MENTAL_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2538,
					"offsetEnd": 2538,
					"columnNum": 505
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Orthopedic Impairment",
				"otherPossibleNames": [],
				"logicalName": "ORTHOPEDIC_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2539,
					"offsetEnd": 2539,
					"columnNum": 506
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Health Impairments",
				"otherPossibleNames": [],
				"logicalName": "OTHER_HEALTH_IMPAIRMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2540,
					"offsetEnd": 2540,
					"columnNum": 507
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Specific Learning Disabilities",
				"otherPossibleNames": [],
				"logicalName": "SPECIFIC_LEARNING_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2541,
					"offsetEnd": 2541,
					"columnNum": 508
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Speech or Language Impairment",
				"otherPossibleNames": [],
				"logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2542,
					"offsetEnd": 2542,
					"columnNum": 509
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Traumatic Brain Injury",
				"otherPossibleNames": [],
				"logicalName": "TRAUMATIC_BRAIN_INJURY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2543,
					"offsetEnd": 2543,
					"columnNum": 510
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Visual Impairment",
				"otherPossibleNames": [],
				"logicalName": "VISUAL_IMPAIRMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2544,
					"offsetEnd": 2544,
					"columnNum": 511
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2545,
					"offsetEnd": 2545,
					"columnNum": 512
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2546,
					"offsetEnd": 2602,
					"columnNum": 513
				},
				"fieldLength": 57,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Site code",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2603,
					"offsetEnd": 2608,
					"columnNum": 514
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Site code - Document 1",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2609,
					"offsetEnd": 2614,
					"columnNum": 515
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Site code - Document 2",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2615,
					"offsetEnd": 2620,
					"columnNum": 516
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Site code - Document 3",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2621,
					"offsetEnd": 2626,
					"columnNum": 517
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2627,
					"offsetEnd": 2632,
					"columnNum": 518
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Hispanic/Latino",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC/LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2633,
					"offsetEnd": 2633,
					"columnNum": 519
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2634,
					"offsetEnd": 2634,
					"columnNum": 520
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2635,
					"offsetEnd": 2635,
					"columnNum": 521
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Black or African American",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2636,
					"offsetEnd": 2636,
					"columnNum": 522
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2637,
					"offsetEnd": 2637,
					"columnNum": 523
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2638,
					"offsetEnd": 2638,
					"columnNum": 524
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 1",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY_RACE_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2639,
					"offsetEnd": 2639,
					"columnNum": 525
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 2",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY_RACE_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2640,
					"offsetEnd": 2640,
					"columnNum": 526
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 3",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY_RACE_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2641,
					"offsetEnd": 2641,
					"columnNum": 527
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2642,
					"offsetEnd": 2732,
					"columnNum": 528
				},
				"fieldLength": 91,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Rollup to State",
				"otherPossibleNames": [],
				"logicalName": "ROLLUP_TO_STATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2733,
					"offsetEnd": 2733,
					"columnNum": 529
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include in District Media Reports",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_IN_DISTRICT_MEDIA_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2734,
					"offsetEnd": 2734,
					"columnNum": 530
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include in School Media Reports",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_IN_SCHOOL_MEDIA_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2735,
					"offsetEnd": 2735,
					"columnNum": 531
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarize to Assessment Group Code for district level reporting",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZE_TO_ASSESSMENT_GROUP_CODE_FOR_DISTRICT_LEVEL_REPORTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2736,
					"offsetEnd": 2736,
					"columnNum": 532
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Show 'N/A' in place of district results on school reports",
				"otherPossibleNames": [],
				"logicalName": "SHOW_'N/A'_IN_PLACE_OF_DISTRICT_RESULTS_ON_SCHOOL_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2737,
					"offsetEnd": 2737,
					"columnNum": 533
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Schools summarized to LEA Code for district level reporting",
				"otherPossibleNames": [],
				"logicalName": "SCHOOLS_SUMMARIZED_TO_LEA_CODE_FOR_DISTRICT_LEVEL_REPORTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2738,
					"offsetEnd": 2738,
					"columnNum": 534
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District reports go to district",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_REPORTS_GO_TO_DISTRICT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2739,
					"offsetEnd": 2739,
					"columnNum": 535
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "District report goes to LDE",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_REPORT_GOES_TO_LDE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2740,
					"offsetEnd": 2740,
					"columnNum": 536
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Cleanup reports",
				"otherPossibleNames": [],
				"logicalName": "CLEANUP_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2741,
					"offsetEnd": 2741,
					"columnNum": 537
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summary Reports",
				"otherPossibleNames": [],
				"logicalName": "SUMMARY_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2742,
					"offsetEnd": 2742,
					"columnNum": 538
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Erasure Reports",
				"otherPossibleNames": [],
				"logicalName": "ERASURE_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2743,
					"offsetEnd": 2743,
					"columnNum": 539
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Roster Reports",
				"otherPossibleNames": [],
				"logicalName": "ROSTER_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2744,
					"offsetEnd": 2744,
					"columnNum": 540
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remediation Reports",
				"otherPossibleNames": [],
				"logicalName": "REMEDIATION_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2745,
					"offsetEnd": 2745,
					"columnNum": 541
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Reports",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2746,
					"offsetEnd": 2746,
					"columnNum": 542
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Labels",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LABELS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2747,
					"offsetEnd": 2747,
					"columnNum": 543
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2748,
					"offsetEnd": 2748,
					"columnNum": 544
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Roster - ELA/Math",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER_-_ELA/MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2749,
					"offsetEnd": 2749,
					"columnNum": 545
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Roster  - Science/Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER_-_SCIENCE/SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2750,
					"offsetEnd": 2750,
					"columnNum": 546
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remediation Report - ELA/Math",
				"otherPossibleNames": [],
				"logicalName": "REMEDIATION_REPORT_-_ELA/MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2751,
					"offsetEnd": 2751,
					"columnNum": 547
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remediation Report - Science/Social Studies",
				"otherPossibleNames": [],
				"logicalName": "REMEDIATION_REPORT_-_SCIENCE/SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2752,
					"offsetEnd": 2752,
					"columnNum": 548
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report - ELA/Math",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_-_ELA/MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2753,
					"offsetEnd": 2753,
					"columnNum": 549
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report - Science/Social",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_-_SCIENCE/SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2754,
					"offsetEnd": 2754,
					"columnNum": 550
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Label ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2755,
					"offsetEnd": 2755,
					"columnNum": 551
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2756,
					"offsetEnd": 2756,
					"columnNum": 552
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report Link",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_LINK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2757,
					"offsetEnd": 2757,
					"columnNum": 553
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2758,
					"offsetEnd": 2788,
					"columnNum": 554
				},
				"fieldLength": 31,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Partial Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2789,
					"offsetEnd": 2789,
					"columnNum": 555
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Eligible for Appeal - ELA",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2790,
					"offsetEnd": 2790,
					"columnNum": 556
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Retesting Subject - ELA",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2791,
					"offsetEnd": 2791,
					"columnNum": 557
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Passed, Summer remediation is optional - ELA",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2792,
					"offsetEnd": 2792,
					"columnNum": 558
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote/Verbiage: Previously Passed Subject - ELA",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2793,
					"offsetEnd": 2793,
					"columnNum": 559
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Test Security Violation (Void) - ELA",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2794,
					"offsetEnd": 2794,
					"columnNum": 560
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2795,
					"offsetEnd": 2798,
					"columnNum": 561
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Partial Score - Math",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2799,
					"offsetEnd": 2799,
					"columnNum": 562
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Eligible for Appeal - Math",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2800,
					"offsetEnd": 2800,
					"columnNum": 563
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Retesting Subject - Math",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2801,
					"offsetEnd": 2801,
					"columnNum": 564
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Passed, Summer remediation is optional - Math",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2802,
					"offsetEnd": 2802,
					"columnNum": 565
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote/Verbiage: Previously Passed Subject - Math",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2803,
					"offsetEnd": 2803,
					"columnNum": 566
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Test Security Violation (Void) - Math",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2804,
					"offsetEnd": 2804,
					"columnNum": 567
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2805,
					"offsetEnd": 2808,
					"columnNum": 568
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2809,
					"offsetEnd": 2810,
					"columnNum": 569
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Retesting Subject - Science",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2811,
					"offsetEnd": 2811,
					"columnNum": 570
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2812,
					"offsetEnd": 2812,
					"columnNum": 571
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote/Verbiage: Previously Passed Subject - Science",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2813,
					"offsetEnd": 2813,
					"columnNum": 572
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Test Security Violation (Void) - Science",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2814,
					"offsetEnd": 2814,
					"columnNum": 573
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2815,
					"offsetEnd": 2818,
					"columnNum": 574
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2819,
					"offsetEnd": 2820,
					"columnNum": 575
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Retesting Subject - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2821,
					"offsetEnd": 2821,
					"columnNum": 576
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2822,
					"offsetEnd": 2822,
					"columnNum": 577
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote/Verbiage: Previously Passed Subject - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2823,
					"offsetEnd": 2823,
					"columnNum": 578
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Footnote: Test Security Violation (Void) - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "FOOTNOTE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2824,
					"offsetEnd": 2824,
					"columnNum": 579
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2825,
					"offsetEnd": 2826,
					"columnNum": 580
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Test Administrator Number - Document 1",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2827,
					"offsetEnd": 2829,
					"columnNum": 581
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - Document 1",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2830,
					"offsetEnd": 2849,
					"columnNum": 582
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - Document 1",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_DOCUMENT_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2850,
					"offsetEnd": 2869,
					"columnNum": 583
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Test Administrator Number - Document 2",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2870,
					"offsetEnd": 2872,
					"columnNum": 584
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - Document 2",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2873,
					"offsetEnd": 2892,
					"columnNum": 585
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - Document 2",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_DOCUMENT_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2893,
					"offsetEnd": 2912,
					"columnNum": 586
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Bubbled Test Administrator Number - Document 3",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2913,
					"offsetEnd": 2915,
					"columnNum": 587
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - Document 3",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2916,
					"offsetEnd": 2935,
					"columnNum": 588
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - Document 3",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_DOCUMENT_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2936,
					"offsetEnd": 2955,
					"columnNum": 589
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2956,
					"offsetEnd": 3007,
					"columnNum": 590
				},
				"fieldLength": 52,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DRC Unique Student ID",
				"otherPossibleNames": [],
				"logicalName": "DRC_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3008,
					"offsetEnd": 3013,
					"columnNum": 591
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "LAP LDE Unique ID (GUID)",
				"otherPossibleNames": [],
				"logicalName": "LAP_GUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3014,
					"offsetEnd": 3023,
					"columnNum": 592
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3024,
					"offsetEnd": 3102,
					"columnNum": 593
				},
				"fieldLength": 79,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Subject for LEAP Tutoring",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SUBJECT_FOR_LEAP_TUTORING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3103,
					"offsetEnd": 3103,
					"columnNum": 594
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Previously Attempted Tests - ELA/Math",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_PREVIOUSLY_ATTEMPTED_TESTS_ELA_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3104,
					"offsetEnd": 3104,
					"columnNum": 595
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Previously Attempted Tests - SCI/SOC",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_PREVIOUSLY_ATTEMPTED_TESTS_SCIENCE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3105,
					"offsetEnd": 3105,
					"columnNum": 596
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - English Language Arts",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3106,
					"offsetEnd": 3107,
					"columnNum": 597
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Mathematics",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3108,
					"offsetEnd": 3109,
					"columnNum": 598
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Science",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3110,
					"offsetEnd": 3111,
					"columnNum": 599
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3112,
					"offsetEnd": 3113,
					"columnNum": 600
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3114,
					"offsetEnd": 3121,
					"columnNum": 601
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3122,
					"offsetEnd": 3122,
					"columnNum": 602
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3123,
					"offsetEnd": 3123,
					"columnNum": 603
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3124,
					"offsetEnd": 3124,
					"columnNum": 604
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3125,
					"offsetEnd": 3125,
					"columnNum": 605
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3126,
					"offsetEnd": 3126,
					"columnNum": 606
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3127,
					"offsetEnd": 3127,
					"columnNum": 607
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Script",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3128,
					"offsetEnd": 3128,
					"columnNum": 608
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3129,
					"offsetEnd": 3129,
					"columnNum": 609
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3130,
					"offsetEnd": 3130,
					"columnNum": 610
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3131,
					"offsetEnd": 3131,
					"columnNum": 611
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3132,
					"offsetEnd": 3132,
					"columnNum": 612
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3133,
					"offsetEnd": 3133,
					"columnNum": 613
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3134,
					"offsetEnd": 3134,
					"columnNum": 614
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3135,
					"offsetEnd": 3135,
					"columnNum": 615
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3136,
					"offsetEnd": 3136,
					"columnNum": 616
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3137,
					"offsetEnd": 3137,
					"columnNum": 617
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Human/Test Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN/TEST_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3138,
					"offsetEnd": 3138,
					"columnNum": 618
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3139,
					"offsetEnd": 3139,
					"columnNum": 619
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3140,
					"offsetEnd": 3140,
					"columnNum": 620
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3141,
					"offsetEnd": 3141,
					"columnNum": 621
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3142,
					"offsetEnd": 3142,
					"columnNum": 622
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3143,
					"offsetEnd": 3143,
					"columnNum": 623
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3144,
					"offsetEnd": 3144,
					"columnNum": 624
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Script",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3145,
					"offsetEnd": 3145,
					"columnNum": 625
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3146,
					"offsetEnd": 3146,
					"columnNum": 626
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3147,
					"offsetEnd": 3147,
					"columnNum": 627
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3148,
					"offsetEnd": 3148,
					"columnNum": 628
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3150,
					"offsetEnd": 3150,
					"columnNum": 629
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3151,
					"offsetEnd": 3151,
					"columnNum": 630
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3152,
					"offsetEnd": 3152,
					"columnNum": 631
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3153,
					"offsetEnd": 3153,
					"columnNum": 632
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3154,
					"offsetEnd": 3154,
					"columnNum": 633
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3155,
					"offsetEnd": 3155,
					"columnNum": 634
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3156,
					"offsetEnd": 3156,
					"columnNum": 635
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3157,
					"offsetEnd": 3157,
					"columnNum": 636
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3158,
					"offsetEnd": 3158,
					"columnNum": 637
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3159,
					"offsetEnd": 3159,
					"columnNum": 638
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3160,
					"offsetEnd": 3160,
					"columnNum": 639
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3161,
					"offsetEnd": 3161,
					"columnNum": 640
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3162,
					"offsetEnd": 3162,
					"columnNum": 641
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3163,
					"offsetEnd": 3163,
					"columnNum": 642
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
				"otherPossibleNames": [],
				"logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3164,
					"offsetEnd": 3164,
					"columnNum": 643
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3165,
					"offsetEnd": 3165,
					"columnNum": 644
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3166,
					"offsetEnd": 3166,
					"columnNum": 645
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3167,
					"offsetEnd": 3167,
					"columnNum": 646
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3168,
					"offsetEnd": 3168,
					"columnNum": 647
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3169,
					"offsetEnd": 3169,
					"columnNum": 648
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3170,
					"offsetEnd": 3170,
					"columnNum": 649
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3171,
					"offsetEnd": 3171,
					"columnNum": 650
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3172,
					"offsetEnd": 3172,
					"columnNum": 651
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3173,
					"offsetEnd": 3173,
					"columnNum": 652
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3174,
					"offsetEnd": 3174,
					"columnNum": 653
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3175,
					"offsetEnd": 3175,
					"columnNum": 654
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3176,
					"offsetEnd": 3176,
					"columnNum": 655
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3177,
					"offsetEnd": 3177,
					"columnNum": 656
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3178,
					"offsetEnd": 3178,
					"columnNum": 657
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3179,
					"offsetEnd": 3179,
					"columnNum": 658
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3180,
					"offsetEnd": 3180,
					"columnNum": 659
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3181,
					"offsetEnd": 3181,
					"columnNum": 660
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3182,
					"offsetEnd": 3182,
					"columnNum": 661
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3183,
					"offsetEnd": 3183,
					"columnNum": 662
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3184,
					"offsetEnd": 3184,
					"columnNum": 663
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3185,
					"offsetEnd": 3185,
					"columnNum": 664
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3186,
					"offsetEnd": 3186,
					"columnNum": 665
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3187,
					"offsetEnd": 3187,
					"columnNum": 666
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3188,
					"offsetEnd": 3188,
					"columnNum": 667
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3189,
					"offsetEnd": 3189,
					"columnNum": 668
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3190,
					"offsetEnd": 3190,
					"columnNum": 669
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3191,
					"offsetEnd": 3191,
					"columnNum": 670
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
				"otherPossibleNames": [],
				"logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3192,
					"offsetEnd": 3192,
					"columnNum": 671
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3193,
					"offsetEnd": 3193,
					"columnNum": 672
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3194,
					"offsetEnd": 3194,
					"columnNum": 673
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3195,
					"offsetEnd": 3195,
					"columnNum": 674
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3196,
					"offsetEnd": 3196,
					"columnNum": 675
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3197,
					"offsetEnd": 3197,
					"columnNum": 676
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3198,
					"offsetEnd": 3198,
					"columnNum": 677
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3199,
					"offsetEnd": 3199,
					"columnNum": 678
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3200,
					"offsetEnd": 3200,
					"columnNum": 679
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3201,
					"offsetEnd": 3201,
					"columnNum": 680
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3202,
					"offsetEnd": 3202,
					"columnNum": 681
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3203,
					"offsetEnd": 3203,
					"columnNum": 682
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3204,
					"offsetEnd": 3204,
					"columnNum": 683
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3205,
					"offsetEnd": 3205,
					"columnNum": 684
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3206,
					"offsetEnd": 3206,
					"columnNum": 685
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3207,
					"offsetEnd": 3207,
					"columnNum": 686
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3208,
					"offsetEnd": 3208,
					"columnNum": 687
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3209,
					"offsetEnd": 3209,
					"columnNum": 688
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3210,
					"offsetEnd": 3210,
					"columnNum": 689
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3211,
					"offsetEnd": 3211,
					"columnNum": 690
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3212,
					"offsetEnd": 3212,
					"columnNum": 691
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3213,
					"offsetEnd": 3213,
					"columnNum": 692
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3214,
					"offsetEnd": 3214,
					"columnNum": 693
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3215,
					"offsetEnd": 3215,
					"columnNum": 694
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3216,
					"offsetEnd": 3216,
					"columnNum": 695
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3217,
					"offsetEnd": 3217,
					"columnNum": 696
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3218,
					"offsetEnd": 3218,
					"columnNum": 697
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3219,
					"offsetEnd": 3219,
					"columnNum": 698
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
				"otherPossibleNames": [],
				"logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3220,
					"offsetEnd": 3220,
					"columnNum": 699
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3221,
					"offsetEnd": 3221,
					"columnNum": 700
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3222,
					"offsetEnd": 3222,
					"columnNum": 701
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "No Accommodations",
				"otherPossibleNames": [],
				"logicalName": "NO_ACCOMMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3223,
					"offsetEnd": 3223,
					"columnNum": 702
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3224,
					"offsetEnd": 3224,
					"columnNum": 703
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3225,
					"offsetEnd": 3225,
					"columnNum": 704
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3226,
					"offsetEnd": 3226,
					"columnNum": 705
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3227,
					"offsetEnd": 3227,
					"columnNum": 706
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3228,
					"offsetEnd": 3228,
					"columnNum": 707
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3229,
					"offsetEnd": 3229,
					"columnNum": 708
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3230,
					"offsetEnd": 3230,
					"columnNum": 709
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Individual/Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3231,
					"offsetEnd": 3231,
					"columnNum": 710
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3232,
					"offsetEnd": 3232,
					"columnNum": 711
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3233,
					"offsetEnd": 3233,
					"columnNum": 712
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Entry Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_ENTRY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3234,
					"offsetEnd": 3235,
					"columnNum": 713
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Entry Date",
				"otherPossibleNames": [],
				"logicalName": "LAP_ENTRY_DATE",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3236,
					"offsetEnd": 3243,
					"columnNum": 714
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3244,
					"offsetEnd": 3253,
					"columnNum": 715
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "File Creation Date and Time Stamp",
				"otherPossibleNames": [],
				"logicalName": "FILE_CREATION_DATE_AND_TIME_STAMP",
				"formatMask": "yyyy-MM-dd HH:MM",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3254,
					"offsetEnd": 3269,
					"columnNum": 716
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": [".dat"]
}