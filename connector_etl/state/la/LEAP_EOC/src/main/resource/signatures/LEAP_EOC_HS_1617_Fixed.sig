{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_EOC_HS_1617_Fixed",
    "recordLength": 4351,
    "naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR","DRC_UNIQUE_STUDENT_ID"],
		"fields": [{
				"physicalName": "Test Date-Year",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_YEAR",
				"formatMask": "YYYY",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 4,
					"columnNum": 1
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Test Date-Month",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 5,
					"offsetEnd": 6,
					"columnNum": 2
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "District Code",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 9,
					"columnNum": 3
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Code",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 10,
					"offsetEnd": 12,
					"columnNum": 4
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "District Name",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 13,
					"offsetEnd": 52,
					"columnNum": 5
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Name",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 53,
					"offsetEnd": 92,
					"columnNum": 6
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "District Reporting Rolled Up Code",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_REPORTING_ROLLED_UP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 93,
					"offsetEnd": 98,
					"columnNum": 7
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Type",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 99,
					"offsetEnd": 100,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Charter School Type",
				"otherPossibleNames": [],
				"logicalName": "CHARTER_SCHOOL_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 101,
					"offsetEnd": 101,
					"columnNum": 9
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Rollup to State",
				"otherPossibleNames": [],
				"logicalName": "ROLLUP_TO_STATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 102,
					"offsetEnd": 102,
					"columnNum": 10
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 103,
					"offsetEnd": 117,
					"columnNum": 11
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 118,
					"offsetEnd": 137,
					"columnNum": 12
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student First Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 138,
					"offsetEnd": 152,
					"columnNum": 13
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 153,
					"offsetEnd": 153,
					"columnNum": 14
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LASID",
				"otherPossibleNames": [],
				"logicalName": "LASID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 154,
					"offsetEnd": 163,
					"columnNum": 15
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "DRC Unique Student ID",
				"otherPossibleNames": [],
				"logicalName": "DRC_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 169,
					"columnNum": 16
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "DOB - Month",
				"otherPossibleNames": [],
				"logicalName": "DOB_-_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 170,
					"offsetEnd": 171,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "DOB - Day",
				"otherPossibleNames": [],
				"logicalName": "DOB_-_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 172,
					"offsetEnd": 173,
					"columnNum": 18
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "DOB - Year",
				"otherPossibleNames": [],
				"logicalName": "DOB_-_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 174,
					"offsetEnd": 177,
					"columnNum": 19
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Grade",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 178,
					"offsetEnd": 179,
					"columnNum": 20
				},
				"fieldLength": 2,
				"expectedValues": ["06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Precode Grade",
				"otherPossibleNames": [],
				"logicalName": "PRECODE_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 180,
					"offsetEnd": 181,
					"columnNum": 21
				},
				"fieldLength": 2,
				"expectedValues": ["07", "08", "09", "10", "11", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 182,
					"offsetEnd": 191,
					"columnNum": 22
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Gender",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 192,
					"offsetEnd": 192,
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": ["F", "M"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Economically Disadvantaged Status",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICALLY_DISADVANTAGED_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 193,
					"offsetEnd": 193,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 194,
					"offsetEnd": 194,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Education Classification",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_EDUCATION_CLASSIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 195,
					"offsetEnd": 195,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Precode Education Classification",
				"otherPossibleNames": [],
				"logicalName": "PRECODE_EDUCATION_CLASSIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 196,
					"offsetEnd": 196,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting LEP Status",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_LEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 197,
					"offsetEnd": 198,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Precode LEP Status",
				"otherPossibleNames": [],
				"logicalName": "PRECODE_LEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 199,
					"offsetEnd": 200,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Section 504 Code",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_SECTION_504_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 201,
					"columnNum": 30
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Precode Section 504 Code",
				"otherPossibleNames": [],
				"logicalName": "PRECODE_SECTION_504_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 202,
					"offsetEnd": 202,
					"columnNum": 31
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 203,
					"offsetEnd": 204,
					"columnNum": 32
				},
				"fieldLength": 2,
				"expectedValues": ["", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Precode Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "PRECODE_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 205,
					"offsetEnd": 206,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": ["", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Hispanic",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 207,
					"offsetEnd": 207,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 208,
					"offsetEnd": 208,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 209,
					"offsetEnd": 209,
					"columnNum": 36
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Black",
				"otherPossibleNames": [],
				"logicalName": "BLACK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 210,
					"offsetEnd": 210,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Hawaiian or other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 211,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 212,
					"offsetEnd": 212,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized Ethnicity Race",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY_RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 213,
					"offsetEnd": 213,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Homeless (McKinney-Vento) Flag",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_HOMELESS_(MCKINNEY-VENTO)_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 214,
					"offsetEnd": 214,
					"columnNum": 41
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Career Diploma Pathway/Track",
				"otherPossibleNames": [],
				"logicalName": "CAREER_DIPLOMA_PATHWAY/TRACK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 215,
					"offsetEnd": 215,
					"columnNum": 42
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scholarship Student Flag",
				"otherPossibleNames": [],
				"logicalName": "SCHOLARSHIP_STUDENT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 216,
					"offsetEnd": 216,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Precode Site Code",
				"otherPossibleNames": [],
				"logicalName": "PRECODE_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 217,
					"offsetEnd": 222,
					"columnNum": 44
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 223,
					"offsetEnd": 233,
					"columnNum": 45
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Error Administration",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 234,
					"offsetEnd": 234,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content ALGI",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 235,
					"offsetEnd": 239,
					"columnNum": 47
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 240,
					"offsetEnd": 245,
					"columnNum": 48
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 246,
					"offsetEnd": 265,
					"columnNum": 49
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher First Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 266,
					"offsetEnd": 280,
					"columnNum": 50
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 281,
					"offsetEnd": 281,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 282,
					"offsetEnd": 284,
					"columnNum": 52
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 285,
					"offsetEnd": 304,
					"columnNum": 53
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator First Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 305,
					"offsetEnd": 324,
					"columnNum": 54
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 325,
					"offsetEnd": 325,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Code",
				"otherPossibleNames": [],
				"logicalName": "COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 326,
					"offsetEnd": 331,
					"columnNum": 56
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Name",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 332,
					"offsetEnd": 361,
					"columnNum": 57
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 362,
					"offsetEnd": 381,
					"columnNum": 58
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Site Code",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 382,
					"offsetEnd": 387,
					"columnNum": 59
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Algebra I Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 388,
					"offsetEnd": 388,
					"columnNum": 60
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Algebra I CohortFlag",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_COHORTFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 389,
					"offsetEnd": 389,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 390,
					"offsetEnd": 409,
					"columnNum": 62
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 1 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_1_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 410,
					"offsetEnd": 410,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 2 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_2_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 411,
					"offsetEnd": 411,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 412,
					"offsetEnd": 412,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 413,
					"offsetEnd": 417,
					"columnNum": 66
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 418,
					"offsetEnd": 418,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 419,
					"offsetEnd": 419,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 420,
					"offsetEnd": 420,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 421,
					"offsetEnd": 421,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 422,
					"offsetEnd": 422,
					"columnNum": 71
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 423,
					"offsetEnd": 423,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 424,
					"offsetEnd": 424,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 425,
					"offsetEnd": 425,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 426,
					"offsetEnd": 426,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 427,
					"offsetEnd": 427,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 428,
					"offsetEnd": 428,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 429,
					"offsetEnd": 429,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 430,
					"offsetEnd": 430,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 431,
					"offsetEnd": 431,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 432,
					"offsetEnd": 432,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 433,
					"offsetEnd": 433,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 434,
					"offsetEnd": 434,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 435,
					"offsetEnd": 435,
					"columnNum": 84
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 436,
					"offsetEnd": 436,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 437,
					"offsetEnd": 437,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 438,
					"offsetEnd": 438,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 439,
					"offsetEnd": 439,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 440,
					"offsetEnd": 440,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 441,
					"offsetEnd": 441,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 442,
					"offsetEnd": 442,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 443,
					"offsetEnd": 443,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 444,
					"offsetEnd": 444,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 445,
					"offsetEnd": 445,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 446,
					"offsetEnd": 465,
					"columnNum": 95
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 466,
					"offsetEnd": 468,
					"columnNum": 96
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 469,
					"offsetEnd": 471,
					"columnNum": 97
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 472,
					"offsetEnd": 474,
					"columnNum": 98
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 475,
					"offsetEnd": 477,
					"columnNum": 99
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 478,
					"offsetEnd": 480,
					"columnNum": 100
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level AlgI",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 481,
					"offsetEnd": 482,
					"columnNum": 101
				},
				"fieldLength": 2,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level AlgI",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 483,
					"offsetEnd": 485,
					"columnNum": 102
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 486,
					"offsetEnd": 500,
					"columnNum": 103
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High AlgI",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 503,
					"columnNum": 104
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low AlgI",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 504,
					"offsetEnd": 506,
					"columnNum": 105
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Algebra Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 507,
					"offsetEnd": 508,
					"columnNum": 106
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Algebra Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 509,
					"offsetEnd": 511,
					"columnNum": 107
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Functions Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "FUNCTIONS_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 512,
					"offsetEnd": 513,
					"columnNum": 108
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Functions Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "FUNCTIONS_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 514,
					"offsetEnd": 516,
					"columnNum": 109
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number & Quantity / Statistics & Probability Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 517,
					"offsetEnd": 518,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Number & Quantity / Statistics & Probability Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 519,
					"offsetEnd": 521,
					"columnNum": 111
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 522,
					"offsetEnd": 541,
					"columnNum": 112
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - Algebra I",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 542,
					"offsetEnd": 543,
					"columnNum": 113
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reportable status",
				"otherPossibleNames": [],
				"logicalName": "REPORTABLE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 544,
					"offsetEnd": 544,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt ALGI",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 545,
					"offsetEnd": 545,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Launch Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_LAUNCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 546,
					"offsetEnd": 546,
					"columnNum": 116
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag ALGI",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 547,
					"offsetEnd": 547,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Retest Flag",
				"otherPossibleNames": [],
				"logicalName": "RETEST_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 548,
					"offsetEnd": 548,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": ["", "I", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eligible Flag",
				"otherPossibleNames": [],
				"logicalName": "ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 549,
					"offsetEnd": 549,
					"columnNum": 119
				},
				"fieldLength": 1,
				"expectedValues": ["", "E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 550,
					"offsetEnd": 550,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": ["", "R", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 551,
					"offsetEnd": 560,
					"columnNum": 121
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Session / Class Roster Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_SESSION_/_CLASS_ROSTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 561,
					"offsetEnd": 561,
					"columnNum": 122
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 562,
					"offsetEnd": 562,
					"columnNum": 123
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Roster",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 563,
					"offsetEnd": 563,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 564,
					"offsetEnd": 573,
					"columnNum": 125
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration year of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 574,
					"offsetEnd": 577,
					"columnNum": 126
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Administration month of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 578,
					"offsetEnd": 579,
					"columnNum": 127
				},
				"fieldLength": 2,
				"expectedValues": ["", "05", "06", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest previous scale score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 580,
					"offsetEnd": 582,
					"columnNum": 128
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest Previous Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 583,
					"offsetEnd": 585,
					"columnNum": 129
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 586,
					"offsetEnd": 595,
					"columnNum": 130
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 596,
					"offsetEnd": 795,
					"columnNum": 131
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Field Test Item Responses",
				"otherPossibleNames": [],
				"logicalName": "FIELD_TEST_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 796,
					"offsetEnd": 895,
					"columnNum": 132
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 896,
					"offsetEnd": 911,
					"columnNum": 133
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Error Administration",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 912,
					"offsetEnd": 912,
					"columnNum": 134
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content ENGII",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 913,
					"offsetEnd": 917,
					"columnNum": 135
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 918,
					"offsetEnd": 923,
					"columnNum": 136
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 924,
					"offsetEnd": 943,
					"columnNum": 137
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher First Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 944,
					"offsetEnd": 958,
					"columnNum": 138
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 959,
					"offsetEnd": 959,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 960,
					"offsetEnd": 962,
					"columnNum": 140
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 963,
					"offsetEnd": 982,
					"columnNum": 141
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator First Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 983,
					"offsetEnd": 1002,
					"columnNum": 142
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1003,
					"offsetEnd": 1003,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Code",
				"otherPossibleNames": [],
				"logicalName": "COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1004,
					"offsetEnd": 1009,
					"columnNum": 144
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Name",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1010,
					"offsetEnd": 1039,
					"columnNum": 145
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1040,
					"offsetEnd": 1059,
					"columnNum": 146
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Site Code",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1060,
					"offsetEnd": 1065,
					"columnNum": 147
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English II Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1066,
					"offsetEnd": 1066,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English II CohortFlag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_COHORTFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1067,
					"offsetEnd": 1067,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1068,
					"offsetEnd": 1087,
					"columnNum": 150
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 1 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_1_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1088,
					"offsetEnd": 1088,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 2 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_2_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1089,
					"offsetEnd": 1089,
					"columnNum": 152
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1090,
					"offsetEnd": 1090,
					"columnNum": 153
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1091,
					"offsetEnd": 1095,
					"columnNum": 154
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1096,
					"offsetEnd": 1096,
					"columnNum": 155
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1097,
					"offsetEnd": 1097,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1098,
					"offsetEnd": 1098,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1099,
					"offsetEnd": 1099,
					"columnNum": 158
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1100,
					"offsetEnd": 1100,
					"columnNum": 159
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1101,
					"offsetEnd": 1101,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1102,
					"offsetEnd": 1102,
					"columnNum": 161
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1103,
					"offsetEnd": 1103,
					"columnNum": 162
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1104,
					"offsetEnd": 1104,
					"columnNum": 163
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1105,
					"offsetEnd": 1105,
					"columnNum": 164
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1106,
					"offsetEnd": 1106,
					"columnNum": 165
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1107,
					"offsetEnd": 1107,
					"columnNum": 166
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1108,
					"offsetEnd": 1108,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1109,
					"offsetEnd": 1109,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1110,
					"offsetEnd": 1110,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1111,
					"offsetEnd": 1111,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1112,
					"offsetEnd": 1112,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1113,
					"offsetEnd": 1113,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1114,
					"offsetEnd": 1114,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1115,
					"offsetEnd": 1115,
					"columnNum": 174
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1116,
					"offsetEnd": 1116,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1117,
					"offsetEnd": 1117,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1118,
					"offsetEnd": 1118,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1119,
					"offsetEnd": 1119,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1120,
					"offsetEnd": 1120,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1121,
					"offsetEnd": 1121,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1122,
					"offsetEnd": 1122,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1123,
					"offsetEnd": 1123,
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1124,
					"offsetEnd": 1143,
					"columnNum": 183
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score EngII",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1144,
					"offsetEnd": 1146,
					"columnNum": 184
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score EngII",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1147,
					"offsetEnd": 1149,
					"columnNum": 185
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1150,
					"offsetEnd": 1152,
					"columnNum": 186
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1153,
					"offsetEnd": 1155,
					"columnNum": 187
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score EngII",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1156,
					"offsetEnd": 1158,
					"columnNum": 188
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level EngII",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1159,
					"offsetEnd": 1160,
					"columnNum": 189
				},
				"fieldLength": 2,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level EngII",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1161,
					"offsetEnd": 1163,
					"columnNum": 190
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1164,
					"offsetEnd": 1178,
					"columnNum": 191
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High EngII",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1179,
					"offsetEnd": 1181,
					"columnNum": 192
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low EngII",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1182,
					"offsetEnd": 1184,
					"columnNum": 193
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing and Language Conventions Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1185,
					"offsetEnd": 1186,
					"columnNum": 194
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing and Language Conventions Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1187,
					"offsetEnd": 1189,
					"columnNum": 195
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1190,
					"offsetEnd": 1191,
					"columnNum": 196
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1192,
					"offsetEnd": 1194,
					"columnNum": 197
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Research Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "RESEARCH_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1195,
					"offsetEnd": 1196,
					"columnNum": 198
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Research Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "RESEARCH_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1197,
					"offsetEnd": 1199,
					"columnNum": 199
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1200,
					"offsetEnd": 1219,
					"columnNum": 200
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - ENGII",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1220,
					"offsetEnd": 1221,
					"columnNum": 201
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reportable status",
				"otherPossibleNames": [],
				"logicalName": "REPORTABLE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1222,
					"offsetEnd": 1222,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt ENGII",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1223,
					"offsetEnd": 1223,
					"columnNum": 203
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Launch Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_LAUNCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1224,
					"offsetEnd": 1224,
					"columnNum": 204
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag ENGII",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1225,
					"offsetEnd": 1225,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Retest Flag",
				"otherPossibleNames": [],
				"logicalName": "RETEST_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1226,
					"offsetEnd": 1226,
					"columnNum": 206
				},
				"fieldLength": 1,
				"expectedValues": ["", "I", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eligible Flag",
				"otherPossibleNames": [],
				"logicalName": "ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1227,
					"offsetEnd": 1227,
					"columnNum": 207
				},
				"fieldLength": 1,
				"expectedValues": ["", "E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1228,
					"offsetEnd": 1228,
					"columnNum": 208
				},
				"fieldLength": 1,
				"expectedValues": ["", "R", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1229,
					"offsetEnd": 1238,
					"columnNum": 209
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Session / Class Roster Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_SESSION_/_CLASS_ROSTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1239,
					"offsetEnd": 1239,
					"columnNum": 210
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1240,
					"offsetEnd": 1240,
					"columnNum": 211
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Roster",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1241,
					"offsetEnd": 1241,
					"columnNum": 212
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1242,
					"offsetEnd": 1251,
					"columnNum": 213
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration year of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1252,
					"offsetEnd": 1255,
					"columnNum": 214
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Administration month of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1256,
					"offsetEnd": 1257,
					"columnNum": 215
				},
				"fieldLength": 2,
				"expectedValues": ["", "05", "06", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest previous scale score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1258,
					"offsetEnd": 1260,
					"columnNum": 216
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest Previous Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1261,
					"offsetEnd": 1263,
					"columnNum": 217
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1264,
					"offsetEnd": 1273,
					"columnNum": 218
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1274,
					"offsetEnd": 1473,
					"columnNum": 219
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Field Test Item Responses",
				"otherPossibleNames": [],
				"logicalName": "FIELD_TEST_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1474,
					"offsetEnd": 1573,
					"columnNum": 220
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1574,
					"offsetEnd": 1589,
					"columnNum": 221
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Error Administration",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1590,
					"offsetEnd": 1590,
					"columnNum": 222
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content GEOM",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1591,
					"offsetEnd": 1595,
					"columnNum": 223
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1596,
					"offsetEnd": 1601,
					"columnNum": 224
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1602,
					"offsetEnd": 1621,
					"columnNum": 225
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher First Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1622,
					"offsetEnd": 1636,
					"columnNum": 226
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1637,
					"offsetEnd": 1637,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1638,
					"offsetEnd": 1640,
					"columnNum": 228
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1641,
					"offsetEnd": 1660,
					"columnNum": 229
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator First Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1661,
					"offsetEnd": 1680,
					"columnNum": 230
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1681,
					"offsetEnd": 1681,
					"columnNum": 231
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Code",
				"otherPossibleNames": [],
				"logicalName": "COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1682,
					"offsetEnd": 1687,
					"columnNum": 232
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Name",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1688,
					"offsetEnd": 1717,
					"columnNum": 233
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1718,
					"offsetEnd": 1737,
					"columnNum": 234
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Site Code",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1738,
					"offsetEnd": 1743,
					"columnNum": 235
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Geometry Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "GEOMETRY_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1744,
					"offsetEnd": 1744,
					"columnNum": 236
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1745,
					"offsetEnd": 1764,
					"columnNum": 237
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 1 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_1_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1765,
					"offsetEnd": 1765,
					"columnNum": 238
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 2 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_2_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1766,
					"offsetEnd": 1766,
					"columnNum": 239
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1767,
					"offsetEnd": 1767,
					"columnNum": 240
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1768,
					"offsetEnd": 1772,
					"columnNum": 241
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1773,
					"offsetEnd": 1773,
					"columnNum": 242
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1774,
					"offsetEnd": 1774,
					"columnNum": 243
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1775,
					"offsetEnd": 1775,
					"columnNum": 244
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1776,
					"offsetEnd": 1776,
					"columnNum": 245
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1777,
					"offsetEnd": 1777,
					"columnNum": 246
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1778,
					"offsetEnd": 1778,
					"columnNum": 247
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1779,
					"offsetEnd": 1779,
					"columnNum": 248
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1780,
					"offsetEnd": 1780,
					"columnNum": 249
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1781,
					"offsetEnd": 1781,
					"columnNum": 250
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1782,
					"offsetEnd": 1782,
					"columnNum": 251
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1783,
					"offsetEnd": 1783,
					"columnNum": 252
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1784,
					"offsetEnd": 1784,
					"columnNum": 253
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1785,
					"offsetEnd": 1785,
					"columnNum": 254
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1786,
					"offsetEnd": 1786,
					"columnNum": 255
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1787,
					"offsetEnd": 1787,
					"columnNum": 256
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1788,
					"offsetEnd": 1788,
					"columnNum": 257
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1789,
					"offsetEnd": 1789,
					"columnNum": 258
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1790,
					"offsetEnd": 1790,
					"columnNum": 259
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1791,
					"offsetEnd": 1791,
					"columnNum": 260
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1792,
					"offsetEnd": 1792,
					"columnNum": 261
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1793,
					"offsetEnd": 1793,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1794,
					"offsetEnd": 1794,
					"columnNum": 263
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1795,
					"offsetEnd": 1795,
					"columnNum": 264
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1796,
					"offsetEnd": 1796,
					"columnNum": 265
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1797,
					"offsetEnd": 1797,
					"columnNum": 266
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1798,
					"offsetEnd": 1798,
					"columnNum": 267
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1799,
					"offsetEnd": 1799,
					"columnNum": 268
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1800,
					"offsetEnd": 1800,
					"columnNum": 269
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1801,
					"offsetEnd": 1820,
					"columnNum": 270
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score Geom",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1821,
					"offsetEnd": 1823,
					"columnNum": 271
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score Geom",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1824,
					"offsetEnd": 1826,
					"columnNum": 272
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1827,
					"offsetEnd": 1829,
					"columnNum": 273
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct Geom",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1830,
					"offsetEnd": 1832,
					"columnNum": 274
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score Geom",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1833,
					"offsetEnd": 1835,
					"columnNum": 275
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level Geom",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1836,
					"offsetEnd": 1837,
					"columnNum": 276
				},
				"fieldLength": 2,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level Geom",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1838,
					"offsetEnd": 1840,
					"columnNum": 277
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1841,
					"offsetEnd": 1855,
					"columnNum": 278
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High Geom",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1856,
					"offsetEnd": 1858,
					"columnNum": 279
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low Geom",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1859,
					"offsetEnd": 1861,
					"columnNum": 280
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Congruence Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1862,
					"offsetEnd": 1863,
					"columnNum": 281
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Congruence Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1864,
					"offsetEnd": 1866,
					"columnNum": 282
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Similarity, Right Triangles, & Trigonometry  Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1867,
					"offsetEnd": 1868,
					"columnNum": 283
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Similarity, Right Triangles, & Trigonometry  Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1869,
					"offsetEnd": 1871,
					"columnNum": 284
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Circles / Expressing Geometric Properties with Equations Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1872,
					"offsetEnd": 1873,
					"columnNum": 285
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Circles / Expressing Geometric Properties with Equations Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1874,
					"offsetEnd": 1876,
					"columnNum": 286
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Geometric Measurement & Dimension / Modeling with Geometry Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1877,
					"offsetEnd": 1878,
					"columnNum": 287
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Geometric Measurement & Dimension / Modeling with Geometry Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1879,
					"offsetEnd": 1881,
					"columnNum": 288
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1882,
					"offsetEnd": 1901,
					"columnNum": 289
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - Geometry",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1902,
					"offsetEnd": 1903,
					"columnNum": 290
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reportable status",
				"otherPossibleNames": [],
				"logicalName": "REPORTABLE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1904,
					"offsetEnd": 1904,
					"columnNum": 291
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt GEOM",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1905,
					"offsetEnd": 1905,
					"columnNum": 292
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Launch Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_LAUNCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1906,
					"offsetEnd": 1906,
					"columnNum": 293
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag GEOM",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1907,
					"offsetEnd": 1907,
					"columnNum": 294
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Retest Flag",
				"otherPossibleNames": [],
				"logicalName": "RETEST_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1908,
					"offsetEnd": 1908,
					"columnNum": 295
				},
				"fieldLength": 1,
				"expectedValues": ["", "I", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eligible Flag",
				"otherPossibleNames": [],
				"logicalName": "ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1909,
					"offsetEnd": 1909,
					"columnNum": 296
				},
				"fieldLength": 1,
				"expectedValues": ["", "E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1910,
					"offsetEnd": 1910,
					"columnNum": 297
				},
				"fieldLength": 1,
				"expectedValues": ["", "R", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1911,
					"offsetEnd": 1920,
					"columnNum": 298
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Session / Class Roster Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_SESSION_/_CLASS_ROSTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1921,
					"offsetEnd": 1921,
					"columnNum": 299
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1922,
					"offsetEnd": 1922,
					"columnNum": 300
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Roster",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1923,
					"offsetEnd": 1923,
					"columnNum": 301
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1924,
					"offsetEnd": 1933,
					"columnNum": 302
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration year of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1934,
					"offsetEnd": 1937,
					"columnNum": 303
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Administration month of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1938,
					"offsetEnd": 1939,
					"columnNum": 304
				},
				"fieldLength": 2,
				"expectedValues": ["", "05", "06", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest previous scale score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1940,
					"offsetEnd": 1942,
					"columnNum": 305
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest Previous Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1943,
					"offsetEnd": 1945,
					"columnNum": 306
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1946,
					"offsetEnd": 1955,
					"columnNum": 307
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1956,
					"offsetEnd": 2155,
					"columnNum": 308
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Field Test Item Responses",
				"otherPossibleNames": [],
				"logicalName": "FIELD_TEST_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2156,
					"offsetEnd": 2255,
					"columnNum": 309
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2256,
					"offsetEnd": 2271,
					"columnNum": 310
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Error Administration",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2272,
					"offsetEnd": 2272,
					"columnNum": 311
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content BIO",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2273,
					"offsetEnd": 2277,
					"columnNum": 312
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2278,
					"offsetEnd": 2283,
					"columnNum": 313
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2284,
					"offsetEnd": 2303,
					"columnNum": 314
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher First Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2304,
					"offsetEnd": 2318,
					"columnNum": 315
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2319,
					"offsetEnd": 2319,
					"columnNum": 316
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2320,
					"offsetEnd": 2322,
					"columnNum": 317
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2323,
					"offsetEnd": 2342,
					"columnNum": 318
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator First Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2343,
					"offsetEnd": 2362,
					"columnNum": 319
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2363,
					"offsetEnd": 2363,
					"columnNum": 320
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Code",
				"otherPossibleNames": [],
				"logicalName": "COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2364,
					"offsetEnd": 2369,
					"columnNum": 321
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Name",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2370,
					"offsetEnd": 2399,
					"columnNum": 322
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2400,
					"offsetEnd": 2419,
					"columnNum": 323
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Site Code",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2420,
					"offsetEnd": 2425,
					"columnNum": 324
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Biology Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2426,
					"offsetEnd": 2426,
					"columnNum": 325
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2427,
					"offsetEnd": 2446,
					"columnNum": 326
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 1 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_1_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2447,
					"offsetEnd": 2447,
					"columnNum": 327
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 2 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_2_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2448,
					"offsetEnd": 2448,
					"columnNum": 328
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2449,
					"offsetEnd": 2449,
					"columnNum": 329
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2450,
					"offsetEnd": 2454,
					"columnNum": 330
				},
				"fieldLength": 5,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2455,
					"offsetEnd": 2455,
					"columnNum": 331
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2456,
					"offsetEnd": 2456,
					"columnNum": 332
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2457,
					"offsetEnd": 2457,
					"columnNum": 333
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2458,
					"offsetEnd": 2458,
					"columnNum": 334
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2459,
					"offsetEnd": 2459,
					"columnNum": 335
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2460,
					"offsetEnd": 2460,
					"columnNum": 336
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2461,
					"offsetEnd": 2461,
					"columnNum": 337
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2462,
					"offsetEnd": 2462,
					"columnNum": 338
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2463,
					"offsetEnd": 2463,
					"columnNum": 339
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2464,
					"offsetEnd": 2464,
					"columnNum": 340
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2465,
					"offsetEnd": 2465,
					"columnNum": 341
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2466,
					"offsetEnd": 2466,
					"columnNum": 342
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2467,
					"offsetEnd": 2467,
					"columnNum": 343
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2468,
					"offsetEnd": 2468,
					"columnNum": 344
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2469,
					"offsetEnd": 2469,
					"columnNum": 345
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2470,
					"offsetEnd": 2470,
					"columnNum": 346
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2471,
					"offsetEnd": 2471,
					"columnNum": 347
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2472,
					"offsetEnd": 2472,
					"columnNum": 348
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2473,
					"offsetEnd": 2473,
					"columnNum": 349
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2474,
					"offsetEnd": 2474,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2475,
					"offsetEnd": 2475,
					"columnNum": 351
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2476,
					"offsetEnd": 2476,
					"columnNum": 352
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2477,
					"offsetEnd": 2477,
					"columnNum": 353
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2478,
					"offsetEnd": 2478,
					"columnNum": 354
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2479,
					"offsetEnd": 2479,
					"columnNum": 355
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2480,
					"offsetEnd": 2480,
					"columnNum": 356
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2481,
					"offsetEnd": 2481,
					"columnNum": 357
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2482,
					"offsetEnd": 2482,
					"columnNum": 358
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2483,
					"offsetEnd": 2502,
					"columnNum": 359
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score Bio",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2503,
					"offsetEnd": 2505,
					"columnNum": 360
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score Bio",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2506,
					"offsetEnd": 2508,
					"columnNum": 361
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score Bio",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2509,
					"offsetEnd": 2511,
					"columnNum": 362
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct Bio",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2512,
					"offsetEnd": 2514,
					"columnNum": 363
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score Bio",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2515,
					"offsetEnd": 2517,
					"columnNum": 364
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level Bio",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2518,
					"offsetEnd": 2519,
					"columnNum": 365
				},
				"fieldLength": 2,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level Bio",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2520,
					"offsetEnd": 2522,
					"columnNum": 366
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2523,
					"offsetEnd": 2537,
					"columnNum": 367
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High Bio",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2538,
					"offsetEnd": 2540,
					"columnNum": 368
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low Bio",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2541,
					"offsetEnd": 2543,
					"columnNum": 369
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science as Inquiry Raw Score Bio",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_AS_INQUIRY_RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2544,
					"offsetEnd": 2545,
					"columnNum": 370
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science as Inquiry Percent Correct Bio",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_AS_INQUIRY_PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2546,
					"offsetEnd": 2548,
					"columnNum": 371
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Life Science Raw Score Bio",
				"otherPossibleNames": [],
				"logicalName": "LIFE_SCIENCE_RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2549,
					"offsetEnd": 2550,
					"columnNum": 372
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Life Science Percent Correct Bio",
				"otherPossibleNames": [],
				"logicalName": "LIFE_SCIENCE_PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2551,
					"offsetEnd": 2553,
					"columnNum": 373
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Earth and Space Science Raw Score Bio",
				"otherPossibleNames": [],
				"logicalName": "EARTH_AND_SPACE_SCIENCE_RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2554,
					"offsetEnd": 2555,
					"columnNum": 374
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Earth and Space Science Percent Correct Bio",
				"otherPossibleNames": [],
				"logicalName": "EARTH_AND_SPACE_SCIENCE_PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2556,
					"offsetEnd": 2558,
					"columnNum": 375
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2559,
					"offsetEnd": 2578,
					"columnNum": 376
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - Biology",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2579,
					"offsetEnd": 2580,
					"columnNum": 377
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reportable status",
				"otherPossibleNames": [],
				"logicalName": "REPORTABLE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2581,
					"offsetEnd": 2581,
					"columnNum": 378
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt BIO",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2582,
					"offsetEnd": 2582,
					"columnNum": 379
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Launch Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_LAUNCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2583,
					"offsetEnd": 2583,
					"columnNum": 380
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag BIO",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2584,
					"offsetEnd": 2584,
					"columnNum": 381
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Retest Flag",
				"otherPossibleNames": [],
				"logicalName": "RETEST_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2585,
					"offsetEnd": 2585,
					"columnNum": 382
				},
				"fieldLength": 1,
				"expectedValues": ["", "I", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eligible Flag",
				"otherPossibleNames": [],
				"logicalName": "ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2586,
					"offsetEnd": 2586,
					"columnNum": 383
				},
				"fieldLength": 1,
				"expectedValues": ["", "E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2587,
					"offsetEnd": 2587,
					"columnNum": 384
				},
				"fieldLength": 1,
				"expectedValues": ["", "R", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2588,
					"offsetEnd": 2597,
					"columnNum": 385
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Session / Class Roster Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_SESSION_/_CLASS_ROSTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2598,
					"offsetEnd": 2598,
					"columnNum": 386
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2599,
					"offsetEnd": 2599,
					"columnNum": 387
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Roster",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2600,
					"offsetEnd": 2600,
					"columnNum": 388
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2601,
					"offsetEnd": 2610,
					"columnNum": 389
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration year of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2611,
					"offsetEnd": 2614,
					"columnNum": 390
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Administration month of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2615,
					"offsetEnd": 2616,
					"columnNum": 391
				},
				"fieldLength": 2,
				"expectedValues": ["", "05", "06", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest previous scale score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2617,
					"offsetEnd": 2619,
					"columnNum": 392
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest Previous Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2620,
					"offsetEnd": 2622,
					"columnNum": 393
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2623,
					"offsetEnd": 2632,
					"columnNum": 394
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2633,
					"offsetEnd": 2832,
					"columnNum": 395
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Field Test Item Responses",
				"otherPossibleNames": [],
				"logicalName": "FIELD_TEST_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2833,
					"offsetEnd": 2932,
					"columnNum": 396
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2933,
					"offsetEnd": 2948,
					"columnNum": 397
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Error Administration",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2949,
					"offsetEnd": 2949,
					"columnNum": 398
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content ENGIII",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2950,
					"offsetEnd": 2954,
					"columnNum": 399
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2955,
					"offsetEnd": 2960,
					"columnNum": 400
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2961,
					"offsetEnd": 2980,
					"columnNum": 401
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher First Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2981,
					"offsetEnd": 2995,
					"columnNum": 402
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2996,
					"offsetEnd": 2996,
					"columnNum": 403
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2997,
					"offsetEnd": 2999,
					"columnNum": 404
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3000,
					"offsetEnd": 3019,
					"columnNum": 405
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator First Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3020,
					"offsetEnd": 3039,
					"columnNum": 406
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3040,
					"offsetEnd": 3040,
					"columnNum": 407
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Code",
				"otherPossibleNames": [],
				"logicalName": "COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3041,
					"offsetEnd": 3046,
					"columnNum": 408
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Name",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3047,
					"offsetEnd": 3076,
					"columnNum": 409
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3077,
					"offsetEnd": 3096,
					"columnNum": 410
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Site Code",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3097,
					"offsetEnd": 3102,
					"columnNum": 411
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English III Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_III_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3103,
					"offsetEnd": 3103,
					"columnNum": 412
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3104,
					"offsetEnd": 3123,
					"columnNum": 413
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 1 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_1_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3124,
					"offsetEnd": 3124,
					"columnNum": 414
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 2 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_2_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3125,
					"offsetEnd": 3125,
					"columnNum": 415
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3126,
					"offsetEnd": 3126,
					"columnNum": 416
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3132,
					"offsetEnd": 3132,
					"columnNum": 417
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3133,
					"offsetEnd": 3133,
					"columnNum": 418
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3134,
					"offsetEnd": 3134,
					"columnNum": 419
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3135,
					"offsetEnd": 3135,
					"columnNum": 420
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3136,
					"offsetEnd": 3136,
					"columnNum": 421
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3137,
					"offsetEnd": 3137,
					"columnNum": 422
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3138,
					"offsetEnd": 3138,
					"columnNum": 423
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3139,
					"offsetEnd": 3139,
					"columnNum": 424
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3140,
					"offsetEnd": 3140,
					"columnNum": 425
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3141,
					"offsetEnd": 3141,
					"columnNum": 426
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 427
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3143,
					"offsetEnd": 3143,
					"columnNum": 428
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 429
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3145,
					"offsetEnd": 3145,
					"columnNum": 430
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3146,
					"offsetEnd": 3146,
					"columnNum": 431
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3147,
					"offsetEnd": 3147,
					"columnNum": 432
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3148,
					"offsetEnd": 3148,
					"columnNum": 433
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3149,
					"offsetEnd": 3149,
					"columnNum": 434
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3150,
					"offsetEnd": 3150,
					"columnNum": 435
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3151,
					"offsetEnd": 3151,
					"columnNum": 436
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3152,
					"offsetEnd": 3152,
					"columnNum": 437
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3153,
					"offsetEnd": 3153,
					"columnNum": 438
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3154,
					"offsetEnd": 3154,
					"columnNum": 439
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3155,
					"offsetEnd": 3155,
					"columnNum": 440
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3156,
					"offsetEnd": 3156,
					"columnNum": 441
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3157,
					"offsetEnd": 3157,
					"columnNum": 442
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3158,
					"offsetEnd": 3158,
					"columnNum": 443
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3159,
					"offsetEnd": 3159,
					"columnNum": 444
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3160,
					"offsetEnd": 3179,
					"columnNum": 445
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3180,
					"offsetEnd": 3182,
					"columnNum": 446
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3183,
					"offsetEnd": 3185,
					"columnNum": 447
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3186,
					"offsetEnd": 3188,
					"columnNum": 448
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct EngIII",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3189,
					"offsetEnd": 3191,
					"columnNum": 449
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3192,
					"offsetEnd": 3194,
					"columnNum": 450
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level EngIII",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3195,
					"offsetEnd": 3196,
					"columnNum": 451
				},
				"fieldLength": 2,
				"expectedValues": ["E", "G", "F", "NI", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level EngIII",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3197,
					"offsetEnd": 3199,
					"columnNum": 452
				},
				"fieldLength": 3,
				"expectedValues": ["EXC", "GOD", "FAI", "NIP", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3200,
					"offsetEnd": 3214,
					"columnNum": 453
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High EngIII",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3215,
					"offsetEnd": 3217,
					"columnNum": 454
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low EngIII",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3218,
					"offsetEnd": 3220,
					"columnNum": 455
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing and Language Conventions Raw Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3221,
					"offsetEnd": 3222,
					"columnNum": 456
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing and Language Conventions Percent Correct EngIII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3223,
					"offsetEnd": 3225,
					"columnNum": 457
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3226,
					"offsetEnd": 3227,
					"columnNum": 458
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Percent Correct EngIII",
				"otherPossibleNames": [],
				"logicalName": "READING_PERCENT_CORRECT_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3228,
					"offsetEnd": 3230,
					"columnNum": 459
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Research Raw Score EngIII",
				"otherPossibleNames": [],
				"logicalName": "RESEARCH_RAW_SCORE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3231,
					"offsetEnd": 3232,
					"columnNum": 460
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Research Percent Correct EngIII",
				"otherPossibleNames": [],
				"logicalName": "RESEARCH_PERCENT_CORRECT_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3233,
					"offsetEnd": 3235,
					"columnNum": 461
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3236,
					"offsetEnd": 3255,
					"columnNum": 462
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - English III",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3256,
					"offsetEnd": 3257,
					"columnNum": 463
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reportable status",
				"otherPossibleNames": [],
				"logicalName": "REPORTABLE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3258,
					"offsetEnd": 3258,
					"columnNum": 464
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt ENGIII",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3259,
					"offsetEnd": 3259,
					"columnNum": 465
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Launch Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_LAUNCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3260,
					"offsetEnd": 3260,
					"columnNum": 466
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag ENGIII",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ENGIII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3261,
					"offsetEnd": 3261,
					"columnNum": 467
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Retest Flag",
				"otherPossibleNames": [],
				"logicalName": "RETEST_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3262,
					"offsetEnd": 3262,
					"columnNum": 468
				},
				"fieldLength": 1,
				"expectedValues": ["", "I", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eligible Flag",
				"otherPossibleNames": [],
				"logicalName": "ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3263,
					"offsetEnd": 3263,
					"columnNum": 469
				},
				"fieldLength": 1,
				"expectedValues": ["", "E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3264,
					"offsetEnd": 3264,
					"columnNum": 470
				},
				"fieldLength": 1,
				"expectedValues": ["", "R", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3265,
					"offsetEnd": 3274,
					"columnNum": 471
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Session / Class Roster Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_SESSION_/_CLASS_ROSTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3275,
					"offsetEnd": 3275,
					"columnNum": 472
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3276,
					"offsetEnd": 3276,
					"columnNum": 473
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Roster",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3277,
					"offsetEnd": 3277,
					"columnNum": 474
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3278,
					"offsetEnd": 3287,
					"columnNum": 475
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration year of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3288,
					"offsetEnd": 3291,
					"columnNum": 476
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Administration month of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3292,
					"offsetEnd": 3293,
					"columnNum": 477
				},
				"fieldLength": 2,
				"expectedValues": ["", "05", "06", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest previous scale score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3294,
					"offsetEnd": 3296,
					"columnNum": 478
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest Previous Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3297,
					"offsetEnd": 3299,
					"columnNum": 479
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3300,
					"offsetEnd": 3309,
					"columnNum": 480
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3310,
					"offsetEnd": 3509,
					"columnNum": 481
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Field Test Item Responses",
				"otherPossibleNames": [],
				"logicalName": "FIELD_TEST_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3510,
					"offsetEnd": 3609,
					"columnNum": 482
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3610,
					"offsetEnd": 3625,
					"columnNum": 483
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Error Administration",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3626,
					"offsetEnd": 3626,
					"columnNum": 484
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content USHIST",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3627,
					"offsetEnd": 3631,
					"columnNum": 485
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3632,
					"offsetEnd": 3637,
					"columnNum": 486
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3638,
					"offsetEnd": 3657,
					"columnNum": 487
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher First Name",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3658,
					"offsetEnd": 3672,
					"columnNum": 488
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Teacher Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3673,
					"offsetEnd": 3673,
					"columnNum": 489
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3674,
					"offsetEnd": 3676,
					"columnNum": 490
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Last Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3677,
					"offsetEnd": 3696,
					"columnNum": 491
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator First Name",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3697,
					"offsetEnd": 3716,
					"columnNum": 492
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Administrator Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3717,
					"offsetEnd": 3717,
					"columnNum": 493
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Code",
				"otherPossibleNames": [],
				"logicalName": "COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3718,
					"offsetEnd": 3723,
					"columnNum": 494
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Course Name",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3724,
					"offsetEnd": 3753,
					"columnNum": 495
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3754,
					"offsetEnd": 3773,
					"columnNum": 496
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Site Code",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3774,
					"offsetEnd": 3779,
					"columnNum": 497
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "U.S. History Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "U.S._HISTORY_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3780,
					"offsetEnd": 3780,
					"columnNum": 498
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3781,
					"offsetEnd": 3799,
					"columnNum": 499
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 0 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_0_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3800,
					"offsetEnd": 3800,
					"columnNum": 500
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 1 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_1_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3801,
					"offsetEnd": 3801,
					"columnNum": 501
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 2 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_2_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3802,
					"offsetEnd": 3802,
					"columnNum": 502
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3803,
					"offsetEnd": 3803,
					"columnNum": 503
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3808,
					"columnNum": 504
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3809,
					"offsetEnd": 3809,
					"columnNum": 505
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3810,
					"offsetEnd": 3810,
					"columnNum": 506
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3811,
					"offsetEnd": 3811,
					"columnNum": 507
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3812,
					"offsetEnd": 3812,
					"columnNum": 508
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3813,
					"offsetEnd": 3813,
					"columnNum": 509
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3814,
					"offsetEnd": 3814,
					"columnNum": 510
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3815,
					"offsetEnd": 3815,
					"columnNum": 511
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3816,
					"offsetEnd": 3816,
					"columnNum": 512
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3817,
					"offsetEnd": 3817,
					"columnNum": 513
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3818,
					"offsetEnd": 3818,
					"columnNum": 514
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3819,
					"offsetEnd": 3819,
					"columnNum": 515
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3820,
					"offsetEnd": 3820,
					"columnNum": 516
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3821,
					"offsetEnd": 3821,
					"columnNum": 517
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3822,
					"offsetEnd": 3822,
					"columnNum": 518
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3823,
					"offsetEnd": 3823,
					"columnNum": 519
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3824,
					"offsetEnd": 3824,
					"columnNum": 520
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Human Read Aloud / FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3825,
					"offsetEnd": 3825,
					"columnNum": 521
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3826,
					"offsetEnd": 3826,
					"columnNum": 522
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3827,
					"offsetEnd": 3827,
					"columnNum": 523
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3828,
					"offsetEnd": 3828,
					"columnNum": 524
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Language Word-to-Word Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3829,
					"offsetEnd": 3829,
					"columnNum": 525
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3830,
					"offsetEnd": 3830,
					"columnNum": 526
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Communication Assistance",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3831,
					"offsetEnd": 3831,
					"columnNum": 527
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Transferred Answers",
				"otherPossibleNames": [],
				"logicalName": "TRANSFERRED_ANSWERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3832,
					"offsetEnd": 3832,
					"columnNum": 528
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Answers Recorded",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3833,
					"offsetEnd": 3833,
					"columnNum": 529
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3834,
					"offsetEnd": 3834,
					"columnNum": 530
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extended Time",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3835,
					"offsetEnd": 3835,
					"columnNum": 531
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Individual or Small Group Administration",
				"otherPossibleNames": [],
				"logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3836,
					"offsetEnd": 3836,
					"columnNum": 532
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3837,
					"offsetEnd": 3856,
					"columnNum": 533
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score USHist",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3857,
					"offsetEnd": 3859,
					"columnNum": 534
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score USHist",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3860,
					"offsetEnd": 3862,
					"columnNum": 535
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score USHist",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3863,
					"offsetEnd": 3865,
					"columnNum": 536
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct USHist",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3866,
					"offsetEnd": 3868,
					"columnNum": 537
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score USHist",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3869,
					"offsetEnd": 3871,
					"columnNum": 538
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level USHist",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3872,
					"offsetEnd": 3873,
					"columnNum": 539
				},
				"fieldLength": 2,
				"expectedValues": ["E", "G", "F", "NI", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level USHist",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3874,
					"offsetEnd": 3876,
					"columnNum": 540
				},
				"fieldLength": 3,
				"expectedValues": ["EXC", "GOD", "FAI", "NIP", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3877,
					"offsetEnd": 3891,
					"columnNum": 541
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High USHist",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3892,
					"offsetEnd": 3894,
					"columnNum": 542
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low USHist",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3895,
					"offsetEnd": 3897,
					"columnNum": 543
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Western Expansion to Progressivism - Standard 2 - Raw Score USHist",
				"otherPossibleNames": [],
				"logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RAW_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3898,
					"offsetEnd": 3899,
					"columnNum": 544
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Western Expansion to Progressivism - Standard 2 - Percent Correct USHist",
				"otherPossibleNames": [],
				"logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_PERCENT_CORRECT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3900,
					"offsetEnd": 3902,
					"columnNum": 545
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Isolationism through the Great War - Standard 3 - Raw Score USHist",
				"otherPossibleNames": [],
				"logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RAW_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3903,
					"offsetEnd": 3904,
					"columnNum": 546
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Isolationism through the Great War - Standard 3 - Percent Correct USHist",
				"otherPossibleNames": [],
				"logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_PERCENT_CORRECT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3905,
					"offsetEnd": 3907,
					"columnNum": 547
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Becoming a World Power through World War II - Standard 4 - Raw Score USHist",
				"otherPossibleNames": [],
				"logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RAW_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3908,
					"offsetEnd": 3909,
					"columnNum": 548
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Becoming a World Power through World War II - Standard 4 - Percent Correct USHist",
				"otherPossibleNames": [],
				"logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_PERCENT_CORRECT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3910,
					"offsetEnd": 3912,
					"columnNum": 549
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Cold War Era - Standard 5 - Raw Score USHist",
				"otherPossibleNames": [],
				"logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_RAW_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3913,
					"offsetEnd": 3914,
					"columnNum": 550
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Cold War Era - Standard 5 - Percent CorrectUSHist",
				"otherPossibleNames": [],
				"logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_PERCENT_CORRECT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3915,
					"offsetEnd": 3917,
					"columnNum": 551
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "The Modern Age - Standard 6 - Raw Score USHist",
				"otherPossibleNames": [],
				"logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_RAW_SCORE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3918,
					"offsetEnd": 3919,
					"columnNum": 552
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "The Modern Age - Standard 6 - Percent Correct USHist",
				"otherPossibleNames": [],
				"logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_PERCENT_CORRECT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3920,
					"offsetEnd": 3922,
					"columnNum": 553
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3923,
					"offsetEnd": 3942,
					"columnNum": 554
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - U.S. History",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3943,
					"offsetEnd": 3944,
					"columnNum": 555
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reportable status",
				"otherPossibleNames": [],
				"logicalName": "REPORTABLE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3945,
					"offsetEnd": 3945,
					"columnNum": 556
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt USHIST",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3946,
					"offsetEnd": 3946,
					"columnNum": 557
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Launch Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_LAUNCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3947,
					"offsetEnd": 3947,
					"columnNum": 558
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag USHIST",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3948,
					"offsetEnd": 3948,
					"columnNum": 559
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Retest Flag",
				"otherPossibleNames": [],
				"logicalName": "RETEST_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3949,
					"offsetEnd": 3949,
					"columnNum": 560
				},
				"fieldLength": 1,
				"expectedValues": ["", "I", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eligible Flag",
				"otherPossibleNames": [],
				"logicalName": "ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3950,
					"offsetEnd": 3950,
					"columnNum": 561
				},
				"fieldLength": 1,
				"expectedValues": ["", "E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rescore Flag",
				"otherPossibleNames": [],
				"logicalName": "RESCORE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3951,
					"offsetEnd": 3951,
					"columnNum": 562
				},
				"fieldLength": 1,
				"expectedValues": ["", "R", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3952,
					"offsetEnd": 3961,
					"columnNum": 563
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Session / Class Roster Flag",
				"otherPossibleNames": [],
				"logicalName": "TEST_SESSION_/_CLASS_ROSTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3962,
					"offsetEnd": 3962,
					"columnNum": 564
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Report",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3963,
					"offsetEnd": 3963,
					"columnNum": 565
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Roster",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3964,
					"offsetEnd": 3964,
					"columnNum": 566
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3965,
					"offsetEnd": 3974,
					"columnNum": 567
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration year of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3975,
					"offsetEnd": 3978,
					"columnNum": 568
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Administration month of previous highest score",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3979,
					"offsetEnd": 3980,
					"columnNum": 569
				},
				"fieldLength": 2,
				"expectedValues": ["", "05", "06", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest previous scale score",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3981,
					"offsetEnd": 3983,
					"columnNum": 570
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Highest Previous Assessment Achievement Level",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3984,
					"offsetEnd": 3986,
					"columnNum": 571
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3987,
					"offsetEnd": 3996,
					"columnNum": 572
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3997,
					"offsetEnd": 4196,
					"columnNum": 573
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Field Test Item Responses",
				"otherPossibleNames": [],
				"logicalName": "FIELD_TEST_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4197,
					"offsetEnd": 4296,
					"columnNum": 574
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4297,
					"offsetEnd": 4316,
					"columnNum": 575
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Full Student First Name",
				"otherPossibleNames": [],
				"logicalName": "FULL_STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4317,
					"offsetEnd": 4331,
					"columnNum": 576
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Full Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "FULL_STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4332,
					"offsetEnd": 4351,
					"columnNum": 577
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv"]
}