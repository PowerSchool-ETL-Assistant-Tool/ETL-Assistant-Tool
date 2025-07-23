{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_2025_1819_Fixed",
    "recordLength": 6548,
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
				"physicalName": "School System Code",
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
				"physicalName": "School System Name",
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
				"physicalName": "School System Reporting Rolled Up Code",
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
				"physicalName": "Reporting EL Status",
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
				"physicalName": "Precode EL Status",
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
				"physicalName": "Military Affiliated",
				"otherPossibleNames": [],
				"logicalName": "MILITARY_AFFILIATED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 223,
					"offsetEnd": 223,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Foster Care",
				"otherPossibleNames": [],
				"logicalName": "FOSTER_CARE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 224,
					"offsetEnd": 224,
					"columnNum": 46
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
					"offsetStart": 225,
					"offsetEnd": 233,
					"columnNum": 47
				},
				"fieldLength": 9,
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
					"columnNum": 48
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
					"offsetEnd": 242,
					"columnNum": 49
				},
				"fieldLength": 8,
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
					"offsetStart": 243,
					"offsetEnd": 250,
					"columnNum": 50
				},
				"fieldLength": 8,
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
					"offsetStart": 251,
					"offsetEnd": 270,
					"columnNum": 51
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
					"offsetStart": 271,
					"offsetEnd": 285,
					"columnNum": 52
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
					"offsetStart": 286,
					"offsetEnd": 286,
					"columnNum": 53
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
					"offsetStart": 287,
					"offsetEnd": 289,
					"columnNum": 54
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
					"offsetStart": 290,
					"offsetEnd": 309,
					"columnNum": 55
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
					"offsetStart": 310,
					"offsetEnd": 329,
					"columnNum": 56
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
					"offsetStart": 330,
					"offsetEnd": 330,
					"columnNum": 57
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
					"offsetStart": 331,
					"offsetEnd": 336,
					"columnNum": 58
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
					"offsetStart": 337,
					"offsetEnd": 366,
					"columnNum": 59
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
					"offsetStart": 367,
					"offsetEnd": 386,
					"columnNum": 60
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
					"offsetStart": 387,
					"offsetEnd": 392,
					"columnNum": 61
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
					"offsetStart": 393,
					"offsetEnd": 393,
					"columnNum": 62
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
					"offsetStart": 394,
					"offsetEnd": 394,
					"columnNum": 63
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
					"offsetStart": 395,
					"offsetEnd": 409,
					"columnNum": 64
				},
				"fieldLength": 15,
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
					"columnNum": 65
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
					"columnNum": 66
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
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 4 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_4_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 413,
					"offsetEnd": 413,
					"columnNum": 68
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
					"offsetStart": 414,
					"offsetEnd": 417,
					"columnNum": 69
				},
				"fieldLength": 4,
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
					"columnNum": 70
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
					"columnNum": 71
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 420,
					"offsetEnd": 420,
					"columnNum": 72
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
					"columnNum": 73
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
					"columnNum": 74
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
					"columnNum": 75
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
					"columnNum": 76
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
					"columnNum": 77
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
					"columnNum": 78
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
					"columnNum": 79
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
					"columnNum": 80
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
					"columnNum": 81
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
					"columnNum": 82
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
					"columnNum": 83
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
					"columnNum": 84
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
					"columnNum": 85
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
					"offsetStart": 434,
					"offsetEnd": 434,
					"columnNum": 86
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
					"columnNum": 87
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
					"columnNum": 88
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
					"columnNum": 89
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
					"columnNum": 90
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
					"columnNum": 91
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
					"columnNum": 92
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
					"columnNum": 93
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
					"columnNum": 94
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
					"columnNum": 95
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scientific Calculator",
				"otherPossibleNames": [],
				"logicalName": "SCIENTIFIC_CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 444,
					"offsetEnd": 444,
					"columnNum": 96
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Graphing Calculator",
				"otherPossibleNames": [],
				"logicalName": "GRAPHING_CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 445,
					"offsetEnd": 445,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": [],
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
					"offsetStart": 446,
					"offsetEnd": 446,
					"columnNum": 98
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
					"offsetStart": 447,
					"offsetEnd": 447,
					"columnNum": 99
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
					"offsetStart": 448,
					"offsetEnd": 465,
					"columnNum": 100
				},
				"fieldLength": 18,
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
					"columnNum": 101
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
					"columnNum": 102
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
					"columnNum": 103
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
					"columnNum": 104
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
					"columnNum": 105
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
					"offsetEnd": 483,
					"columnNum": 106
				},
				"fieldLength": 3,
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
					"offsetStart": 484,
					"offsetEnd": 486,
					"columnNum": 107
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
					"offsetStart": 487,
					"offsetEnd": 500,
					"columnNum": 108
				},
				"fieldLength": 14,
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
					"columnNum": 109
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
					"columnNum": 110
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Major Content Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 507,
					"offsetEnd": 510,
					"columnNum": 111
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Major Content Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 511,
					"offsetEnd": 511,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Major Content Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 512,
					"offsetEnd": 514,
					"columnNum": 113
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 515,
					"offsetEnd": 518,
					"columnNum": 114
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 519,
					"offsetEnd": 519,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 520,
					"offsetEnd": 522,
					"columnNum": 116
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 523,
					"offsetEnd": 526,
					"columnNum": 117
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 527,
					"offsetEnd": 527,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 528,
					"offsetEnd": 530,
					"columnNum": 119
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 531,
					"offsetEnd": 534,
					"columnNum": 120
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 535,
					"offsetEnd": 535,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 536,
					"offsetEnd": 538,
					"columnNum": 122
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
					"offsetStart": 539,
					"offsetEnd": 540,
					"columnNum": 123
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Interpreting Functions Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "INTERPRETING_FUNCTIONS_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 541,
					"offsetEnd": 544,
					"columnNum": 124
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Interpreting Functions Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "INTERPRETING_FUNCTIONS_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 545,
					"offsetEnd": 545,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Interpreting Functions Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "INTERPRETING_FUNCTIONS_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 546,
					"offsetEnd": 548,
					"columnNum": 126
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Solving Algebraically Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_ALGEBRAICALLY_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 549,
					"offsetEnd": 552,
					"columnNum": 127
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solving Algebraically Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_ALGEBRAICALLY_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 553,
					"offsetEnd": 553,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solving Algebraically Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_ALGEBRAICALLY_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 554,
					"offsetEnd": 556,
					"columnNum": 129
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Solving Graphically/Rate of Change Raw Score AlgI",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_RAW_SCORE_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 557,
					"offsetEnd": 560,
					"columnNum": 130
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solving Graphically/Rate of Change Rating AlgI",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_RATING_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 561,
					"offsetEnd": 561,
					"columnNum": 131
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solving Graphically/Rate of Change Percent Correct AlgI",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_PERCENT_CORRECT_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 562,
					"offsetEnd": 564,
					"columnNum": 132
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
					"offsetStart": 565,
					"offsetEnd": 566,
					"columnNum": 133
				},
				"fieldLength": 2,
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
					"offsetStart": 567,
					"offsetEnd": 568,
					"columnNum": 134
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
					"offsetStart": 569,
					"offsetEnd": 569,
					"columnNum": 135
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
					"offsetStart": 570,
					"offsetEnd": 570,
					"columnNum": 136
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
					"offsetStart": 571,
					"offsetEnd": 571,
					"columnNum": 137
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
					"offsetStart": 572,
					"offsetEnd": 572,
					"columnNum": 138
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
					"offsetStart": 573,
					"offsetEnd": 573,
					"columnNum": 139
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
					"offsetStart": 574,
					"offsetEnd": 574,
					"columnNum": 140
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
					"offsetStart": 575,
					"offsetEnd": 575,
					"columnNum": 141
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
					"offsetStart": 576,
					"offsetEnd": 577,
					"columnNum": 142
				},
				"fieldLength": 2,
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
					"offsetStart": 578,
					"offsetEnd": 578,
					"columnNum": 143
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
					"offsetStart": 579,
					"offsetEnd": 579,
					"columnNum": 144
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
					"offsetStart": 580,
					"offsetEnd": 580,
					"columnNum": 145
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
					"offsetStart": 581,
					"offsetEnd": 590,
					"columnNum": 146
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
					"offsetStart": 591,
					"offsetEnd": 594,
					"columnNum": 147
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
					"offsetStart": 595,
					"offsetEnd": 596,
					"columnNum": 148
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
					"offsetStart": 597,
					"offsetEnd": 599,
					"columnNum": 149
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
					"offsetStart": 600,
					"offsetEnd": 602,
					"columnNum": 150
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 603,
					"offsetEnd": 603,
					"columnNum": 151
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
					"offsetStart": 604,
					"offsetEnd": 612,
					"columnNum": 152
				},
				"fieldLength": 9,
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
					"offsetStart": 613,
					"offsetEnd": 812,
					"columnNum": 153
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
					"offsetStart": 813,
					"offsetEnd": 912,
					"columnNum": 154
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
					"offsetStart": 913,
					"offsetEnd": 928,
					"columnNum": 155
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
					"offsetStart": 929,
					"offsetEnd": 929,
					"columnNum": 156
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
					"offsetStart": 930,
					"offsetEnd": 937,
					"columnNum": 157
				},
				"fieldLength": 8,
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
					"offsetStart": 938,
					"offsetEnd": 945,
					"columnNum": 158
				},
				"fieldLength": 8,
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
					"offsetStart": 946,
					"offsetEnd": 965,
					"columnNum": 159
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
					"offsetStart": 966,
					"offsetEnd": 980,
					"columnNum": 160
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
					"offsetStart": 981,
					"offsetEnd": 981,
					"columnNum": 161
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
					"offsetStart": 982,
					"offsetEnd": 984,
					"columnNum": 162
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
					"offsetStart": 985,
					"offsetEnd": 1004,
					"columnNum": 163
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
					"offsetStart": 1005,
					"offsetEnd": 1024,
					"columnNum": 164
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
					"offsetStart": 1025,
					"offsetEnd": 1025,
					"columnNum": 165
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
					"offsetStart": 1026,
					"offsetEnd": 1031,
					"columnNum": 166
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
					"offsetStart": 1032,
					"offsetEnd": 1061,
					"columnNum": 167
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
					"offsetStart": 1062,
					"offsetEnd": 1081,
					"columnNum": 168
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
					"offsetStart": 1082,
					"offsetEnd": 1087,
					"columnNum": 169
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
					"offsetStart": 1088,
					"offsetEnd": 1088,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_COHORTFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1089,
					"offsetEnd": 1089,
					"columnNum": 171
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
					"offsetStart": 1090,
					"offsetEnd": 1104,
					"columnNum": 172
				},
				"fieldLength": 15,
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
					"offsetStart": 1105,
					"offsetEnd": 1105,
					"columnNum": 173
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
					"offsetStart": 1106,
					"offsetEnd": 1106,
					"columnNum": 174
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
					"offsetStart": 1107,
					"offsetEnd": 1107,
					"columnNum": 175
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
					"offsetStart": 1108,
					"offsetEnd": 1112,
					"columnNum": 176
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
					"offsetStart": 1113,
					"offsetEnd": 1113,
					"columnNum": 177
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
					"offsetStart": 1114,
					"offsetEnd": 1114,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1115,
					"offsetEnd": 1115,
					"columnNum": 179
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
					"offsetStart": 1116,
					"offsetEnd": 1116,
					"columnNum": 180
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
					"offsetStart": 1117,
					"offsetEnd": 1117,
					"columnNum": 181
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
					"offsetStart": 1118,
					"offsetEnd": 1118,
					"columnNum": 182
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
					"offsetStart": 1119,
					"offsetEnd": 1119,
					"columnNum": 183
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
					"offsetStart": 1120,
					"offsetEnd": 1120,
					"columnNum": 184
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
					"offsetStart": 1121,
					"offsetEnd": 1121,
					"columnNum": 185
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
					"offsetStart": 1122,
					"offsetEnd": 1122,
					"columnNum": 186
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
					"offsetStart": 1123,
					"offsetEnd": 1123,
					"columnNum": 187
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
					"offsetStart": 1124,
					"offsetEnd": 1124,
					"columnNum": 188
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
					"offsetStart": 1125,
					"offsetEnd": 1125,
					"columnNum": 189
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
					"offsetStart": 1126,
					"offsetEnd": 1126,
					"columnNum": 190
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
					"offsetStart": 1127,
					"offsetEnd": 1127,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1128,
					"offsetEnd": 1128,
					"columnNum": 192
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
					"offsetStart": 1129,
					"offsetEnd": 1129,
					"columnNum": 193
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
					"offsetStart": 1130,
					"offsetEnd": 1130,
					"columnNum": 194
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
					"offsetStart": 1131,
					"offsetEnd": 1131,
					"columnNum": 195
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
					"offsetStart": 1132,
					"offsetEnd": 1132,
					"columnNum": 196
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
					"offsetStart": 1133,
					"offsetEnd": 1133,
					"columnNum": 197
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
					"offsetStart": 1134,
					"offsetEnd": 1134,
					"columnNum": 198
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
					"offsetStart": 1135,
					"offsetEnd": 1135,
					"columnNum": 199
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
					"offsetStart": 1136,
					"offsetEnd": 1136,
					"columnNum": 200
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
					"offsetStart": 1137,
					"offsetEnd": 1137,
					"columnNum": 201
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1138,
					"offsetEnd": 1138,
					"columnNum": 202
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
					"offsetStart": 1139,
					"offsetEnd": 1139,
					"columnNum": 203
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
					"offsetStart": 1140,
					"offsetEnd": 1140,
					"columnNum": 204
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
					"offsetStart": 1141,
					"offsetEnd": 1160,
					"columnNum": 205
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
					"offsetStart": 1161,
					"offsetEnd": 1163,
					"columnNum": 206
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
					"offsetStart": 1164,
					"offsetEnd": 1166,
					"columnNum": 207
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
					"offsetStart": 1167,
					"offsetEnd": 1169,
					"columnNum": 208
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
					"offsetStart": 1170,
					"offsetEnd": 1172,
					"columnNum": 209
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
					"offsetStart": 1173,
					"offsetEnd": 1175,
					"columnNum": 210
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
					"offsetStart": 1176,
					"offsetEnd": 1178,
					"columnNum": 211
				},
				"fieldLength": 3,
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
					"offsetStart": 1179,
					"offsetEnd": 1181,
					"columnNum": 212
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
					"offsetStart": 1182,
					"offsetEnd": 1195,
					"columnNum": 213
				},
				"fieldLength": 14,
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
					"offsetStart": 1196,
					"offsetEnd": 1198,
					"columnNum": 214
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
					"offsetStart": 1199,
					"offsetEnd": 1201,
					"columnNum": 215
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1202,
					"offsetEnd": 1205,
					"columnNum": 216
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1206,
					"offsetEnd": 1206,
					"columnNum": 217
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1207,
					"offsetEnd": 1209,
					"columnNum": 218
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1210,
					"offsetEnd": 1213,
					"columnNum": 219
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1214,
					"offsetEnd": 1214,
					"columnNum": 220
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1215,
					"offsetEnd": 1217,
					"columnNum": 221
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1218,
					"offsetEnd": 1221,
					"columnNum": 222
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1222,
					"offsetEnd": 1222,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1223,
					"offsetEnd": 1225,
					"columnNum": 224
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Written Expression Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1226,
					"offsetEnd": 1229,
					"columnNum": 225
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Expression Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1230,
					"offsetEnd": 1230,
					"columnNum": 226
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Expression Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1231,
					"offsetEnd": 1233,
					"columnNum": 227
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1234,
					"offsetEnd": 1237,
					"columnNum": 228
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1238,
					"offsetEnd": 1238,
					"columnNum": 229
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1239,
					"offsetEnd": 1241,
					"columnNum": 230
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
					"offsetStart": 1242,
					"offsetEnd": 1261,
					"columnNum": 231
				},
				"fieldLength": 20,
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
					"offsetStart": 1262,
					"offsetEnd": 1265,
					"columnNum": 232
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "READING_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1266,
					"offsetEnd": 1266,
					"columnNum": 233
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "STRING",
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
					"offsetStart": 1267,
					"offsetEnd": 1269,
					"columnNum": 234
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing Raw Score EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1270,
					"offsetEnd": 1273,
					"columnNum": 235
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing Rating EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RATING_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1274,
					"offsetEnd": 1274,
					"columnNum": 236
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing Percent Correct EngII",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERCENT_CORRECT_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1275,
					"offsetEnd": 1277,
					"columnNum": 237
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
					"offsetStart": 1278,
					"offsetEnd": 1287,
					"columnNum": 238
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - English II",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_ENGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1288,
					"offsetEnd": 1289,
					"columnNum": 239
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
					"offsetStart": 1290,
					"offsetEnd": 1290,
					"columnNum": 240
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
					"offsetStart": 1291,
					"offsetEnd": 1291,
					"columnNum": 241
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
					"offsetStart": 1292,
					"offsetEnd": 1292,
					"columnNum": 242
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
					"offsetStart": 1293,
					"offsetEnd": 1293,
					"columnNum": 243
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
					"offsetStart": 1294,
					"offsetEnd": 1294,
					"columnNum": 244
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
					"offsetStart": 1295,
					"offsetEnd": 1295,
					"columnNum": 245
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
					"offsetStart": 1296,
					"offsetEnd": 1296,
					"columnNum": 246
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
					"offsetStart": 1297,
					"offsetEnd": 1306,
					"columnNum": 247
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
					"offsetStart": 1307,
					"offsetEnd": 1307,
					"columnNum": 248
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
					"offsetStart": 1308,
					"offsetEnd": 1308,
					"columnNum": 249
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
					"offsetStart": 1309,
					"offsetEnd": 1309,
					"columnNum": 250
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
					"offsetStart": 1310,
					"offsetEnd": 1319,
					"columnNum": 251
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
					"offsetStart": 1320,
					"offsetEnd": 1323,
					"columnNum": 252
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
					"offsetStart": 1324,
					"offsetEnd": 1325,
					"columnNum": 253
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
					"offsetStart": 1326,
					"offsetEnd": 1328,
					"columnNum": 254
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
					"offsetStart": 1329,
					"offsetEnd": 1331,
					"columnNum": 255
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1332,
					"offsetEnd": 1332,
					"columnNum": 256
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
					"offsetStart": 1333,
					"offsetEnd": 1341,
					"columnNum": 257
				},
				"fieldLength": 9,
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
					"offsetStart": 1342,
					"offsetEnd": 1541,
					"columnNum": 258
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
					"offsetStart": 1542,
					"offsetEnd": 1641,
					"columnNum": 259
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
					"offsetStart": 1642,
					"offsetEnd": 1657,
					"columnNum": 260
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
					"offsetStart": 1658,
					"offsetEnd": 1658,
					"columnNum": 261
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
					"offsetStart": 1659,
					"offsetEnd": 1666,
					"columnNum": 262
				},
				"fieldLength": 8,
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
					"offsetStart": 1667,
					"offsetEnd": 1674,
					"columnNum": 263
				},
				"fieldLength": 8,
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
					"offsetStart": 1675,
					"offsetEnd": 1694,
					"columnNum": 264
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
					"offsetStart": 1695,
					"offsetEnd": 1709,
					"columnNum": 265
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
					"offsetStart": 1710,
					"offsetEnd": 1710,
					"columnNum": 266
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
					"offsetStart": 1711,
					"offsetEnd": 1713,
					"columnNum": 267
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
					"offsetStart": 1714,
					"offsetEnd": 1733,
					"columnNum": 268
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
					"offsetStart": 1734,
					"offsetEnd": 1753,
					"columnNum": 269
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
					"offsetStart": 1754,
					"offsetEnd": 1754,
					"columnNum": 270
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
					"offsetStart": 1755,
					"offsetEnd": 1760,
					"columnNum": 271
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
					"offsetStart": 1761,
					"offsetEnd": 1790,
					"columnNum": 272
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
					"offsetStart": 1791,
					"offsetEnd": 1810,
					"columnNum": 273
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
					"offsetStart": 1811,
					"offsetEnd": 1816,
					"columnNum": 274
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
					"offsetStart": 1817,
					"offsetEnd": 1817,
					"columnNum": 275
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
					"offsetStart": 1818,
					"offsetEnd": 1832,
					"columnNum": 276
				},
				"fieldLength": 15,
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
					"offsetStart": 1833,
					"offsetEnd": 1833,
					"columnNum": 277
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
					"offsetStart": 1834,
					"offsetEnd": 1834,
					"columnNum": 278
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
					"offsetStart": 1835,
					"offsetEnd": 1835,
					"columnNum": 279
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 4 Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_4_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1836,
					"offsetEnd": 1836,
					"columnNum": 280
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
					"offsetStart": 1837,
					"offsetEnd": 1840,
					"columnNum": 281
				},
				"fieldLength": 4,
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
					"offsetStart": 1841,
					"offsetEnd": 1841,
					"columnNum": 282
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
					"offsetStart": 1842,
					"offsetEnd": 1842,
					"columnNum": 283
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1843,
					"offsetEnd": 1843,
					"columnNum": 284
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
					"offsetStart": 1844,
					"offsetEnd": 1844,
					"columnNum": 285
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
					"offsetStart": 1845,
					"offsetEnd": 1845,
					"columnNum": 286
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
					"offsetStart": 1846,
					"offsetEnd": 1846,
					"columnNum": 287
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
					"offsetStart": 1847,
					"offsetEnd": 1847,
					"columnNum": 288
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
					"offsetStart": 1848,
					"offsetEnd": 1848,
					"columnNum": 289
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
					"offsetStart": 1849,
					"offsetEnd": 1849,
					"columnNum": 290
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
					"offsetStart": 1850,
					"offsetEnd": 1850,
					"columnNum": 291
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
					"offsetStart": 1851,
					"offsetEnd": 1851,
					"columnNum": 292
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
					"offsetStart": 1852,
					"offsetEnd": 1852,
					"columnNum": 293
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
					"offsetStart": 1853,
					"offsetEnd": 1853,
					"columnNum": 294
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
					"offsetStart": 1854,
					"offsetEnd": 1854,
					"columnNum": 295
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
					"offsetStart": 1855,
					"offsetEnd": 1855,
					"columnNum": 296
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
					"offsetStart": 1856,
					"offsetEnd": 1856,
					"columnNum": 297
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
					"offsetStart": 1857,
					"offsetEnd": 1857,
					"columnNum": 298
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
					"offsetStart": 1858,
					"offsetEnd": 1858,
					"columnNum": 299
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
					"offsetStart": 1859,
					"offsetEnd": 1859,
					"columnNum": 300
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
					"offsetStart": 1860,
					"offsetEnd": 1860,
					"columnNum": 301
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
					"offsetStart": 1861,
					"offsetEnd": 1861,
					"columnNum": 302
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
					"offsetStart": 1862,
					"offsetEnd": 1862,
					"columnNum": 303
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
					"offsetStart": 1863,
					"offsetEnd": 1863,
					"columnNum": 304
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
					"offsetStart": 1864,
					"offsetEnd": 1864,
					"columnNum": 305
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
					"offsetStart": 1865,
					"offsetEnd": 1865,
					"columnNum": 306
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
					"offsetStart": 1866,
					"offsetEnd": 1866,
					"columnNum": 307
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scientific Calculator",
				"otherPossibleNames": [],
				"logicalName": "SCIENTIFIC_CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1867,
					"offsetEnd": 1867,
					"columnNum": 308
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Graphing Calculator",
				"otherPossibleNames": [],
				"logicalName": "GRAPHING_CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1868,
					"offsetEnd": 1868,
					"columnNum": 309
				},
				"fieldLength": 1,
				"expectedValues": [],
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
					"offsetStart": 1869,
					"offsetEnd": 1869,
					"columnNum": 310
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
					"offsetStart": 1870,
					"offsetEnd": 1870,
					"columnNum": 311
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
					"offsetStart": 1871,
					"offsetEnd": 1888,
					"columnNum": 312
				},
				"fieldLength": 18,
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
					"offsetStart": 1889,
					"offsetEnd": 1891,
					"columnNum": 313
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
					"offsetStart": 1892,
					"offsetEnd": 1894,
					"columnNum": 314
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
					"offsetStart": 1895,
					"offsetEnd": 1897,
					"columnNum": 315
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
					"offsetStart": 1898,
					"offsetEnd": 1900,
					"columnNum": 316
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
					"offsetStart": 1901,
					"offsetEnd": 1903,
					"columnNum": 317
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
					"offsetStart": 1904,
					"offsetEnd": 1906,
					"columnNum": 318
				},
				"fieldLength": 3,
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
					"offsetStart": 1907,
					"offsetEnd": 1909,
					"columnNum": 319
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
					"offsetStart": 1910,
					"offsetEnd": 1923,
					"columnNum": 320
				},
				"fieldLength": 14,
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
					"offsetStart": 1924,
					"offsetEnd": 1926,
					"columnNum": 321
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
					"offsetStart": 1927,
					"offsetEnd": 1929,
					"columnNum": 322
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Major Content Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1930,
					"offsetEnd": 1933,
					"columnNum": 323
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Major Content Rating Geom",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RATING_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1934,
					"offsetEnd": 1934,
					"columnNum": 324
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Major Content Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1935,
					"offsetEnd": 1937,
					"columnNum": 325
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1938,
					"offsetEnd": 1941,
					"columnNum": 326
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content Rating Geom",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1942,
					"offsetEnd": 1942,
					"columnNum": 327
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1943,
					"offsetEnd": 1945,
					"columnNum": 328
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1946,
					"offsetEnd": 1949,
					"columnNum": 329
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Rating Geom",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1950,
					"offsetEnd": 1950,
					"columnNum": 330
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1951,
					"offsetEnd": 1953,
					"columnNum": 331
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RAW_SCORE_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1954,
					"offsetEnd": 1957,
					"columnNum": 332
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application Rating Geom",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RATING_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1958,
					"offsetEnd": 1958,
					"columnNum": 333
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_PERCENT_CORRECT_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1959,
					"offsetEnd": 1961,
					"columnNum": 334
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
					"offsetStart": 1962,
					"offsetEnd": 1962,
					"columnNum": 335
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Congruence Transformations/Similarity Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_RAW_SCORE_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1963,
					"offsetEnd": 1966,
					"columnNum": 336
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Congruence Transformations/Similarity Rating Geom",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1967,
					"offsetEnd": 1967,
					"columnNum": 337
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Congruence Transformations/Similarity Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_PERCENT_CORRECT_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1968,
					"offsetEnd": 1970,
					"columnNum": 338
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Similarity in Trigonometry/Modeling & Applying Raw Score Geom",
				"otherPossibleNames": [],
				"logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_RAW_SCORE_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1971,
					"offsetEnd": 1974,
					"columnNum": 339
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Similarity in Trigonometry/Modeling & Applying Rating Geom",
				"otherPossibleNames": [],
				"logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1975,
					"offsetEnd": 1975,
					"columnNum": 340
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Similarity in Trigonometry/Modeling & Applying Percent Correct Geom",
				"otherPossibleNames": [],
				"logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_PERCENT_CORRECT_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1976,
					"offsetEnd": 1978,
					"columnNum": 341
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
					"offsetStart": 1979,
					"offsetEnd": 1979,
					"columnNum": 342
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - Geometry",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1980,
					"offsetEnd": 1981,
					"columnNum": 343
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
					"offsetStart": 1982,
					"offsetEnd": 1982,
					"columnNum": 344
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt GEOM 2025",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1983,
					"offsetEnd": 1983,
					"columnNum": 345
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
					"offsetStart": 1984,
					"offsetEnd": 1984,
					"columnNum": 346
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag GEOM 2025",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1985,
					"offsetEnd": 1985,
					"columnNum": 347
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
					"offsetStart": 1986,
					"offsetEnd": 1986,
					"columnNum": 348
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
					"offsetStart": 1987,
					"offsetEnd": 1987,
					"columnNum": 349
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
					"offsetStart": 1988,
					"offsetEnd": 1988,
					"columnNum": 350
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
					"offsetStart": 1989,
					"offsetEnd": 1990,
					"columnNum": 351
				},
				"fieldLength": 2,
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
					"offsetStart": 1991,
					"offsetEnd": 1991,
					"columnNum": 352
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
					"offsetStart": 1992,
					"offsetEnd": 1992,
					"columnNum": 353
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
					"offsetStart": 1993,
					"offsetEnd": 1993,
					"columnNum": 354
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
					"offsetStart": 1994,
					"offsetEnd": 2003,
					"columnNum": 355
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
					"offsetStart": 2004,
					"offsetEnd": 2007,
					"columnNum": 356
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
					"offsetStart": 2008,
					"offsetEnd": 2009,
					"columnNum": 357
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
					"offsetStart": 2010,
					"offsetEnd": 2012,
					"columnNum": 358
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
					"offsetStart": 2013,
					"offsetEnd": 2015,
					"columnNum": 359
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2016,
					"offsetEnd": 2016,
					"columnNum": 360
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
					"offsetStart": 2017,
					"offsetEnd": 2025,
					"columnNum": 361
				},
				"fieldLength": 9,
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
					"offsetStart": 2026,
					"offsetEnd": 2225,
					"columnNum": 362
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
					"offsetStart": 2226,
					"offsetEnd": 2325,
					"columnNum": 363
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
					"offsetStart": 2326,
					"offsetEnd": 2341,
					"columnNum": 364
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
					"offsetStart": 2342,
					"offsetEnd": 2342,
					"columnNum": 365
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
					"offsetStart": 2343,
					"offsetEnd": 2350,
					"columnNum": 366
				},
				"fieldLength": 8,
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
					"offsetStart": 2351,
					"offsetEnd": 2358,
					"columnNum": 367
				},
				"fieldLength": 8,
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
					"offsetStart": 2359,
					"offsetEnd": 2378,
					"columnNum": 368
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
					"offsetStart": 2379,
					"offsetEnd": 2393,
					"columnNum": 369
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
					"offsetStart": 2394,
					"offsetEnd": 2394,
					"columnNum": 370
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
					"offsetStart": 2395,
					"offsetEnd": 2397,
					"columnNum": 371
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
					"offsetStart": 2398,
					"offsetEnd": 2417,
					"columnNum": 372
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
					"offsetStart": 2418,
					"offsetEnd": 2437,
					"columnNum": 373
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
					"offsetStart": 2438,
					"offsetEnd": 2438,
					"columnNum": 374
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
					"offsetStart": 2439,
					"offsetEnd": 2444,
					"columnNum": 375
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
					"offsetStart": 2445,
					"offsetEnd": 2474,
					"columnNum": 376
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
					"offsetStart": 2475,
					"offsetEnd": 2494,
					"columnNum": 377
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
					"offsetStart": 2495,
					"offsetEnd": 2500,
					"columnNum": 378
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
					"offsetStart": 2501,
					"offsetEnd": 2501,
					"columnNum": 379
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
					"offsetStart": 2502,
					"offsetEnd": 2516,
					"columnNum": 380
				},
				"fieldLength": 15,
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
					"offsetStart": 2517,
					"offsetEnd": 2517,
					"columnNum": 381
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
					"offsetStart": 2518,
					"offsetEnd": 2518,
					"columnNum": 382
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
					"offsetStart": 2519,
					"offsetEnd": 2519,
					"columnNum": 383
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
					"offsetStart": 2520,
					"offsetEnd": 2524,
					"columnNum": 384
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
					"offsetStart": 2525,
					"offsetEnd": 2525,
					"columnNum": 385
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
					"offsetStart": 2526,
					"offsetEnd": 2526,
					"columnNum": 386
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2527,
					"offsetEnd": 2527,
					"columnNum": 387
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
					"offsetStart": 2528,
					"offsetEnd": 2528,
					"columnNum": 388
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
					"offsetStart": 2529,
					"offsetEnd": 2529,
					"columnNum": 389
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
					"offsetStart": 2530,
					"offsetEnd": 2530,
					"columnNum": 390
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
					"offsetStart": 2531,
					"offsetEnd": 2531,
					"columnNum": 391
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
					"offsetStart": 2532,
					"offsetEnd": 2532,
					"columnNum": 392
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
					"offsetStart": 2533,
					"offsetEnd": 2533,
					"columnNum": 393
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
					"offsetStart": 2534,
					"offsetEnd": 2534,
					"columnNum": 394
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
					"offsetStart": 2535,
					"offsetEnd": 2535,
					"columnNum": 395
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
					"offsetStart": 2536,
					"offsetEnd": 2536,
					"columnNum": 396
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
					"offsetStart": 2537,
					"offsetEnd": 2537,
					"columnNum": 397
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
					"offsetStart": 2538,
					"offsetEnd": 2538,
					"columnNum": 398
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
					"offsetStart": 2539,
					"offsetEnd": 2539,
					"columnNum": 399
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2540,
					"offsetEnd": 2540,
					"columnNum": 400
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
					"offsetStart": 2541,
					"offsetEnd": 2541,
					"columnNum": 401
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
					"offsetStart": 2542,
					"offsetEnd": 2542,
					"columnNum": 402
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
					"offsetStart": 2543,
					"offsetEnd": 2543,
					"columnNum": 403
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
					"offsetStart": 2544,
					"offsetEnd": 2544,
					"columnNum": 404
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
					"offsetStart": 2545,
					"offsetEnd": 2545,
					"columnNum": 405
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
					"offsetStart": 2546,
					"offsetEnd": 2546,
					"columnNum": 406
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
					"offsetStart": 2547,
					"offsetEnd": 2547,
					"columnNum": 407
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
					"offsetStart": 2548,
					"offsetEnd": 2548,
					"columnNum": 408
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
					"offsetStart": 2549,
					"offsetEnd": 2549,
					"columnNum": 409
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2550,
					"offsetEnd": 2550,
					"columnNum": 410
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
					"offsetStart": 2551,
					"offsetEnd": 2551,
					"columnNum": 411
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
					"offsetStart": 2552,
					"offsetEnd": 2552,
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
					"offsetStart": 2553,
					"offsetEnd": 2572,
					"columnNum": 413
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score BIO",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2573,
					"offsetEnd": 2575,
					"columnNum": 414
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score BIO",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2576,
					"offsetEnd": 2578,
					"columnNum": 415
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score BIO",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2579,
					"offsetEnd": 2581,
					"columnNum": 416
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct BIO",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2582,
					"offsetEnd": 2584,
					"columnNum": 417
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score BIO",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2585,
					"offsetEnd": 2587,
					"columnNum": 418
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level BIO",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2588,
					"offsetEnd": 2589,
					"columnNum": 419
				},
				"fieldLength": 2,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level BIO",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2590,
					"offsetEnd": 2592,
					"columnNum": 420
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
					"offsetStart": 2593,
					"offsetEnd": 2607,
					"columnNum": 421
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High BIO",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2608,
					"offsetEnd": 2610,
					"columnNum": 422
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low BIO",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2611,
					"offsetEnd": 2613,
					"columnNum": 423
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science as Inquiry Raw Score BIO",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_AS_INQUIRY_RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2614,
					"offsetEnd": 2615,
					"columnNum": 424
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science as Inquiry Percent Correct BIO",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_AS_INQUIRY_PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2616,
					"offsetEnd": 2618,
					"columnNum": 425
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Life Science Raw Score BIO",
				"otherPossibleNames": [],
				"logicalName": "LIFE_SCIENCE_RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2619,
					"offsetEnd": 2620,
					"columnNum": 426
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Life Science Percent Correct BIO",
				"otherPossibleNames": [],
				"logicalName": "LIFE_SCIENCE_PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2621,
					"offsetEnd": 2623,
					"columnNum": 427
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Earth and Space Science Raw Score BIO",
				"otherPossibleNames": [],
				"logicalName": "EARTH_AND_SPACE_SCIENCE_RAW_SCORE_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2624,
					"offsetEnd": 2625,
					"columnNum": 428
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Earth and Space Science Percent Correct BIO",
				"otherPossibleNames": [],
				"logicalName": "EARTH_AND_SPACE_SCIENCE_PERCENT_CORRECT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2626,
					"offsetEnd": 2628,
					"columnNum": 429
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
					"offsetStart": 2629,
					"offsetEnd": 2648,
					"columnNum": 430
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
					"offsetStart": 2649,
					"offsetEnd": 2650,
					"columnNum": 431
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
					"offsetStart": 2651,
					"offsetEnd": 2651,
					"columnNum": 432
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt Biology",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2652,
					"offsetEnd": 2652,
					"columnNum": 433
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
					"offsetStart": 2653,
					"offsetEnd": 2653,
					"columnNum": 434
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag Biology",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2654,
					"offsetEnd": 2654,
					"columnNum": 435
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
					"offsetStart": 2655,
					"offsetEnd": 2655,
					"columnNum": 436
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
					"offsetStart": 2656,
					"offsetEnd": 2656,
					"columnNum": 437
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
					"offsetStart": 2657,
					"offsetEnd": 2657,
					"columnNum": 438
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
					"offsetStart": 2658,
					"offsetEnd": 2667,
					"columnNum": 439
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
					"offsetStart": 2668,
					"offsetEnd": 2668,
					"columnNum": 440
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
					"offsetStart": 2669,
					"offsetEnd": 2669,
					"columnNum": 441
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
					"offsetStart": 2670,
					"offsetEnd": 2670,
					"columnNum": 442
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
					"offsetStart": 2671,
					"offsetEnd": 2680,
					"columnNum": 443
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
					"offsetStart": 2681,
					"offsetEnd": 2684,
					"columnNum": 444
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
					"offsetStart": 2685,
					"offsetEnd": 2686,
					"columnNum": 445
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
					"offsetStart": 2687,
					"offsetEnd": 2689,
					"columnNum": 446
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
					"offsetStart": 2690,
					"offsetEnd": 2692,
					"columnNum": 447
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2693,
					"offsetEnd": 2693,
					"columnNum": 448
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
					"offsetStart": 2694,
					"offsetEnd": 2702,
					"columnNum": 449
				},
				"fieldLength": 9,
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
					"offsetStart": 2703,
					"offsetEnd": 2902,
					"columnNum": 450
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
					"offsetStart": 2903,
					"offsetEnd": 3002,
					"columnNum": 451
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
					"offsetStart": 3003,
					"offsetEnd": 3018,
					"columnNum": 452
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
					"offsetStart": 3019,
					"offsetEnd": 3019,
					"columnNum": 453
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
					"offsetStart": 3020,
					"offsetEnd": 3027,
					"columnNum": 454
				},
				"fieldLength": 8,
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
					"offsetStart": 3028,
					"offsetEnd": 3035,
					"columnNum": 455
				},
				"fieldLength": 8,
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
					"offsetStart": 3036,
					"offsetEnd": 3055,
					"columnNum": 456
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
					"offsetStart": 3056,
					"offsetEnd": 3070,
					"columnNum": 457
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
					"offsetStart": 3071,
					"offsetEnd": 3071,
					"columnNum": 458
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
					"offsetStart": 3072,
					"offsetEnd": 3074,
					"columnNum": 459
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
					"offsetStart": 3075,
					"offsetEnd": 3094,
					"columnNum": 460
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
					"offsetStart": 3095,
					"offsetEnd": 3114,
					"columnNum": 461
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
					"offsetStart": 3115,
					"offsetEnd": 3115,
					"columnNum": 462
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
					"offsetStart": 3116,
					"offsetEnd": 3121,
					"columnNum": 463
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
					"offsetStart": 3122,
					"offsetEnd": 3151,
					"columnNum": 464
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
					"offsetStart": 3152,
					"offsetEnd": 3171,
					"columnNum": 465
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
					"offsetStart": 3172,
					"offsetEnd": 3177,
					"columnNum": 466
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
					"offsetStart": 3178,
					"offsetEnd": 3178,
					"columnNum": 467
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
					"offsetStart": 3179,
					"offsetEnd": 3198,
					"columnNum": 468
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
					"offsetStart": 3199,
					"offsetEnd": 3199,
					"columnNum": 469
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
					"offsetStart": 3200,
					"offsetEnd": 3200,
					"columnNum": 470
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
					"offsetStart": 3201,
					"offsetEnd": 3201,
					"columnNum": 471
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
					"offsetStart": 3202,
					"offsetEnd": 3202,
					"columnNum": 472
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
					"offsetStart": 3203,
					"offsetEnd": 3203,
					"columnNum": 473
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3204,
					"offsetEnd": 3204,
					"columnNum": 474
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
					"offsetStart": 3205,
					"offsetEnd": 3205,
					"columnNum": 475
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
					"offsetStart": 3206,
					"offsetEnd": 3206,
					"columnNum": 476
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
					"offsetStart": 3207,
					"offsetEnd": 3207,
					"columnNum": 477
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
					"offsetStart": 3208,
					"offsetEnd": 3208,
					"columnNum": 478
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
					"offsetStart": 3209,
					"offsetEnd": 3209,
					"columnNum": 479
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
					"offsetStart": 3210,
					"offsetEnd": 3210,
					"columnNum": 480
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
					"offsetStart": 3211,
					"offsetEnd": 3211,
					"columnNum": 481
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
					"offsetStart": 3212,
					"offsetEnd": 3212,
					"columnNum": 482
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
					"offsetStart": 3213,
					"offsetEnd": 3213,
					"columnNum": 483
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
					"offsetStart": 3214,
					"offsetEnd": 3214,
					"columnNum": 484
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
					"offsetStart": 3215,
					"offsetEnd": 3215,
					"columnNum": 485
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
					"offsetStart": 3216,
					"offsetEnd": 3216,
					"columnNum": 486
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3217,
					"offsetEnd": 3217,
					"columnNum": 487
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
					"offsetStart": 3218,
					"offsetEnd": 3218,
					"columnNum": 488
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
					"offsetStart": 3219,
					"offsetEnd": 3219,
					"columnNum": 489
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
					"offsetStart": 3220,
					"offsetEnd": 3220,
					"columnNum": 490
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
					"offsetStart": 3221,
					"offsetEnd": 3221,
					"columnNum": 491
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
					"offsetStart": 3222,
					"offsetEnd": 3222,
					"columnNum": 492
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
					"offsetStart": 3223,
					"offsetEnd": 3223,
					"columnNum": 493
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
					"offsetStart": 3224,
					"offsetEnd": 3224,
					"columnNum": 494
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
					"offsetStart": 3225,
					"offsetEnd": 3225,
					"columnNum": 495
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
					"offsetStart": 3226,
					"offsetEnd": 3226,
					"columnNum": 496
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3227,
					"offsetEnd": 3227,
					"columnNum": 497
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
					"offsetStart": 3228,
					"offsetEnd": 3228,
					"columnNum": 498
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
					"offsetStart": 3229,
					"offsetEnd": 3229,
					"columnNum": 499
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
					"offsetStart": 3230,
					"offsetEnd": 3249,
					"columnNum": 500
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
					"offsetStart": 3250,
					"offsetEnd": 3252,
					"columnNum": 501
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
					"offsetStart": 3253,
					"offsetEnd": 3255,
					"columnNum": 502
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
					"offsetStart": 3256,
					"offsetEnd": 3258,
					"columnNum": 503
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
					"offsetStart": 3259,
					"offsetEnd": 3261,
					"columnNum": 504
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
					"offsetStart": 3262,
					"offsetEnd": 3264,
					"columnNum": 505
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
					"offsetStart": 3265,
					"offsetEnd": 3266,
					"columnNum": 506
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
					"offsetStart": 3267,
					"offsetEnd": 3269,
					"columnNum": 507
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
					"offsetStart": 3270,
					"offsetEnd": 3284,
					"columnNum": 508
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
					"offsetStart": 3285,
					"offsetEnd": 3287,
					"columnNum": 509
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
					"offsetStart": 3288,
					"offsetEnd": 3290,
					"columnNum": 510
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
					"offsetStart": 3291,
					"offsetEnd": 3292,
					"columnNum": 511
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
					"offsetStart": 3293,
					"offsetEnd": 3295,
					"columnNum": 512
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
					"offsetStart": 3296,
					"offsetEnd": 3297,
					"columnNum": 513
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
					"offsetStart": 3298,
					"offsetEnd": 3300,
					"columnNum": 514
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
					"offsetStart": 3301,
					"offsetEnd": 3302,
					"columnNum": 515
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
					"offsetStart": 3303,
					"offsetEnd": 3305,
					"columnNum": 516
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
					"offsetStart": 3306,
					"offsetEnd": 3325,
					"columnNum": 517
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
					"offsetStart": 3326,
					"offsetEnd": 3327,
					"columnNum": 518
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
					"offsetStart": 3328,
					"offsetEnd": 3328,
					"columnNum": 519
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
					"offsetStart": 3329,
					"offsetEnd": 3329,
					"columnNum": 520
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
					"offsetStart": 3330,
					"offsetEnd": 3330,
					"columnNum": 521
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
					"offsetStart": 3331,
					"offsetEnd": 3331,
					"columnNum": 522
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
					"offsetStart": 3332,
					"offsetEnd": 3332,
					"columnNum": 523
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
					"offsetStart": 3333,
					"offsetEnd": 3333,
					"columnNum": 524
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
					"offsetStart": 3334,
					"offsetEnd": 3334,
					"columnNum": 525
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
					"offsetStart": 3335,
					"offsetEnd": 3344,
					"columnNum": 526
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
					"offsetStart": 3345,
					"offsetEnd": 3345,
					"columnNum": 527
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
					"offsetStart": 3346,
					"offsetEnd": 3346,
					"columnNum": 528
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
					"offsetStart": 3347,
					"offsetEnd": 3347,
					"columnNum": 529
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
					"offsetStart": 3348,
					"offsetEnd": 3357,
					"columnNum": 530
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
					"offsetStart": 3358,
					"offsetEnd": 3361,
					"columnNum": 531
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
					"offsetStart": 3362,
					"offsetEnd": 3363,
					"columnNum": 532
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
					"offsetStart": 3364,
					"offsetEnd": 3366,
					"columnNum": 533
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
					"offsetStart": 3367,
					"offsetEnd": 3369,
					"columnNum": 534
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3370,
					"offsetEnd": 3370,
					"columnNum": 535
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
					"offsetStart": 3371,
					"offsetEnd": 3379,
					"columnNum": 536
				},
				"fieldLength": 9,
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
					"offsetStart": 3380,
					"offsetEnd": 3579,
					"columnNum": 537
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
					"offsetStart": 3580,
					"offsetEnd": 3679,
					"columnNum": 538
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
					"offsetStart": 3680,
					"offsetEnd": 3695,
					"columnNum": 539
				},
				"fieldLength": 16,
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
					"offsetStart": 3696,
					"offsetEnd": 4376,
					"columnNum": 540
				},
				"fieldLength": 681,
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
					"offsetStart": 4377,
					"offsetEnd": 4377,
					"columnNum": 541
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content USHIST 2025",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4378,
					"offsetEnd": 4385,
					"columnNum": 542
				},
				"fieldLength": 8,
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
					"offsetStart": 4386,
					"offsetEnd": 4393,
					"columnNum": 543
				},
				"fieldLength": 8,
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
					"offsetStart": 4394,
					"offsetEnd": 4413,
					"columnNum": 544
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
					"offsetStart": 4414,
					"offsetEnd": 4428,
					"columnNum": 545
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
					"offsetStart": 4429,
					"offsetEnd": 4429,
					"columnNum": 546
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
					"offsetStart": 4430,
					"offsetEnd": 4432,
					"columnNum": 547
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
					"offsetStart": 4433,
					"offsetEnd": 4452,
					"columnNum": 548
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
					"offsetStart": 4453,
					"offsetEnd": 4472,
					"columnNum": 549
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
					"offsetStart": 4473,
					"offsetEnd": 4473,
					"columnNum": 550
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
					"offsetStart": 4474,
					"offsetEnd": 4479,
					"columnNum": 551
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
					"offsetStart": 4480,
					"offsetEnd": 4509,
					"columnNum": 552
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
					"offsetStart": 4510,
					"offsetEnd": 4529,
					"columnNum": 553
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
					"offsetStart": 4530,
					"offsetEnd": 4535,
					"columnNum": 554
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
					"offsetStart": 4536,
					"offsetEnd": 4536,
					"columnNum": 555
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
					"offsetStart": 4537,
					"offsetEnd": 4555,
					"columnNum": 556
				},
				"fieldLength": 19,
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
					"offsetStart": 4556,
					"offsetEnd": 4556,
					"columnNum": 557
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
					"offsetStart": 4557,
					"offsetEnd": 4557,
					"columnNum": 558
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3/3A Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4558,
					"offsetEnd": 4558,
					"columnNum": 559
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Session 3B Completed",
				"otherPossibleNames": [],
				"logicalName": "SESSION_3B_COMPLETED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4559,
					"offsetEnd": 4559,
					"columnNum": 560
				},
				"fieldLength": 1,
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
					"offsetStart": 4560,
					"offsetEnd": 4560,
					"columnNum": 561
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
					"offsetStart": 4561,
					"offsetEnd": 4561,
					"columnNum": 562
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4562,
					"offsetEnd": 4562,
					"columnNum": 563
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
					"offsetStart": 4563,
					"offsetEnd": 4563,
					"columnNum": 564
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
					"offsetStart": 4564,
					"offsetEnd": 4564,
					"columnNum": 565
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
					"offsetStart": 4565,
					"offsetEnd": 4565,
					"columnNum": 566
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
					"offsetStart": 4566,
					"offsetEnd": 4566,
					"columnNum": 567
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
					"offsetStart": 4567,
					"offsetEnd": 4567,
					"columnNum": 568
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
					"offsetStart": 4568,
					"offsetEnd": 4568,
					"columnNum": 569
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
					"offsetStart": 4569,
					"offsetEnd": 4569,
					"columnNum": 570
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
					"offsetStart": 4570,
					"offsetEnd": 4570,
					"columnNum": 571
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
					"offsetStart": 4571,
					"offsetEnd": 4571,
					"columnNum": 572
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
					"offsetStart": 4572,
					"offsetEnd": 4572,
					"columnNum": 573
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
					"offsetStart": 4573,
					"offsetEnd": 4573,
					"columnNum": 574
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
					"offsetStart": 4574,
					"offsetEnd": 4574,
					"columnNum": 575
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4575,
					"offsetEnd": 4575,
					"columnNum": 576
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
					"offsetStart": 4576,
					"offsetEnd": 4576,
					"columnNum": 577
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
					"offsetStart": 4577,
					"offsetEnd": 4577,
					"columnNum": 578
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
					"offsetStart": 4578,
					"offsetEnd": 4578,
					"columnNum": 579
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
					"offsetStart": 4579,
					"offsetEnd": 4579,
					"columnNum": 580
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
					"offsetStart": 4580,
					"offsetEnd": 4580,
					"columnNum": 581
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
					"offsetStart": 4581,
					"offsetEnd": 4581,
					"columnNum": 582
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
					"offsetStart": 4582,
					"offsetEnd": 4582,
					"columnNum": 583
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
					"offsetStart": 4583,
					"offsetEnd": 4583,
					"columnNum": 584
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
					"offsetStart": 4584,
					"offsetEnd": 4584,
					"columnNum": 585
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
					"offsetStart": 4585,
					"offsetEnd": 4585,
					"columnNum": 586
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
					"offsetStart": 4586,
					"offsetEnd": 4586,
					"columnNum": 587
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
					"offsetStart": 4587,
					"offsetEnd": 4587,
					"columnNum": 588
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
					"offsetStart": 4588,
					"offsetEnd": 4607,
					"columnNum": 589
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4608,
					"offsetEnd": 4610,
					"columnNum": 590
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4611,
					"offsetEnd": 4613,
					"columnNum": 591
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4614,
					"offsetEnd": 4616,
					"columnNum": 592
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4617,
					"offsetEnd": 4619,
					"columnNum": 593
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4620,
					"offsetEnd": 4622,
					"columnNum": 594
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4623,
					"offsetEnd": 4625,
					"columnNum": 595
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4626,
					"offsetEnd": 4628,
					"columnNum": 596
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
					"offsetStart": 4629,
					"offsetEnd": 4642,
					"columnNum": 597
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4643,
					"offsetEnd": 4645,
					"columnNum": 598
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4646,
					"offsetEnd": 4648,
					"columnNum": 599
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Western Expansion to Progressivism - Standard 2 - Raw Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RAW_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4649,
					"offsetEnd": 4650,
					"columnNum": 600
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Western Expansion to Progressivism - Standard 2 - Percent Correct USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_PERCENT_CORRECT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4651,
					"offsetEnd": 4653,
					"columnNum": 601
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Western Expansion to Progressivism - Standard 2 - Rating USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RATING_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4654,
					"offsetEnd": 4654,
					"columnNum": 602
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Isolationism through the Great War - Standard 3 - Raw Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RAW_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4655,
					"offsetEnd": 4656,
					"columnNum": 603
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Isolationism through the Great War - Standard 3 - Percent Correct USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_PERCENT_CORRECT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4657,
					"offsetEnd": 4659,
					"columnNum": 604
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Isolationism through the Great War - Standard 3 - Rating USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RATING_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4660,
					"offsetEnd": 4660,
					"columnNum": 605
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Becoming a World Power through World War II - Standard 4 - Raw Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RAW_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4661,
					"offsetEnd": 4662,
					"columnNum": 606
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Becoming a World Power through World War II - Standard 4 - Percent Correct USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_PERCENT_CORRECT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4663,
					"offsetEnd": 4665,
					"columnNum": 607
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Becoming a World Power through World War II - Standard 4 - Rating USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RATING_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4666,
					"offsetEnd": 4666,
					"columnNum": 608
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Cold War Era and The Modern Age - Standard 5 and 6 - Raw Score USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "COLD_WAR_ERA_AND_THE_MODERN_AGE_-_STANDARD_5_AND_6_-_RAW_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4667,
					"offsetEnd": 4668,
					"columnNum": 609
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Cold War Era and The Modern Age - Standard 5 and 6 - Percent Correct USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "COLD_WAR_ERA_AND_THE_MODERN_AGE_-_STANDARD_5_AND_6_-_PERCENT_CORRECT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4669,
					"offsetEnd": 4671,
					"columnNum": 610
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Cold War Era and The Modern Age - Standard 5 and 6 - Rating USHist 2025",
				"otherPossibleNames": [],
				"logicalName": "COLD_WAR_ERA_AND_THE_MODERN_AGE_-_STANDARD_5_AND_6_-_RATING_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4672,
					"offsetEnd": 4672,
					"columnNum": 611
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
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
					"offsetStart": 4673,
					"offsetEnd": 4683,
					"columnNum": 612
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - U.S. History",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4684,
					"offsetEnd": 4685,
					"columnNum": 613
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
					"offsetStart": 4686,
					"offsetEnd": 4686,
					"columnNum": 614
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt USHIST 2025",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4687,
					"offsetEnd": 4687,
					"columnNum": 615
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
					"offsetStart": 4688,
					"offsetEnd": 4688,
					"columnNum": 616
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag USHIST 2025",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4689,
					"offsetEnd": 4689,
					"columnNum": 617
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
					"offsetStart": 4690,
					"offsetEnd": 4690,
					"columnNum": 618
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
					"offsetStart": 4691,
					"offsetEnd": 4691,
					"columnNum": 619
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
					"offsetStart": 4692,
					"offsetEnd": 4692,
					"columnNum": 620
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
					"offsetStart": 4693,
					"offsetEnd": 4702,
					"columnNum": 621
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
					"offsetStart": 4703,
					"offsetEnd": 4703,
					"columnNum": 622
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
					"offsetStart": 4704,
					"offsetEnd": 4704,
					"columnNum": 623
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
					"offsetStart": 4705,
					"offsetEnd": 4705,
					"columnNum": 624
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
					"offsetStart": 4706,
					"offsetEnd": 4715,
					"columnNum": 625
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
					"offsetStart": 4716,
					"offsetEnd": 4719,
					"columnNum": 626
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
					"offsetStart": 4720,
					"offsetEnd": 4721,
					"columnNum": 627
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
					"offsetStart": 4722,
					"offsetEnd": 4724,
					"columnNum": 628
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
					"offsetStart": 4725,
					"offsetEnd": 4727,
					"columnNum": 629
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4728,
					"offsetEnd": 4728,
					"columnNum": 630
				},
				"fieldLength": 1,
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
					"offsetStart": 4729,
					"offsetEnd": 4948,
					"columnNum": 631
				},
				"fieldLength": 220,
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
					"offsetStart": 4949,
					"offsetEnd": 5048,
					"columnNum": 632
				},
				"fieldLength": 100,
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
					"offsetStart": 5049,
					"offsetEnd": 5049,
					"columnNum": 633
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content ENGI",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5050,
					"offsetEnd": 5057,
					"columnNum": 634
				},
				"fieldLength": 8,
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
					"offsetStart": 5058,
					"offsetEnd": 5065,
					"columnNum": 635
				},
				"fieldLength": 8,
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
					"offsetStart": 5066,
					"offsetEnd": 5085,
					"columnNum": 636
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
					"offsetStart": 5086,
					"offsetEnd": 5100,
					"columnNum": 637
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
					"offsetStart": 5101,
					"offsetEnd": 5101,
					"columnNum": 638
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
					"offsetStart": 5102,
					"offsetEnd": 5104,
					"columnNum": 639
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
					"offsetStart": 5105,
					"offsetEnd": 5124,
					"columnNum": 640
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
					"offsetStart": 5125,
					"offsetEnd": 5144,
					"columnNum": 641
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
					"offsetStart": 5145,
					"offsetEnd": 5145,
					"columnNum": 642
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
					"offsetStart": 5146,
					"offsetEnd": 5151,
					"columnNum": 643
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
					"offsetStart": 5152,
					"offsetEnd": 5181,
					"columnNum": 644
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
					"offsetStart": 5182,
					"offsetEnd": 5201,
					"columnNum": 645
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
					"offsetStart": 5202,
					"offsetEnd": 5207,
					"columnNum": 646
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English I Enroll Flag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_ENROLL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5208,
					"offsetEnd": 5208,
					"columnNum": 647
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English I CohortFlag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_COHORT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5209,
					"offsetEnd": 5209,
					"columnNum": 648
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
					"offsetStart": 5010,
					"offsetEnd": 5222,
					"columnNum": 649
				},
				"fieldLength": 213,
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
					"offsetStart": 5223,
					"offsetEnd": 5223,
					"columnNum": 650
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
					"offsetStart": 5224,
					"offsetEnd": 5224,
					"columnNum": 651
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
					"offsetStart": 5225,
					"offsetEnd": 5225,
					"columnNum": 652
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
					"offsetStart": 5226,
					"offsetEnd": 5230,
					"columnNum": 653
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
					"offsetStart": 5231,
					"offsetEnd": 5231,
					"columnNum": 654
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
					"offsetStart": 5232,
					"offsetEnd": 5232,
					"columnNum": 655
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5233,
					"offsetEnd": 5233,
					"columnNum": 656
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
					"offsetStart": 5234,
					"offsetEnd": 5234,
					"columnNum": 657
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
					"offsetStart": 5235,
					"offsetEnd": 5235,
					"columnNum": 658
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
					"offsetStart": 5236,
					"offsetEnd": 5236,
					"columnNum": 659
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
					"offsetStart": 5237,
					"offsetEnd": 5237,
					"columnNum": 660
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
					"offsetStart": 5238,
					"offsetEnd": 5238,
					"columnNum": 661
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
					"offsetStart": 5239,
					"offsetEnd": 5239,
					"columnNum": 662
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
					"offsetStart": 5240,
					"offsetEnd": 5240,
					"columnNum": 663
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
					"offsetStart": 5241,
					"offsetEnd": 5241,
					"columnNum": 664
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
					"offsetStart": 5242,
					"offsetEnd": 5242,
					"columnNum": 665
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
					"offsetStart": 5243,
					"offsetEnd": 5243,
					"columnNum": 666
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
					"offsetStart": 5244,
					"offsetEnd": 5244,
					"columnNum": 667
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
					"offsetStart": 5245,
					"offsetEnd": 5245,
					"columnNum": 668
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5246,
					"offsetEnd": 5246,
					"columnNum": 669
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
					"offsetStart": 5247,
					"offsetEnd": 5247,
					"columnNum": 670
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
					"offsetStart": 5248,
					"offsetEnd": 5248,
					"columnNum": 671
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
					"offsetStart": 5249,
					"offsetEnd": 5249,
					"columnNum": 672
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
					"offsetStart": 5250,
					"offsetEnd": 5250,
					"columnNum": 673
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
					"offsetStart": 5251,
					"offsetEnd": 5251,
					"columnNum": 674
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
					"offsetStart": 5252,
					"offsetEnd": 5252,
					"columnNum": 675
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
					"offsetStart": 5253,
					"offsetEnd": 5253,
					"columnNum": 676
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
					"offsetStart": 5254,
					"offsetEnd": 5254,
					"columnNum": 677
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
					"offsetStart": 5255,
					"offsetEnd": 5255,
					"columnNum": 678
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5256,
					"offsetEnd": 5256,
					"columnNum": 679
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
					"offsetStart": 5257,
					"offsetEnd": 5257,
					"columnNum": 680
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
					"offsetStart": 5258,
					"offsetEnd": 5258,
					"columnNum": 681
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
					"offsetStart": 5259,
					"offsetEnd": 5278,
					"columnNum": 682
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score EngI",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5279,
					"offsetEnd": 5281,
					"columnNum": 683
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score EngI",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5282,
					"offsetEnd": 5284,
					"columnNum": 684
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5285,
					"offsetEnd": 5287,
					"columnNum": 685
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct EngI",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5288,
					"offsetEnd": 5290,
					"columnNum": 686
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score EngI",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5291,
					"offsetEnd": 5293,
					"columnNum": 687
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level EngI",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5294,
					"offsetEnd": 5296,
					"columnNum": 688
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level EngI",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5297,
					"offsetEnd": 5299,
					"columnNum": 689
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
					"offsetStart": 5300,
					"offsetEnd": 5313,
					"columnNum": 690
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High EngI",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5314,
					"offsetEnd": 5316,
					"columnNum": 691
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low EngI",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5317,
					"offsetEnd": 5319,
					"columnNum": 692
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5320,
					"offsetEnd": 5323,
					"columnNum": 693
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5324,
					"offsetEnd": 5324,
					"columnNum": 694
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5325,
					"offsetEnd": 5327,
					"columnNum": 695
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5328,
					"offsetEnd": 5331,
					"columnNum": 696
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5332,
					"offsetEnd": 5332,
					"columnNum": 697
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5333,
					"offsetEnd": 5335,
					"columnNum": 698
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5336,
					"offsetEnd": 5339,
					"columnNum": 699
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5340,
					"offsetEnd": 5340,
					"columnNum": 700
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5341,
					"offsetEnd": 5343,
					"columnNum": 701
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Written Expression Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5344,
					"offsetEnd": 5347,
					"columnNum": 702
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Expression Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5348,
					"offsetEnd": 5348,
					"columnNum": 703
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Expression Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5349,
					"offsetEnd": 5351,
					"columnNum": 704
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5352,
					"offsetEnd": 5355,
					"columnNum": 705
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5356,
					"offsetEnd": 5356,
					"columnNum": 706
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5357,
					"offsetEnd": 5359,
					"columnNum": 707
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
					"offsetStart": 5360,
					"offsetEnd": 5379,
					"columnNum": 708
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5380,
					"offsetEnd": 5383,
					"columnNum": 709
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5384,
					"offsetEnd": 5384,
					"columnNum": 710
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "READING_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5385,
					"offsetEnd": 5387,
					"columnNum": 711
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing Raw Score EngI",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5388,
					"offsetEnd": 5391,
					"columnNum": 712
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing Rating EngI",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RATING_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5392,
					"offsetEnd": 5392,
					"columnNum": 713
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing Percent Correct EngI",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERCENT_CORRECT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5393,
					"offsetEnd": 5395,
					"columnNum": 714
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
					"offsetStart": 5396,
					"offsetEnd": 5415,
					"columnNum": 715
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - English I",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5416,
					"offsetEnd": 5417,
					"columnNum": 716
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
					"offsetStart": 5418,
					"offsetEnd": 5418,
					"columnNum": 717
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt ENGI",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5419,
					"offsetEnd": 5419,
					"columnNum": 718
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
					"offsetStart": 5420,
					"offsetEnd": 5420,
					"columnNum": 719
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag ENGI",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ENGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5421,
					"offsetEnd": 5421,
					"columnNum": 720
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
					"offsetStart": 5422,
					"offsetEnd": 5422,
					"columnNum": 721
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
					"offsetStart": 5423,
					"offsetEnd": 5423,
					"columnNum": 722
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
					"offsetStart": 5424,
					"offsetEnd": 5424,
					"columnNum": 723
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
					"offsetStart": 5425,
					"offsetEnd": 5434,
					"columnNum": 724
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
					"offsetStart": 5435,
					"offsetEnd": 5435,
					"columnNum": 725
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
					"offsetStart": 5436,
					"offsetEnd": 5436,
					"columnNum": 726
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
					"offsetStart": 5437,
					"offsetEnd": 5437,
					"columnNum": 727
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
					"offsetStart": 5438,
					"offsetEnd": 5447,
					"columnNum": 728
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
					"offsetStart": 5448,
					"offsetEnd": 5451,
					"columnNum": 729
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
					"offsetStart": 5452,
					"offsetEnd": 5453,
					"columnNum": 730
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
					"offsetStart": 5454,
					"offsetEnd": 5456,
					"columnNum": 731
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
					"offsetStart": 5457,
					"offsetEnd": 5459,
					"columnNum": 732
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5460,
					"offsetEnd": 5460,
					"columnNum": 733
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
					"offsetStart": 5460,
					"offsetEnd": 5469,
					"columnNum": 734
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
					"offsetStart": 5470,
					"offsetEnd": 5669,
					"columnNum": 735
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
					"offsetStart": 5670,
					"offsetEnd": 5769,
					"columnNum": 736
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
					"offsetStart": 5770,
					"offsetEnd": 5785,
					"columnNum": 737
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
					"offsetStart": 5786,
					"offsetEnd": 5786,
					"columnNum": 738
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content BIO 2025",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5787,
					"offsetEnd": 5794,
					"columnNum": 739
				},
				"fieldLength": 8,
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
					"offsetStart": 5795,
					"offsetEnd": 5802,
					"columnNum": 740
				},
				"fieldLength": 8,
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
					"offsetStart": 5803,
					"offsetEnd": 5822,
					"columnNum": 741
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
					"offsetStart": 5823,
					"offsetEnd": 5837,
					"columnNum": 742
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
					"offsetStart": 5838,
					"offsetEnd": 5838,
					"columnNum": 743
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
					"offsetStart": 5839,
					"offsetEnd": 5841,
					"columnNum": 744
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
					"offsetStart": 5842,
					"offsetEnd": 5861,
					"columnNum": 745
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
					"offsetStart": 5862,
					"offsetEnd": 5881,
					"columnNum": 746
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
					"offsetStart": 5882,
					"offsetEnd": 5882,
					"columnNum": 747
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
					"offsetStart": 5883,
					"offsetEnd": 5888,
					"columnNum": 748
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
					"offsetStart": 5889,
					"offsetEnd": 5918,
					"columnNum": 749
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
					"offsetStart": 5919,
					"offsetEnd": 5938,
					"columnNum": 750
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
					"offsetStart": 5939,
					"offsetEnd": 5944,
					"columnNum": 751
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
					"offsetStart": 5945,
					"offsetEnd": 5945,
					"columnNum": 752
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
					"offsetStart": 5946,
					"offsetEnd": 5960,
					"columnNum": 753
				},
				"fieldLength": 15,
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
					"offsetStart": 5961,
					"offsetEnd": 5961,
					"columnNum": 754
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
					"offsetStart": 5962,
					"offsetEnd": 5962,
					"columnNum": 755
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
					"offsetStart": 5963,
					"offsetEnd": 5963,
					"columnNum": 756
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
					"offsetStart": 5964,
					"offsetEnd": 5968,
					"columnNum": 757
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
					"offsetStart": 5969,
					"offsetEnd": 5969,
					"columnNum": 758
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
					"offsetStart": 5970,
					"offsetEnd": 5970,
					"columnNum": 759
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spanish Text to Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5971,
					"offsetEnd": 5971,
					"columnNum": 760
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
					"offsetStart": 5972,
					"offsetEnd": 5972,
					"columnNum": 761
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
					"offsetStart": 5973,
					"offsetEnd": 5973,
					"columnNum": 762
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
					"offsetStart": 5974,
					"offsetEnd": 5974,
					"columnNum": 763
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
					"offsetStart": 5975,
					"offsetEnd": 5975,
					"columnNum": 764
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
					"offsetStart": 5976,
					"offsetEnd": 5976,
					"columnNum": 765
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
					"offsetStart": 5977,
					"offsetEnd": 5977,
					"columnNum": 766
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
					"offsetStart": 5978,
					"offsetEnd": 5978,
					"columnNum": 767
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
					"offsetStart": 5979,
					"offsetEnd": 5979,
					"columnNum": 768
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
					"offsetStart": 5980,
					"offsetEnd": 5980,
					"columnNum": 769
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
					"offsetStart": 5981,
					"offsetEnd": 5981,
					"columnNum": 770
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
					"offsetStart": 5982,
					"offsetEnd": 5982,
					"columnNum": 771
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
					"offsetStart": 5983,
					"offsetEnd": 5983,
					"columnNum": 772
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5984,
					"offsetEnd": 5984,
					"columnNum": 773
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
					"offsetStart": 5985,
					"offsetEnd": 5985,
					"columnNum": 774
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
					"offsetStart": 5986,
					"offsetEnd": 5986,
					"columnNum": 775
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
					"offsetStart": 5987,
					"offsetEnd": 5987,
					"columnNum": 776
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
					"offsetStart": 5988,
					"offsetEnd": 5988,
					"columnNum": 777
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
					"offsetStart": 5989,
					"offsetEnd": 5989,
					"columnNum": 778
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
					"offsetStart": 5990,
					"offsetEnd": 5990,
					"columnNum": 779
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
					"offsetStart": 5991,
					"offsetEnd": 5991,
					"columnNum": 780
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
					"offsetStart": 5992,
					"offsetEnd": 5992,
					"columnNum": 781
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
					"offsetStart": 5993,
					"offsetEnd": 5993,
					"columnNum": 782
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5994,
					"offsetEnd": 5994,
					"columnNum": 783
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
					"offsetStart": 5995,
					"offsetEnd": 5995,
					"columnNum": 784
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
					"offsetStart": 5996,
					"offsetEnd": 5996,
					"columnNum": 785
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
					"offsetStart": 5997,
					"offsetEnd": 6016,
					"columnNum": 786
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Total MC Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_MC_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6017,
					"offsetEnd": 6019,
					"columnNum": 787
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total CR Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_CR_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6020,
					"offsetEnd": 6022,
					"columnNum": 788
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6023,
					"offsetEnd": 6025,
					"columnNum": 789
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Total Percent correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6026,
					"offsetEnd": 6028,
					"columnNum": 790
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scale Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6029,
					"offsetEnd": 6031,
					"columnNum": 791
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6032,
					"offsetEnd": 6034,
					"columnNum": 792
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6035,
					"offsetEnd": 6037,
					"columnNum": 793
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
					"offsetStart": 6038,
					"offsetEnd": 6052,
					"columnNum": 794
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEM High Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6053,
					"offsetEnd": 6055,
					"columnNum": 795
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6056,
					"offsetEnd": 6058,
					"columnNum": 796
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Investigate - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "INVESTIGATE_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6059,
					"offsetEnd": 6060,
					"columnNum": 797
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Investigate - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "INVESTIGATE_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6061,
					"offsetEnd": 6063,
					"columnNum": 798
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Investigate - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "INVESTIGATE_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6064,
					"offsetEnd": 6064,
					"columnNum": 799
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Evaluate - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "EVALUATE_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6065,
					"offsetEnd": 6066,
					"columnNum": 800
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Evaluate - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "EVALUATE_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6067,
					"offsetEnd": 6069,
					"columnNum": 801
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Evaluate - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "EVALUATE_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6070,
					"offsetEnd": 6070,
					"columnNum": 802
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reason Scientifically - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REASON_SCIENTIFICALLY_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6071,
					"offsetEnd": 6072,
					"columnNum": 803
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reason Scientifically - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REASON_SCIENTIFICALLY_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6073,
					"offsetEnd": 6075,
					"columnNum": 804
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reason Scientifically - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REASON_SCIENTIFICALLY_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6076,
					"offsetEnd": 6076,
					"columnNum": 805
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 4 - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_4_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6077,
					"offsetEnd": 6078,
					"columnNum": 806
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 4 - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_4_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6079,
					"offsetEnd": 6081,
					"columnNum": 807
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 4 - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_4_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6082,
					"offsetEnd": 6082,
					"columnNum": 808
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 5 - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_5_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6083,
					"offsetEnd": 6084,
					"columnNum": 809
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 5 - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_5_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6085,
					"offsetEnd": 6087,
					"columnNum": 810
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 5 - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_5_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6088,
					"offsetEnd": 6088,
					"columnNum": 811
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 6 - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_6_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6089,
					"offsetEnd": 6090,
					"columnNum": 812
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 6 - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_6_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6091,
					"offsetEnd": 6093,
					"columnNum": 813
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 6 - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_6_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6094,
					"offsetEnd": 6094,
					"columnNum": 814
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 7 - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_7_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6095,
					"offsetEnd": 6096,
					"columnNum": 815
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 7 - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_7_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6097,
					"offsetEnd": 6099,
					"columnNum": 816
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 7 - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_7_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6100,
					"offsetEnd": 6100,
					"columnNum": 817
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 8 - Raw Score Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_8_RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6101,
					"offsetEnd": 6102,
					"columnNum": 818
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 8 - Percent Correct Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_8_PERCENT_CORRECT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6103,
					"offsetEnd": 6105,
					"columnNum": 819
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category 8 - Rating Bio 2025",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_8_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6106,
					"offsetEnd": 6106,
					"columnNum": 820
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
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
					"offsetStart": 6107,
					"offsetEnd": 6118,
					"columnNum": 821
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Code - Biology 2025",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_CODE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6119,
					"offsetEnd": 6120,
					"columnNum": 822
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
					"offsetStart": 6121,
					"offsetEnd": 6121,
					"columnNum": 823
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "P", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Valid Attempt BIO 2025",
				"otherPossibleNames": [],
				"logicalName": "TEST_VALID_ATTEMPT_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6122,
					"offsetEnd": 6122,
					"columnNum": 824
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
					"offsetStart": 6123,
					"offsetEnd": 6123,
					"columnNum": 825
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Void Flag BIO 2025",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6124,
					"offsetEnd": 6124,
					"columnNum": 826
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
					"offsetStart": 6125,
					"offsetEnd": 6125,
					"columnNum": 827
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
					"offsetStart": 6126,
					"offsetEnd": 6126,
					"columnNum": 828
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
					"offsetStart": 6127,
					"offsetEnd": 6127,
					"columnNum": 829
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
					"offsetStart": 6128,
					"offsetEnd": 6137,
					"columnNum": 830
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
					"offsetStart": 6138,
					"offsetEnd": 6138,
					"columnNum": 831
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
					"offsetStart": 6139,
					"offsetEnd": 6139,
					"columnNum": 832
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
					"offsetStart": 6140,
					"offsetEnd": 6140,
					"columnNum": 833
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
					"offsetStart": 6141,
					"offsetEnd": 6150,
					"columnNum": 834
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
					"offsetStart": 6151,
					"offsetEnd": 6154,
					"columnNum": 835
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
					"offsetStart": 6155,
					"offsetEnd": 6156,
					"columnNum": 836
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
					"offsetStart": 6157,
					"offsetEnd": 6159,
					"columnNum": 837
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
					"offsetStart": 6160,
					"offsetEnd": 6162,
					"columnNum": 838
				},
				"fieldLength": 3,
				"expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previously Voided",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUSLY_VOIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6163,
					"offsetEnd": 6163,
					"columnNum": 839
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
					"offsetStart": 6164,
					"offsetEnd": 6172,
					"columnNum": 840
				},
				"fieldLength": 9,
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
					"offsetStart": 6173,
					"offsetEnd": 6372,
					"columnNum": 841
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
					"offsetStart": 6373,
					"offsetEnd": 6472,
					"columnNum": 842
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
					"offsetStart": 6473,
					"offsetEnd": 6488,
					"columnNum": 843
				},
				"fieldLength": 16,
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
					"offsetStart": 6489,
					"offsetEnd": 6503,
					"columnNum": 844
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
					"offsetStart": 6504,
					"offsetEnd": 6523,
					"columnNum": 845
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date and Time Stamp",
				"otherPossibleNames": [],
				"logicalName": "DATE_AND_TIME_STAMP",
				"formatMask": "yyyy-MM-dd HH:MM:SS",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6524,
					"offsetEnd": 6542,
					"columnNum": 846
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "Algebra Psychometric Ready Flag",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_PSYCHOMETRIC_READY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6543,
					"offsetEnd": 6543,
					"columnNum": 847
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Geometry Psychometric Ready Flag",
				"otherPossibleNames": [],
				"logicalName": "GEOMETRY_PSYCHOMETRIC_READY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6544,
					"offsetEnd": 6544,
					"columnNum": 848
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English I Psychometric Ready Flag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_PSYCHOMETRIC_READY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6545,
					"offsetEnd": 6545,
					"columnNum": 849
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English II Psychometric Ready Flag",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_PSYCHOMETRIC_READY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6546,
					"offsetEnd": 6546,
					"columnNum": 850
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US History Psychometric Ready Flag",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_PSYCHOMETRIC_READY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6547,
					"offsetEnd": 6547,
					"columnNum": 851
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Biology 2025 Psychometric Ready Flag",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_PSYCHOMETRIC_READY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 6548,
					"offsetEnd": 6548,
					"columnNum": 852
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv"]
}