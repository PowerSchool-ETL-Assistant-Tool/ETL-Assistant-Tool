{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_3_8_1516_Fixed",
    "recordLength": 2912,
    "naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR", "FILE_CREATION_DATE_AND_TIME_STAMP","DRC_UNIQUE_STUDENT_ID"],
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
				"expectedValues": ["Y", "N"],
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
				"physicalName": "Barcode/Student Precode Number",
				"otherPossibleNames": [],
				"logicalName": "BARCODE/STUDENT_PRECODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 102,
					"columnNum": 8
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 103,
					"offsetEnd": 108,
					"columnNum": 9
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Tester",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_TESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 109,
					"offsetEnd": 109,
					"columnNum": 10
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 110,
					"offsetEnd": 121,
					"columnNum": 11
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
					"offsetStart": 122,
					"offsetEnd": 129,
					"columnNum": 12
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
					"offsetStart": 130,
					"offsetEnd": 130,
					"columnNum": 13
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
					"offsetStart": 131,
					"offsetEnd": 140,
					"columnNum": 14
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 141,
					"offsetEnd": 142,
					"columnNum": 15
				},
				"fieldLength": 2,
				"expectedValues": ["03", "04", "05", "06", "07", "08"],
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
					"offsetStart": 143,
					"offsetEnd": 144,
					"columnNum": 16
				},
				"fieldLength": 2,
				"expectedValues": ["03", "04", "05", "06", "07", "08"],
				"dataTypes": "INTEGER",
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
					"columnNum": 17
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
					"columnNum": 18
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
					"columnNum": 19
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
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "I"],
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
					"offsetStart": 154,
					"offsetEnd": 154,
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", ""],
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
					"offsetStart": 155,
					"offsetEnd": 155,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "I"],
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
					"offsetStart": 156,
					"offsetEnd": 156,
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 157,
					"offsetEnd": 157,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
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
					"offsetStart": 158,
					"offsetEnd": 158,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0", ""],
				"dataTypes": "INTEGER",
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
					"offsetStart": 159,
					"offsetEnd": 159,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 160,
					"offsetEnd": 160,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", ""],
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
					"offsetStart": 161,
					"offsetEnd": 162,
					"columnNum": 28
				},
				"fieldLength": 2,
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
					"offsetStart": 163,
					"offsetEnd": 163,
					"columnNum": 29
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP TDR Tester",
				"otherPossibleNames": [],
				"logicalName": "LAP_TDR_TESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 164,
					"columnNum": 30
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
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
					"offsetStart": 165,
					"offsetEnd": 165,
					"columnNum": 31
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
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
					"offsetStart": 166,
					"offsetEnd": 166,
					"columnNum": 32
				},
				"fieldLength": 1,
				"expectedValues": ["", "D", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eDIRECT Gender",
				"otherPossibleNames": [],
				"logicalName": "EDIRECT_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 167,
					"offsetEnd": 167,
					"columnNum": 33
				},
				"fieldLength": 1,
				"expectedValues": ["", "F", "M"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eDIRECT Migrant Flag",
				"otherPossibleNames": [],
				"logicalName": "EDIRECT_MIGRANT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 168,
					"offsetEnd": 168,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eDIRECT McKinney-Vento (Homeless) Flag",
				"otherPossibleNames": [],
				"logicalName": "EDIRECT_MCKINNEY-VENTO_(HOMELESS)_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 169,
					"offsetEnd": 169,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
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
					"offsetStart": 170,
					"offsetEnd": 181,
					"columnNum": 36
				},
				"fieldLength": 12,
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
					"offsetStart": 182,
					"offsetEnd": 182,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "*", "-", ""],
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
					"offsetStart": 183,
					"offsetEnd": 183,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 184,
					"offsetEnd": 184,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 185,
					"offsetEnd": 185,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 186,
					"offsetEnd": 195,
					"columnNum": 41
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
					"offsetStart": 196,
					"offsetEnd": 197,
					"columnNum": 42
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
					"offsetStart": 198,
					"offsetEnd": 207,
					"columnNum": 43
				},
				"fieldLength": 10,
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
					"offsetStart": 208,
					"offsetEnd": 208,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "*", "-", ""],
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
					"offsetStart": 209,
					"offsetEnd": 209,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 210,
					"offsetEnd": 210,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 211,
					"offsetEnd": 211,
					"columnNum": 47
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 212,
					"offsetEnd": 212,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 213,
					"offsetEnd": 213,
					"columnNum": 49
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 214,
					"offsetEnd": 214,
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 215,
					"offsetEnd": 215,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 216,
					"offsetEnd": 216,
					"columnNum": 52
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 217,
					"offsetEnd": 217,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 218,
					"offsetEnd": 218,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 219,
					"offsetEnd": 219,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 220,
					"offsetEnd": 220,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 221,
					"offsetEnd": 221,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 222,
					"offsetEnd": 222,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 223,
					"offsetEnd": 223,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 224,
					"offsetEnd": 224,
					"columnNum": 60
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 225,
					"offsetEnd": 225,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 226,
					"offsetEnd": 226,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 227,
					"offsetEnd": 227,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 228,
					"offsetEnd": 228,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 229,
					"offsetEnd": 229,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 230,
					"offsetEnd": 230,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 231,
					"offsetEnd": 231,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 232,
					"offsetEnd": 232,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 233,
					"offsetEnd": 233,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 234,
					"offsetEnd": 234,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 235,
					"offsetEnd": 235,
					"columnNum": 71
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 236,
					"offsetEnd": 236,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 237,
					"offsetEnd": 237,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 238,
					"offsetEnd": 238,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Online Accommodated Paper Test",
				"otherPossibleNames": [],
				"logicalName": "ONLINE_ACCOMMODATED_PAPER_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 239,
					"offsetEnd": 239,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 241,
					"offsetEnd": 241,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 242,
					"offsetEnd": 242,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 243,
					"offsetEnd": 243,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 244,
					"offsetEnd": 244,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 245,
					"offsetEnd": 245,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 246,
					"offsetEnd": 246,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 247,
					"offsetEnd": 247,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 248,
					"offsetEnd": 252,
					"columnNum": 84
				},
				"fieldLength": 5,
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
					"offsetStart": 253,
					"offsetEnd": 253,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 254,
					"offsetEnd": 254,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 255,
					"offsetEnd": 255,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 256,
					"offsetEnd": 256,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 257,
					"offsetEnd": 257,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 258,
					"offsetEnd": 258,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 259,
					"offsetEnd": 263,
					"columnNum": 91
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
					"offsetStart": 264,
					"offsetEnd": 264,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 265,
					"offsetEnd": 265,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 266,
					"offsetEnd": 266,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 267,
					"offsetEnd": 267,
					"columnNum": 95
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 268,
					"offsetEnd": 268,
					"columnNum": 96
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 269,
					"offsetEnd": 269,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 270,
					"offsetEnd": 270,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 271,
					"offsetEnd": 271,
					"columnNum": 99
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 272,
					"offsetEnd": 272,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 273,
					"offsetEnd": 277,
					"columnNum": 101
				},
				"fieldLength": 5,
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
					"offsetStart": 278,
					"offsetEnd": 278,
					"columnNum": 102
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 279,
					"offsetEnd": 283,
					"columnNum": 103
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 284,
					"offsetEnd": 284,
					"columnNum": 104
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 285,
					"offsetEnd": 285,
					"columnNum": 105
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 286,
					"offsetEnd": 286,
					"columnNum": 106
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 287,
					"offsetEnd": 287,
					"columnNum": 107
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 288,
					"offsetEnd": 288,
					"columnNum": 108
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 289,
					"offsetEnd": 289,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 290,
					"offsetEnd": 290,
					"columnNum": 110
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 291,
					"offsetEnd": 291,
					"columnNum": 111
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 292,
					"offsetEnd": 292,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 293,
					"offsetEnd": 293,
					"columnNum": 113
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Scripts",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 294,
					"offsetEnd": 294,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 295,
					"offsetEnd": 296,
					"columnNum": 115
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spanish Tester",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 297,
					"offsetEnd": 297,
					"columnNum": 116
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
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
					"offsetStart": 298,
					"offsetEnd": 298,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "-", "*", ""],
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
					"offsetStart": 299,
					"offsetEnd": 299,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 300,
					"offsetEnd": 300,
					"columnNum": 119
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 301,
					"offsetEnd": 301,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 302,
					"offsetEnd": 311,
					"columnNum": 121
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
					"offsetStart": 312,
					"offsetEnd": 313,
					"columnNum": 122
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
					"offsetStart": 314,
					"offsetEnd": 323,
					"columnNum": 123
				},
				"fieldLength": 10,
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
					"offsetStart": 324,
					"offsetEnd": 324,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "-", "*", ""],
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
					"offsetStart": 325,
					"offsetEnd": 325,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 326,
					"offsetEnd": 326,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 327,
					"offsetEnd": 327,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 328,
					"offsetEnd": 328,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 329,
					"offsetEnd": 329,
					"columnNum": 129
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 330,
					"offsetEnd": 330,
					"columnNum": 130
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 331,
					"offsetEnd": 331,
					"columnNum": 131
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 332,
					"offsetEnd": 332,
					"columnNum": 132
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 333,
					"offsetEnd": 333,
					"columnNum": 133
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 334,
					"offsetEnd": 334,
					"columnNum": 134
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 335,
					"offsetEnd": 335,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 336,
					"offsetEnd": 336,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 337,
					"offsetEnd": 337,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 338,
					"offsetEnd": 338,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 339,
					"offsetEnd": 339,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 340,
					"offsetEnd": 340,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 341,
					"offsetEnd": 341,
					"columnNum": 141
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 342,
					"offsetEnd": 342,
					"columnNum": 142
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 343,
					"offsetEnd": 343,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 344,
					"offsetEnd": 344,
					"columnNum": 144
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 345,
					"offsetEnd": 345,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 346,
					"offsetEnd": 346,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 347,
					"offsetEnd": 347,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spanish Test Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST_TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 348,
					"offsetEnd": 348,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 349,
					"offsetEnd": 349,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 350,
					"offsetEnd": 350,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 351,
					"offsetEnd": 351,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 352,
					"offsetEnd": 352,
					"columnNum": 152
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 353,
					"offsetEnd": 353,
					"columnNum": 153
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 354,
					"offsetEnd": 354,
					"columnNum": 154
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 355,
					"offsetEnd": 355,
					"columnNum": 155
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 356,
					"offsetEnd": 356,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 357,
					"offsetEnd": 357,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 358,
					"offsetEnd": 358,
					"columnNum": 158
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 359,
					"offsetEnd": 359,
					"columnNum": 159
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 360,
					"offsetEnd": 360,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 361,
					"offsetEnd": 361,
					"columnNum": 161
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 362,
					"offsetEnd": 362,
					"columnNum": 162
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 363,
					"offsetEnd": 363,
					"columnNum": 163
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Calculator Use",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 364,
					"offsetEnd": 364,
					"columnNum": 164
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 365,
					"offsetEnd": 369,
					"columnNum": 165
				},
				"fieldLength": 5,
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
					"offsetStart": 370,
					"offsetEnd": 370,
					"columnNum": 166
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 371,
					"offsetEnd": 371,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 372,
					"offsetEnd": 372,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 373,
					"offsetEnd": 373,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 374,
					"offsetEnd": 374,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 375,
					"offsetEnd": 375,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 376,
					"offsetEnd": 376,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 377,
					"offsetEnd": 381,
					"columnNum": 173
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
					"offsetStart": 382,
					"offsetEnd": 382,
					"columnNum": 174
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 383,
					"offsetEnd": 383,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 384,
					"offsetEnd": 384,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 385,
					"offsetEnd": 385,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 386,
					"offsetEnd": 386,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 387,
					"offsetEnd": 387,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Calculator Use",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 391,
					"offsetEnd": 391,
					"columnNum": 183
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetEnd": 396,
					"columnNum": 184
				},
				"fieldLength": 5,
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
					"offsetStart": 397,
					"offsetEnd": 397,
					"columnNum": 185
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 398,
					"offsetEnd": 398,
					"columnNum": 186
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 399,
					"offsetEnd": 403,
					"columnNum": 187
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 404,
					"offsetEnd": 404,
					"columnNum": 188
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Spanish Test",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 405,
					"offsetEnd": 405,
					"columnNum": 189
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 406,
					"offsetEnd": 406,
					"columnNum": 190
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Human Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 407,
					"offsetEnd": 407,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 408,
					"offsetEnd": 408,
					"columnNum": 192
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 409,
					"offsetEnd": 409,
					"columnNum": 193
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 410,
					"offsetEnd": 410,
					"columnNum": 194
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 411,
					"offsetEnd": 411,
					"columnNum": 195
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Calculator",
				"otherPossibleNames": [],
				"logicalName": "CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 412,
					"offsetEnd": 412,
					"columnNum": 196
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 413,
					"offsetEnd": 413,
					"columnNum": 197
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 414,
					"offsetEnd": 414,
					"columnNum": 198
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 415,
					"offsetEnd": 415,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Scripts",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 416,
					"offsetEnd": 416,
					"columnNum": 200
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 417,
					"offsetEnd": 419,
					"columnNum": 201
				},
				"fieldLength": 3,
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
					"offsetStart": 420,
					"offsetEnd": 420,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "*", "-", ""],
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
					"offsetStart": 421,
					"offsetEnd": 421,
					"columnNum": 203
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 422,
					"offsetEnd": 422,
					"columnNum": 204
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 423,
					"offsetEnd": 423,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-"],
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
					"offsetStart": 424,
					"offsetEnd": 433,
					"columnNum": 206
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
					"offsetStart": 434,
					"offsetEnd": 435,
					"columnNum": 207
				},
				"fieldLength": 2,
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
					"offsetStart": 436,
					"offsetEnd": 436,
					"columnNum": 208
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 437,
					"offsetEnd": 445,
					"columnNum": 209
				},
				"fieldLength": 9,
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
					"offsetStart": 446,
					"offsetEnd": 446,
					"columnNum": 210
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "*", "-", ""],
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
					"offsetStart": 447,
					"offsetEnd": 447,
					"columnNum": 211
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 448,
					"offsetEnd": 448,
					"columnNum": 212
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 449,
					"offsetEnd": 449,
					"columnNum": 213
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 450,
					"offsetEnd": 450,
					"columnNum": 214
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 451,
					"offsetEnd": 451,
					"columnNum": 215
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 452,
					"offsetEnd": 452,
					"columnNum": 216
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 453,
					"offsetEnd": 453,
					"columnNum": 217
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 454,
					"offsetEnd": 454,
					"columnNum": 218
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 455,
					"offsetEnd": 455,
					"columnNum": 219
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 456,
					"offsetEnd": 456,
					"columnNum": 220
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 457,
					"offsetEnd": 457,
					"columnNum": 221
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 458,
					"offsetEnd": 458,
					"columnNum": 222
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 459,
					"offsetEnd": 459,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 460,
					"offsetEnd": 460,
					"columnNum": 224
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 461,
					"offsetEnd": 461,
					"columnNum": 225
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 462,
					"offsetEnd": 462,
					"columnNum": 226
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 463,
					"offsetEnd": 463,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 464,
					"offsetEnd": 464,
					"columnNum": 228
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 465,
					"offsetEnd": 465,
					"columnNum": 229
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 466,
					"offsetEnd": 466,
					"columnNum": 230
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 467,
					"offsetEnd": 467,
					"columnNum": 231
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 468,
					"offsetEnd": 468,
					"columnNum": 232
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetEnd": 478,
					"columnNum": 233
				},
				"fieldLength": 10,
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
					"offsetStart": 479,
					"offsetEnd": 479,
					"columnNum": 234
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 480,
					"offsetEnd": 480,
					"columnNum": 235
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 481,
					"offsetEnd": 481,
					"columnNum": 236
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 482,
					"offsetEnd": 482,
					"columnNum": 237
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 483,
					"offsetEnd": 483,
					"columnNum": 238
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 484,
					"offsetEnd": 484,
					"columnNum": 239
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 485,
					"offsetEnd": 485,
					"columnNum": 240
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 486,
					"offsetEnd": 486,
					"columnNum": 241
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 487,
					"offsetEnd": 487,
					"columnNum": 242
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 488,
					"offsetEnd": 488,
					"columnNum": 243
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 489,
					"offsetEnd": 489,
					"columnNum": 244
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 490,
					"offsetEnd": 494,
					"columnNum": 245
				},
				"fieldLength": 5,
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
					"offsetStart": 495,
					"offsetEnd": 495,
					"columnNum": 246
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 496,
					"offsetEnd": 496,
					"columnNum": 247
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 497,
					"offsetEnd": 497,
					"columnNum": 248
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 498,
					"offsetEnd": 498,
					"columnNum": 249
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 499,
					"offsetEnd": 499,
					"columnNum": 250
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 500,
					"offsetEnd": 500,
					"columnNum": 251
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Read Aloud Human Reader",
				"otherPossibleNames": [],
				"logicalName": "TESTS_READ_ALOUD_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 501,
					"columnNum": 252
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 502,
					"offsetEnd": 506,
					"columnNum": 253
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
					"offsetStart": 507,
					"offsetEnd": 507,
					"columnNum": 254
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 508,
					"offsetEnd": 508,
					"columnNum": 255
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 509,
					"offsetEnd": 509,
					"columnNum": 256
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 510,
					"offsetEnd": 510,
					"columnNum": 257
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 511,
					"offsetEnd": 511,
					"columnNum": 258
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 512,
					"offsetEnd": 512,
					"columnNum": 259
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 513,
					"offsetEnd": 513,
					"columnNum": 260
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 514,
					"offsetEnd": 514,
					"columnNum": 261
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y"],
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
					"offsetStart": 515,
					"offsetEnd": 515,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 516,
					"offsetEnd": 516,
					"columnNum": 263
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 517,
					"offsetEnd": 517,
					"columnNum": 264
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 518,
					"offsetEnd": 518,
					"columnNum": 265
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 519,
					"offsetEnd": 523,
					"columnNum": 266
				},
				"fieldLength": 5,
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
					"offsetStart": 524,
					"offsetEnd": 524,
					"columnNum": 267
				},
				"fieldLength": 1,
				"expectedValues": ["1"],
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
					"offsetStart": 525,
					"offsetEnd": 544,
					"columnNum": 268
				},
				"fieldLength": 20,
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
					"offsetStart": 545,
					"offsetEnd": 545,
					"columnNum": 269
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "*", "-", ""],
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
					"offsetStart": 546,
					"offsetEnd": 546,
					"columnNum": 270
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 547,
					"offsetEnd": 547,
					"columnNum": 271
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 548,
					"offsetEnd": 548,
					"columnNum": 272
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-"],
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
					"offsetStart": 549,
					"offsetEnd": 558,
					"columnNum": 273
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
					"offsetStart": 559,
					"offsetEnd": 560,
					"columnNum": 274
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
					"offsetStart": 561,
					"offsetEnd": 570,
					"columnNum": 275
				},
				"fieldLength": 10,
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
					"offsetStart": 571,
					"offsetEnd": 571,
					"columnNum": 276
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "*", "-", ""],
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
					"offsetStart": 572,
					"offsetEnd": 572,
					"columnNum": 277
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 573,
					"offsetEnd": 573,
					"columnNum": 278
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 574,
					"offsetEnd": 574,
					"columnNum": 279
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 575,
					"offsetEnd": 575,
					"columnNum": 280
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 576,
					"offsetEnd": 576,
					"columnNum": 281
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 577,
					"offsetEnd": 577,
					"columnNum": 282
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 578,
					"offsetEnd": 578,
					"columnNum": 283
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 579,
					"offsetEnd": 579,
					"columnNum": 284
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 580,
					"offsetEnd": 580,
					"columnNum": 285
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 581,
					"offsetEnd": 581,
					"columnNum": 286
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 582,
					"offsetEnd": 582,
					"columnNum": 287
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 583,
					"offsetEnd": 583,
					"columnNum": 288
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 584,
					"offsetEnd": 584,
					"columnNum": 289
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 585,
					"offsetEnd": 585,
					"columnNum": 290
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 586,
					"offsetEnd": 586,
					"columnNum": 291
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 587,
					"offsetEnd": 587,
					"columnNum": 292
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 588,
					"offsetEnd": 588,
					"columnNum": 293
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 589,
					"offsetEnd": 589,
					"columnNum": 294
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 590,
					"offsetEnd": 590,
					"columnNum": 295
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 591,
					"offsetEnd": 591,
					"columnNum": 296
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 592,
					"offsetEnd": 592,
					"columnNum": 297
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 593,
					"offsetEnd": 593,
					"columnNum": 298
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 594,
					"offsetEnd": 603,
					"columnNum": 299
				},
				"fieldLength": 10,
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
					"offsetStart": 604,
					"offsetEnd": 604,
					"columnNum": 300
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 605,
					"offsetEnd": 605,
					"columnNum": 301
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 606,
					"offsetEnd": 606,
					"columnNum": 302
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 607,
					"offsetEnd": 607,
					"columnNum": 303
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 608,
					"offsetEnd": 608,
					"columnNum": 304
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 609,
					"offsetEnd": 609,
					"columnNum": 305
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 610,
					"offsetEnd": 610,
					"columnNum": 306
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 611,
					"offsetEnd": 611,
					"columnNum": 307
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 612,
					"offsetEnd": 612,
					"columnNum": 308
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 613,
					"offsetEnd": 613,
					"columnNum": 309
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 614,
					"offsetEnd": 614,
					"columnNum": 310
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 615,
					"offsetEnd": 619,
					"columnNum": 311
				},
				"fieldLength": 5,
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
					"offsetStart": 620,
					"offsetEnd": 620,
					"columnNum": 312
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 621,
					"offsetEnd": 621,
					"columnNum": 313
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 622,
					"offsetEnd": 622,
					"columnNum": 314
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 623,
					"offsetEnd": 623,
					"columnNum": 315
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 624,
					"offsetEnd": 624,
					"columnNum": 316
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 625,
					"offsetEnd": 625,
					"columnNum": 317
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 626,
					"offsetEnd": 626,
					"columnNum": 318
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 627,
					"offsetEnd": 631,
					"columnNum": 319
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
					"offsetStart": 632,
					"offsetEnd": 632,
					"columnNum": 320
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 633,
					"offsetEnd": 633,
					"columnNum": 321
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 634,
					"offsetEnd": 634,
					"columnNum": 322
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 635,
					"offsetEnd": 635,
					"columnNum": 323
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 636,
					"offsetEnd": 636,
					"columnNum": 324
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 637,
					"offsetEnd": 637,
					"columnNum": 325
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 638,
					"offsetEnd": 638,
					"columnNum": 326
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 639,
					"offsetEnd": 639,
					"columnNum": 327
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 640,
					"offsetEnd": 640,
					"columnNum": 328
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 641,
					"offsetEnd": 641,
					"columnNum": 329
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 642,
					"offsetEnd": 642,
					"columnNum": 330
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 643,
					"offsetEnd": 643,
					"columnNum": 331
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
					"offsetStart": 644,
					"offsetEnd": 648,
					"columnNum": 332
				},
				"fieldLength": 5,
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
					"offsetStart": 649,
					"offsetEnd": 649,
					"columnNum": 333
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 650,
					"offsetEnd": 654,
					"columnNum": 334
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Text-to-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 655,
					"offsetEnd": 655,
					"columnNum": 335
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Human Read Aloud ",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READ_ALOUD_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 656,
					"offsetEnd": 656,
					"columnNum": 336
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 657,
					"offsetEnd": 657,
					"columnNum": 337
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Directions in Native Language",
				"otherPossibleNames": [],
				"logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 658,
					"offsetEnd": 658,
					"columnNum": 338
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 659,
					"offsetEnd": 659,
					"columnNum": 339
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 660,
					"offsetEnd": 660,
					"columnNum": 340
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 661,
					"offsetEnd": 661,
					"columnNum": 341
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 662,
					"offsetEnd": 662,
					"columnNum": 342
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accommodated Paper",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATED_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 663,
					"offsetEnd": 663,
					"columnNum": 343
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 664,
					"offsetEnd": 664,
					"columnNum": 344
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Communication Assistance Scripts",
				"otherPossibleNames": [],
				"logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 665,
					"offsetEnd": 665,
					"columnNum": 345
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
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
					"offsetStart": 666,
					"offsetEnd": 667,
					"columnNum": 346
				},
				"fieldLength": 2,
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
					"offsetStart": 668,
					"offsetEnd": 668,
					"columnNum": 347
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "eDIRECT Education Classification Flag",
				"otherPossibleNames": [],
				"logicalName": "EDIRECT_EDUCATION_CLASSIFICATION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 669,
					"offsetEnd": 669,
					"columnNum": 348
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2"],
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
					"offsetStart": 670,
					"offsetEnd": 670,
					"columnNum": 349
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 671,
					"offsetEnd": 671,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 672,
					"offsetEnd": 672,
					"columnNum": 351
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 673,
					"offsetEnd": 673,
					"columnNum": 352
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 674,
					"offsetEnd": 674,
					"columnNum": 353
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Education Classification Flag",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 675,
					"offsetEnd": 675,
					"columnNum": 354
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2"],
				"dataTypes": "INTEGER",
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
					"offsetStart": 676,
					"offsetEnd": 677,
					"columnNum": 355
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 678,
					"offsetEnd": 679,
					"columnNum": 356
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 680,
					"offsetEnd": 681,
					"columnNum": 357
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 682,
					"offsetEnd": 683,
					"columnNum": 358
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 684,
					"offsetEnd": 685,
					"columnNum": 359
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 686,
					"offsetEnd": 687,
					"columnNum": 360
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
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
					"offsetStart": 688,
					"offsetEnd": 689,
					"columnNum": 361
				},
				"fieldLength": 2,
				"expectedValues": ["", "01", "02"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 690,
					"offsetEnd": 690,
					"columnNum": 362
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 691,
					"columnNum": 363
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 692,
					"offsetEnd": 692,
					"columnNum": 364
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 693,
					"offsetEnd": 693,
					"columnNum": 365
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized LEP Status ",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 694,
					"offsetEnd": 693,
					"columnNum": 366
				},
				"fieldLength": 0,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 695,
					"offsetEnd": 695,
					"columnNum": 367
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Section 504 Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_SECTION_504_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 696,
					"offsetEnd": 698,
					"columnNum": 368
				},
				"fieldLength": 3,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 699,
					"offsetEnd": 699,
					"columnNum": 369
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 700,
					"offsetEnd": 700,
					"columnNum": 370
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 701,
					"offsetEnd": 701,
					"columnNum": 371
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 702,
					"offsetEnd": 702,
					"columnNum": 372
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Section 504 Status ",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SECTION_504_STATUS_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 703,
					"offsetEnd": 703,
					"columnNum": 373
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Hispanic/Latino",
				"otherPossibleNames": [],
				"logicalName": "LAP_HISPANIC/LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 704,
					"offsetEnd": 704,
					"columnNum": 374
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "LAP_AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 705,
					"offsetEnd": 705,
					"columnNum": 375
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Asian",
				"otherPossibleNames": [],
				"logicalName": "LAP_ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 706,
					"offsetEnd": 706,
					"columnNum": 376
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Black or African American",
				"otherPossibleNames": [],
				"logicalName": "LAP_BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 707,
					"offsetEnd": 707,
					"columnNum": 377
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "LAP_NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 708,
					"offsetEnd": 708,
					"columnNum": 378
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP White",
				"otherPossibleNames": [],
				"logicalName": "LAP_WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 709,
					"offsetEnd": 709,
					"columnNum": 379
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY/RACE_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 710,
					"offsetEnd": 710,
					"columnNum": 380
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY/RACE_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 711,
					"offsetEnd": 711,
					"columnNum": 381
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY/RACE_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 712,
					"offsetEnd": 712,
					"columnNum": 382
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Summarized Ethnicity/Race - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY/RACE_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 713,
					"offsetEnd": 713,
					"columnNum": 383
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
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
					"offsetStart": 714,
					"offsetEnd": 733,
					"columnNum": 384
				},
				"fieldLength": 20,
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
					"offsetStart": 734,
					"offsetEnd": 738,
					"columnNum": 385
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
					"offsetStart": 739,
					"offsetEnd": 741,
					"columnNum": 386
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
					"offsetStart": 742,
					"offsetEnd": 744,
					"columnNum": 387
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Literary Text Raw Score",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 745,
					"offsetEnd": 748,
					"columnNum": 388
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Literary Text Rating",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 749,
					"offsetEnd": 749,
					"columnNum": 389
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Literary Text Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 750,
					"offsetEnd": 752,
					"columnNum": 390
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Informational Text Raw Score",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 753,
					"offsetEnd": 756,
					"columnNum": 391
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Informational Text Rating",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 757,
					"columnNum": 392
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Informational Text Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 758,
					"offsetEnd": 760,
					"columnNum": 393
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Vocabulary Raw Score",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 761,
					"offsetEnd": 764,
					"columnNum": 394
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Vocabulary Rating",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 765,
					"offsetEnd": 765,
					"columnNum": 395
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Vocabulary Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 766,
					"offsetEnd": 768,
					"columnNum": 396
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Written Expression Raw Score",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 769,
					"offsetEnd": 772,
					"columnNum": 397
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Written Expression Rating",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 773,
					"offsetEnd": 773,
					"columnNum": 398
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Written Expression Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 774,
					"offsetEnd": 776,
					"columnNum": 399
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Raw Score",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 780,
					"columnNum": 400
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Rating",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 781,
					"columnNum": 401
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Knowledge & Use of Language Conventions Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 782,
					"offsetEnd": 784,
					"columnNum": 402
				},
				"fieldLength": 3,
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
					"offsetStart": 785,
					"offsetEnd": 804,
					"columnNum": 403
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Raw Score",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 805,
					"offsetEnd": 808,
					"columnNum": 404
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Rating ",
				"otherPossibleNames": [],
				"logicalName": "READING_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 809,
					"offsetEnd": 809,
					"columnNum": 405
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Reading Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "READING_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 810,
					"offsetEnd": 812,
					"columnNum": 406
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Writing Raw Score",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 813,
					"offsetEnd": 816,
					"columnNum": 407
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Writing Rating",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RATING_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 817,
					"offsetEnd": 817,
					"columnNum": 408
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Writing Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERCENT_CORRECT_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 818,
					"offsetEnd": 820,
					"columnNum": 409
				},
				"fieldLength": 3,
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
					"offsetStart": 821,
					"offsetEnd": 840,
					"columnNum": 410
				},
				"fieldLength": 20,
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
					"offsetStart": 841,
					"offsetEnd": 843,
					"columnNum": 411
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
					"offsetStart": 844,
					"offsetEnd": 846,
					"columnNum": 412
				},
				"fieldLength": 3,
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
					"offsetStart": 847,
					"offsetEnd": 856,
					"columnNum": 413
				},
				"fieldLength": 10,
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
					"offsetStart": 857,
					"offsetEnd": 861,
					"columnNum": 414
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
					"offsetStart": 862,
					"offsetEnd": 864,
					"columnNum": 415
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
					"offsetStart": 865,
					"offsetEnd": 867,
					"columnNum": 416
				},
				"fieldLength": 3,
				"expectedValues": ["", "UNS", "APP", "BAS", "MAS", "ADV", "INC"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Major Content Raw Score",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 868,
					"offsetEnd": 871,
					"columnNum": 417
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Major Content Rating",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 872,
					"offsetEnd": 872,
					"columnNum": 418
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Major Content Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_PERCENT_CORRECT_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 873,
					"offsetEnd": 875,
					"columnNum": 419
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Additional & Supporting Content Raw Score",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 876,
					"offsetEnd": 879,
					"columnNum": 420
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Additional & Supporting Content Rating",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 880,
					"offsetEnd": 880,
					"columnNum": 421
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Additional & Supporting Content Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_PERCENT_CORRECT_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 881,
					"offsetEnd": 883,
					"columnNum": 422
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Raw Score",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 884,
					"offsetEnd": 887,
					"columnNum": 423
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Rating",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 888,
					"offsetEnd": 888,
					"columnNum": 424
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Expressing Mathematical Reasoning Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_PERCENT_CORRECT_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 889,
					"offsetEnd": 891,
					"columnNum": 425
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Modeling & Application Raw Score",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RAW_SCORE_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 892,
					"offsetEnd": 895,
					"columnNum": 426
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Modeling & Application Rating",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 896,
					"offsetEnd": 896,
					"columnNum": 427
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Modeling & Application Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_PERCENT_CORRECT_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 897,
					"offsetEnd": 899,
					"columnNum": 428
				},
				"fieldLength": 3,
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
					"offsetStart": 900,
					"offsetEnd": 919,
					"columnNum": 429
				},
				"fieldLength": 20,
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
					"offsetStart": 920,
					"offsetEnd": 922,
					"columnNum": 430
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 923,
					"offsetEnd": 925,
					"columnNum": 431
				},
				"fieldLength": 3,
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
					"offsetStart": 926,
					"offsetEnd": 935,
					"columnNum": 432
				},
				"fieldLength": 10,
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
					"offsetStart": 936,
					"offsetEnd": 940,
					"columnNum": 433
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
					"offsetStart": 941,
					"offsetEnd": 943,
					"columnNum": 434
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
					"offsetStart": 944,
					"offsetEnd": 946,
					"columnNum": 435
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Science as Inquiry (strand 1)  points earned",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_1_SCIENCE_AS_INQUIRY_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 947,
					"offsetEnd": 950,
					"columnNum": 436
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Science as Inquiry (strand 1)  percent correct",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_1_SCIENCE_AS_INQUIRY_PERCENT_CORRECT_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 951,
					"offsetEnd": 953,
					"columnNum": 437
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 2 Physical Science",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_2_PHYSICAL_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 954,
					"offsetEnd": 957,
					"columnNum": 438
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 2 Physical Science Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_2_PHYSICAL_SCIENCE_PERCENT_CORRECT_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 958,
					"offsetEnd": 960,
					"columnNum": 439
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Life Science (strand 3) points earned",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_3_LIFE_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 961,
					"offsetEnd": 964,
					"columnNum": 440
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Life Science (strand 3) percent correct",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_3_LIFE_SCIENCE_PERCENT_CORRECT_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 965,
					"offsetEnd": 967,
					"columnNum": 441
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Earth and Space Science (strand 4)  points earned",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_4_EARTH_AND_SPACE_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 968,
					"offsetEnd": 971,
					"columnNum": 442
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Earth and Space Science (strand 4) percent correct",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_4_EARTH_AND_SPACE_SCIENCE_PERCENT_CORRECT_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 972,
					"offsetEnd": 974,
					"columnNum": 443
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 5 Science and the Environment",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_5_SCIENCE_AND_THE_ENVIRONMENT_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 975,
					"offsetEnd": 978,
					"columnNum": 444
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard 5 Science and the Environment Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_5_SCIENCE_AND_THE_ENVIRONMENT_PERCENT_CORRECT_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 979,
					"offsetEnd": 981,
					"columnNum": 445
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
					"offsetStart": 982,
					"offsetEnd": 1001,
					"columnNum": 446
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 1 Multiple-Choice Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1002,
					"offsetEnd": 1005,
					"columnNum": 447
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 2 Short Answer Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_2_SHORT_ANSWER_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1006,
					"offsetEnd": 1009,
					"columnNum": 448
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Subtest 3 Task Items",
				"otherPossibleNames": [],
				"logicalName": "SUBTEST_3_TASK_ITEMS_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1010,
					"offsetEnd": 1013,
					"columnNum": 449
				},
				"fieldLength": 4,
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
					"offsetStart": 1014,
					"offsetEnd": 1016,
					"columnNum": 450
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
					"offsetStart": 1017,
					"offsetEnd": 1020,
					"columnNum": 451
				},
				"fieldLength": 4,
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
					"offsetStart": 1021,
					"offsetEnd": 1023,
					"columnNum": 452
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 1024,
					"offsetEnd": 1026,
					"columnNum": 453
				},
				"fieldLength": 3,
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
					"offsetStart": 1027,
					"offsetEnd": 1056,
					"columnNum": 454
				},
				"fieldLength": 30,
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
					"offsetStart": 1057,
					"offsetEnd": 1061,
					"columnNum": 455
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
					"offsetStart": 1062,
					"offsetEnd": 1064,
					"columnNum": 456
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
					"offsetStart": 1065,
					"offsetEnd": 1067,
					"columnNum": 457
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "History",
				"otherPossibleNames": [],
				"logicalName": "HISTORY_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1068,
					"offsetEnd": 1071,
					"columnNum": 458
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Geography",
				"otherPossibleNames": [],
				"logicalName": "GEOGRAPHY_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1072,
					"offsetEnd": 1075,
					"columnNum": 459
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Civics",
				"otherPossibleNames": [],
				"logicalName": "CIVICS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1076,
					"offsetEnd": 1079,
					"columnNum": 460
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Economics",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICS_RAW_SCORE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1080,
					"offsetEnd": 1083,
					"columnNum": 461
				},
				"fieldLength": 4,
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
					"offsetStart": 1084,
					"offsetEnd": 1133,
					"columnNum": 462
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEM High Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1134,
					"offsetEnd": 1136,
					"columnNum": 463
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "SEM Low Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1137,
					"offsetEnd": 1139,
					"columnNum": 464
				},
				"fieldLength": 3,
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
					"offsetStart": 1140,
					"offsetEnd": 1169,
					"columnNum": 465
				},
				"fieldLength": 30,
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
					"offsetStart": 1170,
					"offsetEnd": 1170,
					"columnNum": 466
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1171,
					"offsetEnd": 1171,
					"columnNum": 467
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1172,
					"offsetEnd": 1172,
					"columnNum": 468
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1173,
					"offsetEnd": 1173,
					"columnNum": 469
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1174,
					"offsetEnd": 1174,
					"columnNum": 470
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2", "3"],
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
					"offsetStart": 1175,
					"offsetEnd": 1175,
					"columnNum": 471
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2", "3"],
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
					"offsetStart": 1176,
					"offsetEnd": 1176,
					"columnNum": 472
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2", "3"],
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
					"offsetStart": 1177,
					"offsetEnd": 1177,
					"columnNum": 473
				},
				"fieldLength": 1,
				"expectedValues": ["", "0", "1", "2", "3"],
				"dataTypes": "INTEGER",
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
					"offsetStart": 1178,
					"offsetEnd": 1178,
					"columnNum": 474
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1179,
					"offsetEnd": 1179,
					"columnNum": 475
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1180,
					"offsetEnd": 1180,
					"columnNum": 476
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1181,
					"offsetEnd": 1181,
					"columnNum": 477
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1182,
					"offsetEnd": 1182,
					"columnNum": 478
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1183,
					"offsetEnd": 1183,
					"columnNum": 479
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1184,
					"offsetEnd": 1184,
					"columnNum": 480
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1185,
					"offsetEnd": 1185,
					"columnNum": 481
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1186,
					"offsetEnd": 1205,
					"columnNum": 482
				},
				"fieldLength": 20,
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
					"offsetStart": 1206,
					"offsetEnd": 1206,
					"columnNum": 483
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "4"],
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
					"offsetStart": 1207,
					"offsetEnd": 1207,
					"columnNum": 484
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "4"],
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
					"offsetStart": 1208,
					"offsetEnd": 1208,
					"columnNum": 485
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "4"],
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
					"offsetStart": 1209,
					"offsetEnd": 1209,
					"columnNum": 486
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "4"],
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
					"offsetStart": 1210,
					"offsetEnd": 1227,
					"columnNum": 487
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1228,
					"offsetEnd": 1229,
					"columnNum": 488
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1230,
					"offsetEnd": 1231,
					"columnNum": 489
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1232,
					"offsetEnd": 1233,
					"columnNum": 490
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Updated Accountability Code - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1234,
					"offsetEnd": 1235,
					"columnNum": 491
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 1236,
					"offsetEnd": 1238,
					"columnNum": 492
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
					"offsetStart": 1239,
					"offsetEnd": 1241,
					"columnNum": 493
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
					"offsetStart": 1242,
					"offsetEnd": 1244,
					"columnNum": 494
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
					"offsetStart": 1245,
					"offsetEnd": 1247,
					"columnNum": 495
				},
				"fieldLength": 3,
				"expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
					"offsetStart": 1248,
					"offsetEnd": 1273,
					"columnNum": 496
				},
				"fieldLength": 26,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Mode - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1274,
					"offsetEnd": 1274,
					"columnNum": 497
				},
				"fieldLength": 1,
				"expectedValues": ["", "P", "O"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Mode - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1275,
					"offsetEnd": 1275,
					"columnNum": 498
				},
				"fieldLength": 1,
				"expectedValues": ["", "P", "O"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Mode - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1276,
					"offsetEnd": 1276,
					"columnNum": 499
				},
				"fieldLength": 1,
				"expectedValues": ["", "P", "O"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Mode - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1277,
					"offsetEnd": 1277,
					"columnNum": 500
				},
				"fieldLength": 1,
				"expectedValues": ["", "P", "O"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAP Site Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1278,
					"offsetEnd": 1283,
					"columnNum": 501
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Site Code - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1284,
					"offsetEnd": 1289,
					"columnNum": 502
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Site Code - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1290,
					"offsetEnd": 1295,
					"columnNum": 503
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Site Code - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1296,
					"offsetEnd": 1301,
					"columnNum": 504
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Site Code - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "SITE_CODE_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1302,
					"offsetEnd": 1307,
					"columnNum": 505
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 1 (ELA)",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_1_(ELA)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1308,
					"offsetEnd": 1308,
					"columnNum": 506
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "M", "P", "O", "C"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 2 (Math)",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_2_(MATH)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1309,
					"offsetEnd": 1309,
					"columnNum": 507
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "M", "P", "O", "C"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 3 (Science)",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_3_(SCIENCE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1310,
					"offsetEnd": 1310,
					"columnNum": 508
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "M", "P", "O", "C"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Document Type Returned - Document 4 (Social Studies)",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_4_(SOCIAL_STUDIES)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1311,
					"offsetEnd": 1311,
					"columnNum": 509
				},
				"fieldLength": 1,
				"expectedValues": ["", "N", "M", "P", "O", "C"],
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
					"offsetStart": 1312,
					"offsetEnd": 1313,
					"columnNum": 510
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
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
					"offsetStart": 1314,
					"offsetEnd": 1314,
					"columnNum": 511
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "INTEGER",
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
					"offsetStart": 1315,
					"offsetEnd": 1315,
					"columnNum": 512
				},
				"fieldLength": 1,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6"],
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
					"offsetStart": 1316,
					"offsetEnd": 1335,
					"columnNum": 513
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - ELA",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1336,
					"offsetEnd": 1343,
					"columnNum": 514
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - ELA",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1344,
					"offsetEnd": 1349,
					"columnNum": 515
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - ELA",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1350,
					"offsetEnd": 1361,
					"columnNum": 516
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number - ELA",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1362,
					"offsetEnd": 1369,
					"columnNum": 517
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Launch Flag - ELA",
				"otherPossibleNames": [],
				"logicalName": "LAUNCH_FLAG_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1370,
					"offsetEnd": 1370,
					"columnNum": 518
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1371,
					"offsetEnd": 1376,
					"columnNum": 519
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
					"offsetStart": 1377,
					"offsetEnd": 1379,
					"columnNum": 520
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - Math",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1380,
					"offsetEnd": 1387,
					"columnNum": 521
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - Math",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1388,
					"offsetEnd": 1393,
					"columnNum": 522
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - Math",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1394,
					"offsetEnd": 1405,
					"columnNum": 523
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number - Math",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1406,
					"offsetEnd": 1413,
					"columnNum": 524
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Launch Flag - Math",
				"otherPossibleNames": [],
				"logicalName": "LAUNCH_FLAG_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1414,
					"offsetEnd": 1414,
					"columnNum": 525
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1415,
					"offsetEnd": 1420,
					"columnNum": 526
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
					"offsetStart": 1421,
					"offsetEnd": 1423,
					"columnNum": 527
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - Science",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1424,
					"offsetEnd": 1431,
					"columnNum": 528
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - Science",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1432,
					"offsetEnd": 1437,
					"columnNum": 529
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - Science",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1438,
					"offsetEnd": 1449,
					"columnNum": 530
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number - Science",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1450,
					"offsetEnd": 1457,
					"columnNum": 531
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1458,
					"offsetEnd": 1463,
					"columnNum": 532
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
					"offsetStart": 1464,
					"offsetEnd": 1467,
					"columnNum": 533
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Batch Number - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "BATCH_NUMBER_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1468,
					"offsetEnd": 1475,
					"columnNum": 534
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Serial Number - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SERIAL_NUMBER_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1476,
					"offsetEnd": 1481,
					"columnNum": 535
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Lithocode - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "LITHOCODE_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1482,
					"offsetEnd": 1493,
					"columnNum": 536
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Security Barcode Number - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "SECURITY_BARCODE_NUMBER_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1494,
					"offsetEnd": 1501,
					"columnNum": 537
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Launch Flag - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "LAUNCH_FLAG_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1502,
					"offsetEnd": 1502,
					"columnNum": 538
				},
				"fieldLength": 1,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Form",
				"otherPossibleNames": [],
				"logicalName": "FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1503,
					"offsetEnd": 1508,
					"columnNum": 539
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
					"offsetStart": 1509,
					"offsetEnd": 1511,
					"columnNum": 540
				},
				"fieldLength": 3,
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
					"offsetStart": 1512,
					"offsetEnd": 1512,
					"columnNum": 541
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1513,
					"offsetEnd": 1513,
					"columnNum": 542
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1514,
					"offsetEnd": 1514,
					"columnNum": 543
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1515,
					"offsetEnd": 1515,
					"columnNum": 544
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1516,
					"offsetEnd": 1516,
					"columnNum": 545
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1517,
					"offsetEnd": 1517,
					"columnNum": 546
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1518,
					"offsetEnd": 1518,
					"columnNum": 547
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Site Report Code",
				"otherPossibleNames": [],
				"logicalName": "SITE_REPORT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1519,
					"offsetEnd": 1524,
					"columnNum": 548
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 1525,
					"offsetEnd": 1525,
					"columnNum": 549
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1526,
					"offsetEnd": 1526,
					"columnNum": 550
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1527,
					"offsetEnd": 1527,
					"columnNum": 551
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1528,
					"offsetEnd": 1528,
					"columnNum": 552
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1529,
					"offsetEnd": 1529,
					"columnNum": 553
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1530,
					"offsetEnd": 1530,
					"columnNum": 554
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1531,
					"offsetEnd": 1540,
					"columnNum": 555
				},
				"fieldLength": 10,
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
					"offsetStart": 1541,
					"offsetEnd": 1541,
					"columnNum": 556
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Roster - Science",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_ROSTER_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1542,
					"offsetEnd": 1542,
					"columnNum": 557
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report - ELA",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1543,
					"offsetEnd": 1543,
					"columnNum": 558
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report - Math",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1544,
					"offsetEnd": 1544,
					"columnNum": 559
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report - Science",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1545,
					"offsetEnd": 1545,
					"columnNum": 560
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Report - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REPORT_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1546,
					"offsetEnd": 1546,
					"columnNum": 561
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1547,
					"offsetEnd": 1547,
					"columnNum": 562
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1548,
					"offsetEnd": 1548,
					"columnNum": 563
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1549,
					"offsetEnd": 1549,
					"columnNum": 564
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1550,
					"offsetEnd": 1550,
					"columnNum": 565
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
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
					"offsetStart": 1551,
					"offsetEnd": 1560,
					"columnNum": 566
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Number - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1561,
					"offsetEnd": 1563,
					"columnNum": 567
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1564,
					"offsetEnd": 1583,
					"columnNum": 568
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1584,
					"offsetEnd": 1603,
					"columnNum": 569
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Number - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1604,
					"offsetEnd": 1606,
					"columnNum": 570
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1607,
					"offsetEnd": 1626,
					"columnNum": 571
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1627,
					"offsetEnd": 1646,
					"columnNum": 572
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Number - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1647,
					"offsetEnd": 1649,
					"columnNum": 573
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1650,
					"offsetEnd": 1669,
					"columnNum": 574
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1670,
					"offsetEnd": 1689,
					"columnNum": 575
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Number - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_NUMBER_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1690,
					"offsetEnd": 1692,
					"columnNum": 576
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Last Name - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1693,
					"offsetEnd": 1712,
					"columnNum": 577
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator First Name - Social Studies",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1713,
					"offsetEnd": 1732,
					"columnNum": 578
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
					"offsetStart": 1733,
					"offsetEnd": 1782,
					"columnNum": 579
				},
				"fieldLength": 50,
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
					"offsetStart": 1783,
					"offsetEnd": 1784,
					"columnNum": 580
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
					"offsetStart": 1785,
					"offsetEnd": 1792,
					"columnNum": 581
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ELA Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "ELA_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1793,
					"offsetEnd": 2092,
					"columnNum": 582
				},
				"fieldLength": 300,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Math Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "MATH_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2093,
					"offsetEnd": 2392,
					"columnNum": 583
				},
				"fieldLength": 300,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Science Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2393,
					"offsetEnd": 2642,
					"columnNum": 584
				},
				"fieldLength": 250,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Social Studies Operational Item Responses",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_OPERATIONAL_ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2643,
					"offsetEnd": 2892,
					"columnNum": 585
				},
				"fieldLength": 250,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "File Creation Date and Time Stamp",
				"otherPossibleNames": [],
				"logicalName": "FILE_CREATION_DATE_AND_TIME_STAMP",
				"formatMask": "yyyy-MM-dd HH:MM:SS",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2893,
					"offsetEnd": 2911,
					"columnNum": 586
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": 0.0
			}
		]
	},
  "fileExtensions": [".dat"]
}