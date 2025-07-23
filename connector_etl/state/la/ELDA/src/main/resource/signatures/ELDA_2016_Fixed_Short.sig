{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "ELDA_2016_Fixed_Short",
    "recordLength": 1382,
    "naturalKey": ["STATE_ID", "TEST_DATE_MONTH", "TEST_DATE_YEAR","BARCODE_STUDENT_PRECODE_NUMBER","DRC_UNIQUE_STUDENT_ID"],
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
 				"dataTypes": "STRING",
 				"scale": null
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
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Straggler ",
 				"otherPossibleNames": [],
 				"logicalName": "STRAGGLER_",
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
 					"offsetStart": 8,
 					"offsetEnd": 11,
 					"columnNum": 4
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "District Code",
 				"otherPossibleNames": [],
 				"logicalName": "DISTRICT_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 12,
 					"offsetEnd": 14,
 					"columnNum": 5
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
 					"offsetStart": 15,
 					"offsetEnd": 17,
 					"columnNum": 6
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
 					"offsetStart": 18,
 					"offsetEnd": 57,
 					"columnNum": 7
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
 					"offsetStart": 58,
 					"offsetEnd": 97,
 					"columnNum": 8
 				},
 				"fieldLength": 40,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Document Grade Cluster",
 				"otherPossibleNames": [],
 				"logicalName": "DOCUMENT_GRADE_CLUSTER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 98,
 					"offsetEnd": 98,
 					"columnNum": 9
 				},
 				"fieldLength": 1,
 				"expectedValues": ["1", "2", "3", "6", "9", "", " "],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized  Reporting Grade",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_REPORTING_GRADE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 99,
 					"offsetEnd": 100,
 					"columnNum": 10
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Grade",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_GRADE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 101,
 					"offsetEnd": 102,
 					"columnNum": 11
 				},
 				"fieldLength": 2,
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
 					"offsetStart": 103,
 					"offsetEnd": 114,
 					"columnNum": 12
 				},
 				"fieldLength": 12,
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
 					"offsetStart": 115,
 					"offsetEnd": 122,
 					"columnNum": 13
 				},
 				"fieldLength": 8,
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
 					"offsetStart": 123,
 					"offsetEnd": 123,
 					"columnNum": 14
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "State ID Louisiana Secure Identification Number (LASID)",
 				"otherPossibleNames": [],
 				"logicalName": "STATE_ID",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 124,
 					"offsetEnd": 132,
 					"columnNum": 15
 				},
 				"fieldLength": 9,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Barcode/Student Precode Number",
 				"otherPossibleNames": [],
 				"logicalName": "BARCODE_STUDENT_PRECODE_NUMBER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 133,
 					"offsetEnd": 141,
 					"columnNum": 16
 				},
 				"fieldLength": 9,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "FILLER   ",
 				"otherPossibleNames": [],
 				"logicalName": "FILLER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 142,
 					"offsetEnd": 150,
 					"columnNum": 17
 				},
 				"fieldLength": 7,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized McKinney-Vento Act (Homeless)",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_MCKINNEY-VENTO_ACT_(HOMELESS)",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 151,
 					"offsetEnd": 151,
 					"columnNum": 18
 				},
 				"fieldLength": 1,
 				"expectedValues": ["Y", "N"],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized DOB Month",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_DOB_MONTH",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 152,
 					"offsetEnd": 153,
 					"columnNum": 19
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized DOB Day",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_DOB_DAY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 154,
 					"offsetEnd": 155,
 					"columnNum": 20
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized DOB Year",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_DOB_YEAR",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 156,
 					"offsetEnd": 159,
 					"columnNum": 21
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Gender",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_GENDER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 160,
 					"offsetEnd": 160,
 					"columnNum": 22
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Ethnicity/Race",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_ETHNICITY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 161,
 					"offsetEnd": 161,
 					"columnNum": 23
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Economically Disadvantaged FILLER",
 				"otherPossibleNames": [],
 				"logicalName": "FILLER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 162,
 					"offsetEnd": 162,
 					"columnNum": 24
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Economically Disadvantaged",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_ECONOMICALLY_DISADVANTAGED",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 163,
 					"offsetEnd": 163,
 					"columnNum": 25
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Lunch Status FILLER",
 				"otherPossibleNames": [],
 				"logicalName": "FILLER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 164,
 					"offsetEnd": 164,
 					"columnNum": 26
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Language code",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_FIRST_OR_NATIVE_LANGUAGE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 165,
 					"offsetEnd": 167,
 					"columnNum": 27
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled First or Native Language",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_FIRST_OR_NATIVE_LANGUAGE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 168,
 					"offsetEnd": 169,
 					"columnNum": 28
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized First or Native Language",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_FIRST_OR_NATIVE_LANGUAGE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 170,
 					"offsetEnd": 171,
 					"columnNum": 29
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Migrant Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_MIGRANT_STATUS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 172,
 					"offsetEnd": 172,
 					"columnNum": 30
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Migrant Status",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_MIGRANT_STATUS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 173,
 					"offsetEnd": 173,
 					"columnNum": 31
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Migrant Status",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED__MIGRANT_STATUS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 174,
 					"offsetEnd": 174,
 					"columnNum": 32
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Gender",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_GENDER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 175,
 					"offsetEnd": 175,
 					"columnNum": 33
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
 					"offsetStart": 176,
 					"offsetEnd": 176,
 					"columnNum": 34
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP March Update Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_MARCH_UPDATE_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 177,
 					"offsetEnd": 177,
 					"columnNum": 35
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP McKinney-Vento (Homeless) Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_MCKINNEY-VENTO_(HOMELESS)_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 178,
 					"offsetEnd": 178,
 					"columnNum": 36
 				},
 				"fieldLength": 1,
 				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Education Classification Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_EDUCATION_CLASSIFICATION_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 179,
 					"offsetEnd": 179,
 					"columnNum": 37
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Hispanic/Latino",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_HISPANIC/LATINO",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 180,
 					"offsetEnd": 180,
 					"columnNum": 38
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP American Indian or Alaska Native",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_AMERICAN_INDIAN_OR_ALASKA_NATIVE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 181,
 					"offsetEnd": 181,
 					"columnNum": 39
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Asian",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_ASIAN",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 182,
 					"offsetEnd": 182,
 					"columnNum": 40
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Black or African American",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_BLACK_OR_AFRICAN_AMERICAN",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 183,
 					"offsetEnd": 183,
 					"columnNum": 41
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Native Hawaiian or Other Pacific Islander",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 184,
 					"offsetEnd": 184,
 					"columnNum": 42
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP White",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_WHITE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 185,
 					"offsetEnd": 185,
 					"columnNum": 43
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Grade Placement",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_GRADE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 186,
 					"offsetEnd": 187,
 					"columnNum": 44
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Option Code FILLER",
 				"otherPossibleNames": [],
 				"logicalName": "FILLER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 188,
 					"offsetEnd": 188,
 					"columnNum": 45
 				},
 				"fieldLength": 1,
 				"expectedValues": [" "],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Education Classification",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 189,
 					"offsetEnd": 189,
 					"columnNum": 46
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Gifted ",
 				"otherPossibleNames": [],
 				"logicalName": "GIFTED_",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 190,
 					"offsetEnd": 190,
 					"columnNum": 47
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Talented",
 				"otherPossibleNames": [],
 				"logicalName": "TALENTED",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 191,
 					"offsetEnd": 191,
 					"columnNum": 48
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Autism",
 				"otherPossibleNames": [],
 				"logicalName": "AUTISM",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 192,
 					"offsetEnd": 192,
 					"columnNum": 49
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Deafblindness",
 				"otherPossibleNames": [],
 				"logicalName": "DEAFBLINDNESS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 193,
 					"offsetEnd": 193,
 					"columnNum": 50
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Developmental Delay",
 				"otherPossibleNames": [],
 				"logicalName": "DEVELOPMENTAL_DELAY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 194,
 					"offsetEnd": 194,
 					"columnNum": 51
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Emotional Disturbance",
 				"otherPossibleNames": [],
 				"logicalName": "EMOTIONAL_DISTURBANCE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 195,
 					"offsetEnd": 195,
 					"columnNum": 52
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "HI-Deaf",
 				"otherPossibleNames": [],
 				"logicalName": "HI-DEAF",
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
 				"scale": null
 			},
 			{
 				"physicalName": "HI-Hard of Hearing",
 				"otherPossibleNames": [],
 				"logicalName": "HI-HARD_OF_HEARING",
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
 				"scale": null
 			},
 			{
 				"physicalName": "Mild Mental Disability",
 				"otherPossibleNames": [],
 				"logicalName": "MILD_MENTAL_DISABILITY",
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
 				"scale": null
 			},
 			{
 				"physicalName": "Moderate Mental Disability",
 				"otherPossibleNames": [],
 				"logicalName": "MODERATE_MENTAL_DISABILITY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 199,
 					"offsetEnd": 199,
 					"columnNum": 56
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Orthopedic Impairment",
 				"otherPossibleNames": [],
 				"logicalName": "ORTHOPEDIC_IMPAIRMENT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 200,
 					"offsetEnd": 200,
 					"columnNum": 57
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Other Health Impairment",
 				"otherPossibleNames": [],
 				"logicalName": "OTHER_HEALTH_IMPAIRMENT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 201,
 					"offsetEnd": 201,
 					"columnNum": 58
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Specific Learning Disability",
 				"otherPossibleNames": [],
 				"logicalName": "SPECIFIC_LEARNING_DISABILITY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 202,
 					"offsetEnd": 202,
 					"columnNum": 59
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Speech or Language Impairment",
 				"otherPossibleNames": [],
 				"logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 203,
 					"offsetEnd": 203,
 					"columnNum": 60
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Traumatic Brain Injury        ",
 				"otherPossibleNames": [],
 				"logicalName": "TRAUMATIC_BRAIN_INJURY________",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 204,
 					"offsetEnd": 204,
 					"columnNum": 61
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Visual Impairment",
 				"otherPossibleNames": [],
 				"logicalName": "VISUAL_IMPAIRMENT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 205,
 					"offsetEnd": 205,
 					"columnNum": 62
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Other (Multiple Disabilities, Severe Mental Disability)                                                                                                                                                                                                                                                                                                                                                              ",
 				"otherPossibleNames": [],
 				"logicalName": "OTHER_(MULTIPLE_DISABILITIES,_SEVERE_MENTAL_DISABILITY)",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 206,
 					"offsetEnd": 206,
 					"columnNum": 63
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
 					"offsetStart": 207,
 					"offsetEnd": 221,
 					"columnNum": 64
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
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
 					"columnNum": 65
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
 					"offsetStart": 223,
 					"offsetEnd": 223,
 					"columnNum": 66
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
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
 					"columnNum": 67
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 225,
 					"offsetEnd": 225,
 					"columnNum": 68
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
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
 					"columnNum": 69
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
 					"offsetStart": 227,
 					"offsetEnd": 227,
 					"columnNum": 70
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 228,
 					"offsetEnd": 228,
 					"columnNum": 71
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 229,
 					"offsetEnd": 229,
 					"columnNum": 72
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
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
 					"columnNum": 73
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Tests Read Aloud",
 				"otherPossibleNames": [],
 				"logicalName": "TESTS_READ_ALOUD",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 231,
 					"offsetEnd": 231,
 					"columnNum": 74
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
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
 					"columnNum": 75
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Content-Based ESL",
 				"otherPossibleNames": [],
 				"logicalName": "CONTENT-BASED_ESL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 233,
 					"offsetEnd": 233,
 					"columnNum": 76
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Pull-out ESL",
 				"otherPossibleNames": [],
 				"logicalName": "PULL-OUT_ESL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 234,
 					"offsetEnd": 234,
 					"columnNum": 77
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Dual language",
 				"otherPossibleNames": [],
 				"logicalName": "DUAL_LANGUAGE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 235,
 					"offsetEnd": 235,
 					"columnNum": 78
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Transitional bilingual",
 				"otherPossibleNames": [],
 				"logicalName": "TRANSITIONAL_BILINGUAL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 236,
 					"offsetEnd": 236,
 					"columnNum": 79
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Developmental bilingual",
 				"otherPossibleNames": [],
 				"logicalName": "DEVELOPMENTAL_BILINGUAL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 237,
 					"offsetEnd": 237,
 					"columnNum": 80
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Sheltered English instruction",
 				"otherPossibleNames": [],
 				"logicalName": "SHELTERED_ENGLISH_INSTRUCTION",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 238,
 					"offsetEnd": 238,
 					"columnNum": 81
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Structured English immersion",
 				"otherPossibleNames": [],
 				"logicalName": "STRUCTURED_ENGLISH_IMMERSION",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 239,
 					"offsetEnd": 239,
 					"columnNum": 82
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Other",
 				"otherPossibleNames": [],
 				"logicalName": "OTHER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 240,
 					"offsetEnd": 240,
 					"columnNum": 83
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Did not participate",
 				"otherPossibleNames": [],
 				"logicalName": "DID_NOT_PARTICIPATE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 241,
 					"offsetEnd": 241,
 					"columnNum": 84
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Gender",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_GENDER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 242,
 					"offsetEnd": 242,
 					"columnNum": 85
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
 					"offsetStart": 243,
 					"offsetEnd": 247,
 					"columnNum": 86
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Section 504 Status",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_SECTION_504_STATUS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 248,
 					"offsetEnd": 248,
 					"columnNum": 87
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "No Accommodations",
 				"otherPossibleNames": [],
 				"logicalName": "NO_ACCOMMODATIONS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 249,
 					"offsetEnd": 249,
 					"columnNum": 88
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
 					"offsetStart": 250,
 					"offsetEnd": 250,
 					"columnNum": 89
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Large Print",
 				"otherPossibleNames": [],
 				"logicalName": "LARGE_PRINT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 251,
 					"offsetEnd": 251,
 					"columnNum": 90
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 252,
 					"offsetEnd": 252,
 					"columnNum": 91
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Assistive Technology",
 				"otherPossibleNames": [],
 				"logicalName": "ASSISTIVE_TECHNOLOGY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 253,
 					"offsetEnd": 253,
 					"columnNum": 92
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
 					"offsetStart": 254,
 					"offsetEnd": 254,
 					"columnNum": 93
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 255,
 					"offsetEnd": 255,
 					"columnNum": 94
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 256,
 					"offsetEnd": 256,
 					"columnNum": 95
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Individual/Small Group Administration",
 				"otherPossibleNames": [],
 				"logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 257,
 					"offsetEnd": 257,
 					"columnNum": 96
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Tests Read Aloud",
 				"otherPossibleNames": [],
 				"logicalName": "TESTS_READ_ALOUD",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 258,
 					"offsetEnd": 258,
 					"columnNum": 97
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Other",
 				"otherPossibleNames": [],
 				"logicalName": "OTHER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 259,
 					"offsetEnd": 259,
 					"columnNum": 98
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
 					"offsetStart": 260,
 					"offsetEnd": 265,
 					"columnNum": 99
 				},
 				"fieldLength": 6,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Nonparticipation Codes",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_NONPARTICIPATION_CODES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 266,
 					"offsetEnd": 266,
 					"columnNum": 100
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Hispanic/Latino",
 				"otherPossibleNames": [],
 				"logicalName": "HISPANIC/LATINO",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 267,
 					"offsetEnd": 267,
 					"columnNum": 101
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
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
 					"offsetStart": 268,
 					"offsetEnd": 268,
 					"columnNum": 102
 				},
 				"fieldLength": 1,
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
 					"offsetStart": 269,
 					"offsetEnd": 269,
 					"columnNum": 103
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Black or African American",
 				"otherPossibleNames": [],
 				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 270,
 					"offsetEnd": 270,
 					"columnNum": 104
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Native Hawaiian or Other Pacific Islander",
 				"otherPossibleNames": [],
 				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 271,
 					"offsetEnd": 271,
 					"columnNum": 105
 				},
 				"fieldLength": 1,
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
 					"offsetStart": 272,
 					"offsetEnd": 272,
 					"columnNum": 106
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled McKinney-Vento Act (Homeless)",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 273,
 					"offsetEnd": 273,
 					"columnNum": 107
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Born in U.S.?",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_BORN_IN_U.S.?",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 274,
 					"offsetEnd": 274,
 					"columnNum": 108
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Birth country code",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_BIRTH_COUNTRY_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 275,
 					"offsetEnd": 276,
 					"columnNum": 109
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP US entry date - Month",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_DATE_OF_ENTRY_INTO_US_-_MONTH",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 277,
 					"offsetEnd": 278,
 					"columnNum": 110
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP US entry date - Day",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_DATE_OF_ENTRY_INTO_US_-_DAY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 279,
 					"offsetEnd": 280,
 					"columnNum": 111
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP US entry date - Year",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_DATE_OF_ENTRY_INTO_US_-_YEAR",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 281,
 					"offsetEnd": 284,
 					"columnNum": 112
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Date of Entry into US - Month",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_DATE_OF_ENTRY_INTO_US_-_MONTH",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 285,
 					"offsetEnd": 286,
 					"columnNum": 113
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Date of Entry into US - Year",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_DATE_OF_ENTRY_INTO_US_-_YEAR",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 287,
 					"offsetEnd": 290,
 					"columnNum": 114
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Date of Entry into US - Month",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_DATE_OF_ENTRY_INTO_US_-_MONTH",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 291,
 					"offsetEnd": 292,
 					"columnNum": 115
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Date of Entry into US - Year",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_DATE_OF_ENTRY_INTO_US_-_YEAR",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 293,
 					"offsetEnd": 296,
 					"columnNum": 116
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Unable to Locate Information",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_UNABLE_TO_LOCATE_INFORMATION",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 297,
 					"offsetEnd": 297,
 					"columnNum": 117
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Time Student Enrolled in US School",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_TIME_STUDENT_ENROLLED_IN_US_SCHOOL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 298,
 					"offsetEnd": 298,
 					"columnNum": 118
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
 					"offsetStart": 299,
 					"offsetEnd": 299,
 					"columnNum": 119
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Section 504 Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_SECTION_504_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 300,
 					"offsetEnd": 300,
 					"columnNum": 120
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP LEP Funding Code",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_LEP_FUNDING_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 301,
 					"offsetEnd": 302,
 					"columnNum": 121
 				},
 				"fieldLength": 2,
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
 					"offsetStart": 303,
 					"offsetEnd": 304,
 					"columnNum": 122
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Time Student Has Received Services in Specialized Language Program",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_TIME_STUDENT_HAS_RECEIVED_SERVICES_IN_SPECIALIZED_LANGUAGE_PROGRAM",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 305,
 					"offsetEnd": 305,
 					"columnNum": 123
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Special Education Exceptionality Category",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 306,
 					"offsetEnd": 307,
 					"columnNum": 124
 				},
 				"fieldLength": 2,
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
 					"offsetStart": 308,
 					"offsetEnd": 322,
 					"columnNum": 125
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Primary Exceptionality",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_PRIMARY_EXCEPTIONALITY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 323,
 					"offsetEnd": 324,
 					"columnNum": 126
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Exceptionality  Category",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_EXCEPTIONALITY__CATEGORY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 325,
 					"offsetEnd": 326,
 					"columnNum": 127
 				},
 				"fieldLength": 2,
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
 					"offsetStart": 327,
 					"offsetEnd": 341,
 					"columnNum": 128
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized  Education  Classification",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED__EDUCATION__CLASSIFICATION",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 342,
 					"offsetEnd": 342,
 					"columnNum": 129
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Section 504 Status",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_SECTION_504",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 343,
 					"offsetEnd": 343,
 					"columnNum": 130
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
 					"offsetStart": 344,
 					"offsetEnd": 358,
 					"columnNum": 131
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Reading Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "READING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 359,
 					"offsetEnd": 538,
 					"columnNum": 132
 				},
 				"fieldLength": 180,
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
 					"offsetEnd": 553,
 					"columnNum": 133
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Writing Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "WRITING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 554,
 					"offsetEnd": 733,
 					"columnNum": 134
 				},
 				"fieldLength": 180,
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
 					"offsetStart": 734,
 					"offsetEnd": 748,
 					"columnNum": 135
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Listening Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "LISTENING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 749,
 					"offsetEnd": 928,
 					"columnNum": 136
 				},
 				"fieldLength": 180,
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
 					"offsetStart": 929,
 					"offsetEnd": 943,
 					"columnNum": 137
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Teacher Scored Speaking Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "TEACHER_SCORED_SPEAKING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 944,
 					"offsetEnd": 959,
 					"columnNum": 138
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
 					"offsetStart": 960,
 					"offsetEnd": 974,
 					"columnNum": 139
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "K-2 Inventory Reading Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "K-2_INVENTORY_READING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 975,
 					"offsetEnd": 988,
 					"columnNum": 140
 				},
 				"fieldLength": 14,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "K-2 Inventory Writing Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "K-2_INVENTORY_WRITING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 989,
 					"offsetEnd": 997,
 					"columnNum": 141
 				},
 				"fieldLength": 9,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "K-2 Inventory Listening Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "K-2_INVENTORY_LISTENING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 998,
 					"offsetEnd": 1004,
 					"columnNum": 142
 				},
 				"fieldLength": 7,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "K-2 Inventory Speaking Item Responses",
 				"otherPossibleNames": [],
 				"logicalName": "K-2_INVENTORY_SPEAKING_ITEM_RESPONSES",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1005,
 					"offsetEnd": 1012,
 					"columnNum": 143
 				},
 				"fieldLength": 8,
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
 					"offsetStart": 1013,
 					"offsetEnd": 1027,
 					"columnNum": 144
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Raw Score Total - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "RAW_SCORE_RD",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1028,
 					"offsetEnd": 1030,
 					"columnNum": 145
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Scaled Score - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "SCALED_SCORE_RD",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1031,
 					"offsetEnd": 1033,
 					"columnNum": 146
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Proficiency Level - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "PROFICIENCY_LEVEL_RD",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1034,
 					"offsetEnd": 1034,
 					"columnNum": 147
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
 					"offsetStart": 1035,
 					"offsetEnd": 1039,
 					"columnNum": 148
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Raw Score Total - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "RAW_SCORE_WT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1040,
 					"offsetEnd": 1042,
 					"columnNum": 149
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Scaled Score - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "SCALED_SCORE_WT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1043,
 					"offsetEnd": 1045,
 					"columnNum": 150
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Proficiency Level  - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "PROFICIENCY_LEVEL_WT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1046,
 					"offsetEnd": 1046,
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
 					"offsetStart": 1047,
 					"offsetEnd": 1051,
 					"columnNum": 152
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Raw Score Total - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "RAW_SCORE_LIS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1052,
 					"offsetEnd": 1054,
 					"columnNum": 153
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Scaled Score - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "SCALED_SCORE_LIS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1055,
 					"offsetEnd": 1057,
 					"columnNum": 154
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Proficiency Level - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "PROFICIENCY_LEVEL_LIS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1058,
 					"offsetEnd": 1058,
 					"columnNum": 155
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
 					"offsetStart": 1059,
 					"offsetEnd": 1063,
 					"columnNum": 156
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Raw Score Total - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "RAW_SCORE_SPK",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1064,
 					"offsetEnd": 1066,
 					"columnNum": 157
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Scaled Score - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "SCALED_SCORE_SPK",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1067,
 					"offsetEnd": 1069,
 					"columnNum": 158
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Proficiency Level - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "PROFICIENCY_LEVEL_SPK",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1070,
 					"offsetEnd": 1070,
 					"columnNum": 159
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
 					"offsetStart": 1071,
 					"offsetEnd": 1075,
 					"columnNum": 160
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Production Level",
 				"otherPossibleNames": [],
 				"logicalName": "PRODUCTION_LEVEL_OVERALL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1076,
 					"offsetEnd": 1076,
 					"columnNum": 161
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Comprehension Level",
 				"otherPossibleNames": [],
 				"logicalName": "COMPREHENSION_LEVEL_OVERALL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1077,
 					"offsetEnd": 1077,
 					"columnNum": 162
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Composite Level",
 				"otherPossibleNames": [],
 				"logicalName": "COMPOSITE_LEVEL_OVERALL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1078,
 					"offsetEnd": 1078,
 					"columnNum": 163
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Composite Score",
 				"otherPossibleNames": [],
 				"logicalName": "COMPOSITE_SCORE_OVERALL",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1079,
 					"offsetEnd": 1081,
 					"columnNum": 164
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
 					"offsetStart": 1082,
 					"offsetEnd": 1093,
 					"columnNum": 165
 				},
 				"fieldLength": 12,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "MC / CR Taken - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "WRITING_MC_/_CR_TAKEN",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1094,
 					"offsetEnd": 1094,
 					"columnNum": 166
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Handscoring Complete Flag - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "HANDSCORING_COMPLETE_FLAG_-_WRITING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1095,
 					"offsetEnd": 1095,
 					"columnNum": 167
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
 					"offsetStart": 1096,
 					"offsetEnd": 1099,
 					"columnNum": 168
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Void Flag - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_VOID_FLAG_-_READING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1100,
 					"offsetEnd": 1100,
 					"columnNum": 169
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Void Flag - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_VOID_FLAG_-_WRITING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1101,
 					"offsetEnd": 1101,
 					"columnNum": 170
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Void Flag - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_VOID_FLAG_-_LISTENING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1102,
 					"offsetEnd": 1102,
 					"columnNum": 171
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarized Void Flag - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZED_VOID_FLAG_-_SPEAKING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1103,
 					"offsetEnd": 1103,
 					"columnNum": 172
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
 					"offsetStart": 1104,
 					"offsetEnd": 1108,
 					"columnNum": 173
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Plagiarism Void Flag - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "PLAGIARISM_VOID_FLAG_-_READING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1109,
 					"offsetEnd": 1109,
 					"columnNum": 174
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Plagiarism Void Flag - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "PLAGIARISM_VOID_FLAG_-_WRITING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1110,
 					"offsetEnd": 1110,
 					"columnNum": 175
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Plagiarism Void Flag - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "PLAGIARISM_VOID_FLAG_-_LISTENING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1111,
 					"offsetEnd": 1111,
 					"columnNum": 176
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Plagiarism Void Flag - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "PLAGIARISM_VOID_FLAG_-_SPEAKING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1112,
 					"offsetEnd": 1112,
 					"columnNum": 177
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
 					"offsetStart": 1113,
 					"offsetEnd": 1122,
 					"columnNum": 178
 				},
 				"fieldLength": 10,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Included in N-counts - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "INCLUDED_IN_N-COUNTS_-_READING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1123,
 					"offsetEnd": 1123,
 					"columnNum": 179
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Included in N-counts - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "INCLUDED_IN_N-COUNTS_-_WRITING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1124,
 					"offsetEnd": 1124,
 					"columnNum": 180
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Included in N-counts - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "INCLUDED_IN_N-COUNTS_-_LISTENING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1125,
 					"offsetEnd": 1125,
 					"columnNum": 181
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Included in N-counts - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "INCLUDED_IN_N-COUNTS_-_SPEAKING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1126,
 					"offsetEnd": 1126,
 					"columnNum": 182
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
 					"offsetStart": 1127,
 					"offsetEnd": 1131,
 					"columnNum": 183
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Test Taken Flag - Reading",
 				"otherPossibleNames": [],
 				"logicalName": "TEST_TAKEN_FLAG_-_READING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1132,
 					"offsetEnd": 1132,
 					"columnNum": 184
 				},
 				"fieldLength": 1,
 				"expectedValues": ["Y", "N"],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Test Taken Flag - Writing",
 				"otherPossibleNames": [],
 				"logicalName": "TEST_TAKEN_FLAG_-_WRITING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1133,
 					"offsetEnd": 1133,
 					"columnNum": 185
 				},
 				"fieldLength": 1,
 				"expectedValues": ["Y", "N"],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Test Taken Flag - Listening",
 				"otherPossibleNames": [],
 				"logicalName": "TEST_TAKEN_FLAG_-_LISTENING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1134,
 					"offsetEnd": 1134,
 					"columnNum": 186
 				},
 				"fieldLength": 1,
 				"expectedValues": ["Y", "N"],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Test Taken Flag - Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "TEST_TAKEN_FLAG_-_SPEAKING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1135,
 					"offsetEnd": 1135,
 					"columnNum": 187
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
 					"offsetStart": 1136,
 					"offsetEnd": 1140,
 					"columnNum": 188
 				},
 				"fieldLength": 5,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Assess Group Type",
 				"otherPossibleNames": [],
 				"logicalName": "ASSESS_GROUP_TYPE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1141,
 					"offsetEnd": 1142,
 					"columnNum": 189
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Charter Type",
 				"otherPossibleNames": [],
 				"logicalName": "CHARTER_TYPE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1143,
 					"offsetEnd": 1143,
 					"columnNum": 190
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
 					"offsetStart": 1144,
 					"offsetEnd": 1147,
 					"columnNum": 191
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Twin Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_TWIN_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1148,
 					"offsetEnd": 1148,
 					"columnNum": 192
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Scholarship Student Flag",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_SCHOLARSHIP_STUDENT_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1149,
 					"offsetEnd": 1149,
 					"columnNum": 193
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
 					"offsetStart": 1150,
 					"offsetEnd": 1158,
 					"columnNum": 194
 				},
 				"fieldLength": 9,
 				"expectedValues": [],
 				"dataTypes": "STRING",
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
 					"offsetStart": 1159,
 					"offsetEnd": 1159,
 					"columnNum": 195
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summarize to Assessment Group Code for district level reporting",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARIZE_TO_ASSESSMENT_GROUP_CODE_FOR_DISTRICT_LEVEL_REPORTING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1160,
 					"offsetEnd": 1160,
 					"columnNum": 196
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Show 'N/A' in place of district results on school reports",
 				"otherPossibleNames": [],
 				"logicalName": "SHOW_'N/A'_IN_PLACE_OF_DISTRICT_RESULTS_ON_SCHOOL_REPORTS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1161,
 					"offsetEnd": 1161,
 					"columnNum": 197
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Schools summarized to LEA Code for district level reporting",
 				"otherPossibleNames": [],
 				"logicalName": "SCHOOLS_SUMMARIZED_TO_LEA_CODE_FOR_DISTRICT_LEVEL_REPORTING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1162,
 					"offsetEnd": 1162,
 					"columnNum": 198
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "District reports go to district",
 				"otherPossibleNames": [],
 				"logicalName": "DISTRICT_REPORTS_GO_TO_DISTRICT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1163,
 					"offsetEnd": 1163,
 					"columnNum": 199
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "District report goes to LDE",
 				"otherPossibleNames": [],
 				"logicalName": "DISTRICT_REPORT_GOES_TO_LDE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1164,
 					"offsetEnd": 1164,
 					"columnNum": 200
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Summary Reports",
 				"otherPossibleNames": [],
 				"logicalName": "SUMMARY_REPORTS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1165,
 					"offsetEnd": 1165,
 					"columnNum": 201
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Roster Reports",
 				"otherPossibleNames": [],
 				"logicalName": "ROSTER_REPORTS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1166,
 					"offsetEnd": 1166,
 					"columnNum": 202
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Student Reports",
 				"otherPossibleNames": [],
 				"logicalName": "STUDENT_REPORTS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1167,
 					"offsetEnd": 1167,
 					"columnNum": 203
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
 					"offsetStart": 1168,
 					"offsetEnd": 1183,
 					"columnNum": 204
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
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
 					"offsetStart": 1184,
 					"offsetEnd": 1184,
 					"columnNum": 205
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Student Report ",
 				"otherPossibleNames": [],
 				"logicalName": "STUDENT_REPORT_",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1185,
 					"offsetEnd": 1185,
 					"columnNum": 206
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
 					"offsetStart": 1186,
 					"offsetEnd": 1201,
 					"columnNum": 207
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Footnote:  Test Security Violation (Void) Reading",
 				"otherPossibleNames": [],
 				"logicalName": "FOOTNOTE:__TEST_SECURITY_VIOLATION_(VOID)_READING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1202,
 					"offsetEnd": 1202,
 					"columnNum": 208
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
 					"offsetStart": 1203,
 					"offsetEnd": 1217,
 					"columnNum": 209
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Footnote:  Test Security Violation (Void) Writing",
 				"otherPossibleNames": [],
 				"logicalName": "FOOTNOTE:__TEST_SECURITY_VIOLATION_(VOID)_WRITING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1218,
 					"offsetEnd": 1218,
 					"columnNum": 210
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
 					"offsetStart": 1219,
 					"offsetEnd": 1233,
 					"columnNum": 211
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Footnote:  Test Security Violation (Void) Listening",
 				"otherPossibleNames": [],
 				"logicalName": "FOOTNOTE:__TEST_SECURITY_VIOLATION_(VOID)_LISTENING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1234,
 					"offsetEnd": 1234,
 					"columnNum": 212
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
 					"offsetStart": 1235,
 					"offsetEnd": 1249,
 					"columnNum": 213
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Footnote:  Test Security Violation (Void) Speaking",
 				"otherPossibleNames": [],
 				"logicalName": "FOOTNOTE:__TEST_SECURITY_VIOLATION_(VOID)_SPEAKING",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1250,
 					"offsetEnd": 1250,
 					"columnNum": 214
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Document Type Returned",
 				"otherPossibleNames": [],
 				"logicalName": "DOCUMENT_TYPE_RETURNED",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1251,
 					"offsetEnd": 1251,
 					"columnNum": 215
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
 					"offsetStart": 1252,
 					"offsetEnd": 1259,
 					"columnNum": 216
 				},
 				"fieldLength": 8,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Batch Number",
 				"otherPossibleNames": [],
 				"logicalName": "BATCH_NUMBER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1260,
 					"offsetEnd": 1267,
 					"columnNum": 217
 				},
 				"fieldLength": 8,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Serial Number",
 				"otherPossibleNames": [],
 				"logicalName": "SERIAL_NUMBER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1268,
 					"offsetEnd": 1273,
 					"columnNum": 218
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
 					"offsetStart": 1274,
 					"offsetEnd": 1283,
 					"columnNum": 219
 				},
 				"fieldLength": 10,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Lithocode",
 				"otherPossibleNames": [],
 				"logicalName": "LITHOCODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1284,
 					"offsetEnd": 1290,
 					"columnNum": 220
 				},
 				"fieldLength": 7,
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
 					"offsetStart": 1291,
 					"offsetEnd": 1291,
 					"columnNum": 221
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
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
 					"offsetStart": 1292,
 					"offsetEnd": 1297,
 					"columnNum": 222
 				},
 				"fieldLength": 6,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Home-base Site District Code",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_HOME-BASE_SITE_DISTRICT_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1298,
 					"offsetEnd": 1300,
 					"columnNum": 223
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "LAP Home-base Site School Code",
 				"otherPossibleNames": [],
 				"logicalName": "LAP_HOME-BASE_SITE_SCHOOL_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1301,
 					"offsetEnd": 1303,
 					"columnNum": 224
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
 					"offsetStart": 1304,
 					"offsetEnd": 1304,
 					"columnNum": 225
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Security Barcode Number",
 				"otherPossibleNames": [],
 				"logicalName": "SECURITY_BARCODE_NUMBER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1305,
 					"offsetEnd": 1312,
 					"columnNum": 226
 				},
 				"fieldLength": 8,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Updated Nonparticipation Code - Reading ",
 				"otherPossibleNames": [],
 				"logicalName": "UPDATED_READING_NON-PARTICIPATION_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1313,
 					"offsetEnd": 1314,
 					"columnNum": 227
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Updated Nonparticipation Code - Writing ",
 				"otherPossibleNames": [],
 				"logicalName": "UPDATED_WRITING_NON-PARTICIPATION_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1315,
 					"offsetEnd": 1316,
 					"columnNum": 228
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Updated Nonparticipation Code - Listening ",
 				"otherPossibleNames": [],
 				"logicalName": "UPDATED_LISTENING_NON-PARTICIPATION_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1317,
 					"offsetEnd": 1318,
 					"columnNum": 229
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Updated Nonparticipation Code - Speaking ",
 				"otherPossibleNames": [],
 				"logicalName": "UPDATED_SPEAKING_NON-PARTICIPATION_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1319,
 					"offsetEnd": 1320,
 					"columnNum": 230
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "Bubbled Test Administrator Number",
 				"otherPossibleNames": [],
 				"logicalName": "BUBBLED_TA_NUMBER",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1321,
 					"offsetEnd": 1323,
 					"columnNum": 231
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
 					"offsetStart": 1324,
 					"offsetEnd": 1343,
 					"columnNum": 232
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
 					"offsetStart": 1344,
 					"offsetEnd": 1363,
 					"columnNum": 233
 				},
 				"fieldLength": 20,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "File Creation Date and Time Stamp",
 				"otherPossibleNames": [],
 				"logicalName": "FILE_CREATION_DATE_AND_TIME_STAMP",
 				"formatMask": "yyyy-MM-dd HH:MM:SS",
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1364,
 					"offsetEnd": 1382,
 					"columnNum": 234
 				},
 				"fieldLength": 19,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			}
 		]
 	},
 	"fileExtensions": [".txt",".dat"]
 }