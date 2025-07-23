{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "SAT_1415_FIXEDWIDTH",
		"recordLength": 1174,
		"naturalKey": [],
		"fields": [{
				"physicalName": "College Code",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 6,
					"columnNum": 1
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 21,
					"columnNum": 2
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "First Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 22,
					"offsetEnd": 33,
					"columnNum": 3
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 34,
					"offsetEnd": 34,
					"columnNum": 4
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Sex",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 35,
					"offsetEnd": 35,
					"columnNum": 5
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "0", ""],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 36,
					"offsetEnd": 41,
					"columnNum": 6
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "Social Security Number",
				"otherPossibleNames": [],
				"logicalName": "SSN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 42,
					"offsetEnd": 50,
					"columnNum": 7
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Street Address",
				"otherPossibleNames": [],
				"logicalName": "STREET_ADDRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 51,
					"offsetEnd": 75,
					"columnNum": 8
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "City",
				"otherPossibleNames": [],
				"logicalName": "CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 76,
					"offsetEnd": 90,
					"columnNum": 9
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 91,
					"offsetEnd": 91,
					"columnNum": 10
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "State",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 92,
					"offsetEnd": 93,
					"columnNum": 11
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 94,
					"columnNum": 12
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Zip Code + 4",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_ZIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 95,
					"offsetEnd": 103,
					"columnNum": 13
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 104,
					"offsetEnd": 106,
					"columnNum": 14
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Residence Code",
				"otherPossibleNames": [],
				"logicalName": "RESIDENCE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 107,
					"offsetEnd": 111,
					"columnNum": 15
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 112,
					"offsetEnd": 116,
					"columnNum": 16
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Country",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_COUNTRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 92,
					"offsetEnd": 116,
					"columnNum": 17
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Telephone Number",
				"otherPossibleNames": [],
				"logicalName": "TELEPHONE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 126,
					"columnNum": 18
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "H.S. Graduation Date",
				"otherPossibleNames": [],
				"logicalName": "PROJ_GRAD_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 127,
					"offsetEnd": 130,
					"columnNum": 19
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "EPS Market",
				"otherPossibleNames": [],
				"logicalName": "SAA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 131,
					"offsetEnd": 134,
					"columnNum": 20
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Foreign Address Indicator",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_ADDRESS_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 135,
					"offsetEnd": 135,
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 136,
					"offsetEnd": 139,
					"columnNum": 22
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Test Date",
				"otherPossibleNames": [],
				"logicalName": "LATEST_ASSESSMENT_DATE",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 140,
					"offsetEnd": 147,
					"columnNum": 23
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "Educational Level",
				"otherPossibleNames": [],
				"logicalName": "LATEST_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 148,
					"offsetEnd": 148,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "9", "0"],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 149,
					"offsetEnd": 149,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Revised Score Indicator",
				"otherPossibleNames": [],
				"logicalName": "REVISED_SCORE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 150,
					"offsetEnd": 150,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Critical Reading Score",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 151,
					"offsetEnd": 153,
					"columnNum": 27
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Math Score",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 154,
					"offsetEnd": 156,
					"columnNum": 28
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Writing Score",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 159,
					"columnNum": 29
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Essay Subscore",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 160,
					"offsetEnd": 161,
					"columnNum": 30
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Multiple-Choice Subscore",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 162,
					"offsetEnd": 163,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Scores Admin. 2",
				"otherPossibleNames": [],
				"logicalName": "SAT_SCORES_ADMIN_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 187,
					"columnNum": 32
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Scores Admin. 3",
				"otherPossibleNames": [],
				"logicalName": "SAT_SCORES_ADMIN_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 188,
					"offsetEnd": 211,
					"columnNum": 33
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Scores Admin. 4",
				"otherPossibleNames": [],
				"logicalName": "SAT_SCORES_ADMIN_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 212,
					"offsetEnd": 235,
					"columnNum": 34
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Scores Admin. 5",
				"otherPossibleNames": [],
				"logicalName": "SAT_SCORES_ADMIN_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 236,
					"offsetEnd": 259,
					"columnNum": 35
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Scores Admin. 6",
				"otherPossibleNames": [],
				"logicalName": "SAT_SCORES_ADMIN_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 260,
					"offsetEnd": 283,
					"columnNum": 36
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 284,
					"offsetEnd": 291,
					"columnNum": 37
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Educational Level",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 292,
					"offsetEnd": 292,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 293,
					"offsetEnd": 293,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Revised Score Indicator",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_REVISED_SCORE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 294,
					"offsetEnd": 294,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test Code",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 295,
					"offsetEnd": 296,
					"columnNum": 41
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test Score 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_SCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 297,
					"offsetEnd": 299,
					"columnNum": 42
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1 Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 300,
					"offsetEnd": 301,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1 Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 302,
					"offsetEnd": 303,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1 Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 304,
					"offsetEnd": 305,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test Code 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 306,
					"offsetEnd": 307,
					"columnNum": 46
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test Score 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_SCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 308,
					"offsetEnd": 310,
					"columnNum": 47
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2 Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 311,
					"offsetEnd": 312,
					"columnNum": 48
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2 Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 313,
					"offsetEnd": 314,
					"columnNum": 49
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2 Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 315,
					"offsetEnd": 316,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Code",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 317,
					"offsetEnd": 318,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Score",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 319,
					"offsetEnd": 321,
					"columnNum": 52
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 322,
					"offsetEnd": 323,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 324,
					"offsetEnd": 325,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 326,
					"offsetEnd": 327,
					"columnNum": 55
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Previous Subject Test Scores Admin. 2",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_SUBJECT_TEST_SCORES_ADMIN_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 328,
					"offsetEnd": 371,
					"columnNum": 56
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Previous Subject Test Scores Admin. 3",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_SUBJECT_TEST_SCORES_ADMIN_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 372,
					"offsetEnd": 415,
					"columnNum": 57
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Previous Subject Test Scores Admin. 4",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_SUBJECT_TEST_SCORES_ADMIN_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 416,
					"offsetEnd": 459,
					"columnNum": 58
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Previous Subject Test Scores Admin. 5",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_SUBJECT_TEST_SCORES_ADMIN_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 460,
					"offsetEnd": 503,
					"columnNum": 59
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Previous Subject Test Scores Admin. 6",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_SUBJECT_TEST_SCORES_ADMIN_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 504,
					"offsetEnd": 547,
					"columnNum": 60
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Latest SAT Essay ID",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 548,
					"offsetEnd": 557,
					"columnNum": 61
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Essay ID Admin. 2",
				"otherPossibleNames": [],
				"logicalName": "SAT_ESSAY_ID_ADMIN_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 558,
					"offsetEnd": 567,
					"columnNum": 62
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Essay ID Admin. 3",
				"otherPossibleNames": [],
				"logicalName": "SAT_ESSAY_ID_ADMIN_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 568,
					"offsetEnd": 577,
					"columnNum": 63
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Essay ID Admin. 4",
				"otherPossibleNames": [],
				"logicalName": "SAT_ESSAY_ID_ADMIN_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 578,
					"offsetEnd": 587,
					"columnNum": 64
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Essay ID Admin. 5",
				"otherPossibleNames": [],
				"logicalName": "SAT_ESSAY_ID_ADMIN_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 588,
					"offsetEnd": 597,
					"columnNum": 65
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Essay ID Admin. 6",
				"otherPossibleNames": [],
				"logicalName": "SAT_ESSAY_ID_ADMIN_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 598,
					"offsetEnd": 607,
					"columnNum": 66
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 608,
					"offsetEnd": 614,
					"columnNum": 67
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Critical Reading National College-Bound Percentile",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 615,
					"offsetEnd": 616,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Critical Reading State College-Bound Percentile",
				"otherPossibleNames": [],
				"logicalName": "CR_STATE_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 617,
					"offsetEnd": 618,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Mathematics National College-Bound Percentile",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 619,
					"offsetEnd": 620,
					"columnNum": 70
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Mathematics State College-Bound Percentile",
				"otherPossibleNames": [],
				"logicalName": "M_STATE_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 621,
					"offsetEnd": 622,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Writing National College-Bound Percentile",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 623,
					"offsetEnd": 624,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Writing State College-Bound Percentile",
				"otherPossibleNames": [],
				"logicalName": "W_STATE_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 625,
					"offsetEnd": 626,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Email Address",
				"otherPossibleNames": [],
				"logicalName": "EMAIL_ADDRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 627,
					"offsetEnd": 676,
					"columnNum": 74
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 677,
					"offsetEnd": 678,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1 Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 679,
					"offsetEnd": 680,
					"columnNum": 76
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1 Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 681,
					"offsetEnd": 682,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 1 Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_1_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 683,
					"offsetEnd": 684,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 685,
					"offsetEnd": 686,
					"columnNum": 79
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2 Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 687,
					"offsetEnd": 688,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2 Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 689,
					"offsetEnd": 690,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 2 Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_2_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 692,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 693,
					"offsetEnd": 694,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 695,
					"offsetEnd": 696,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 697,
					"offsetEnd": 698,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Subject Test 3 Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT_TEST_3_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 699,
					"offsetEnd": 700,
					"columnNum": 86
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 701,
					"offsetEnd": 710,
					"columnNum": 87
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Activity Date",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 711,
					"offsetEnd": 714,
					"columnNum": 88
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Total Years Studied/Honors",
				"otherPossibleNames": [],
				"logicalName": "TOTAL_YEARS_STUDIED_HONORS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 715,
					"offsetEnd": 726,
					"columnNum": 89
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Arts and Music",
				"otherPossibleNames": [],
				"logicalName": "ARTS_AND_MUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 715,
					"offsetEnd": 716,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "English",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 717,
					"offsetEnd": 718,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Foreign and Classical Languages",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_AND_CLASSICAL_LANGUAGES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 719,
					"offsetEnd": 720,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Mathematics",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 721,
					"offsetEnd": 722,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Natural Sciences",
				"otherPossibleNames": [],
				"logicalName": "NATURAL_SCIENCES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 723,
					"offsetEnd": 724,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Social Sciences and History",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_SCIENCES_AND_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 725,
					"offsetEnd": 726,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Foreign/Classical Languages Years",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_CLASSICAL_LANGUAGES_YEARS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 727,
					"offsetEnd": 750,
					"columnNum": 96
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chinese",
				"otherPossibleNames": [],
				"logicalName": "CHINESE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 727,
					"offsetEnd": 728,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French",
				"otherPossibleNames": [],
				"logicalName": "FRENCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 729,
					"offsetEnd": 730,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German",
				"otherPossibleNames": [],
				"logicalName": "GERMAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 731,
					"offsetEnd": 732,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Greek",
				"otherPossibleNames": [],
				"logicalName": "GREEK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 733,
					"offsetEnd": 734,
					"columnNum": 100
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Hebrew",
				"otherPossibleNames": [],
				"logicalName": "HEBREW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 735,
					"offsetEnd": 736,
					"columnNum": 101
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Italian",
				"otherPossibleNames": [],
				"logicalName": "ITALIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 737,
					"offsetEnd": 738,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Japanese",
				"otherPossibleNames": [],
				"logicalName": "JAPANESE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 739,
					"offsetEnd": 740,
					"columnNum": 103
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Korean",
				"otherPossibleNames": [],
				"logicalName": "KOREAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 741,
					"offsetEnd": 742,
					"columnNum": 104
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Latin",
				"otherPossibleNames": [],
				"logicalName": "LATIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 743,
					"offsetEnd": 744,
					"columnNum": 105
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Russian",
				"otherPossibleNames": [],
				"logicalName": "RUSSIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 745,
					"offsetEnd": 746,
					"columnNum": 106
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish",
				"otherPossibleNames": [],
				"logicalName": "SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 747,
					"offsetEnd": 748,
					"columnNum": 107
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Other Language Course",
				"otherPossibleNames": [],
				"logicalName": "OTHER_LANGUAGE_COURSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 749,
					"offsetEnd": 750,
					"columnNum": 108
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Mathematics Years",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_YEARS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 751,
					"offsetEnd": 764,
					"columnNum": 109
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 751,
					"offsetEnd": 752,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Geometry",
				"otherPossibleNames": [],
				"logicalName": "GEOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 753,
					"offsetEnd": 754,
					"columnNum": 111
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Trigonometry",
				"otherPossibleNames": [],
				"logicalName": "TRIGONOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 755,
					"offsetEnd": 756,
					"columnNum": 112
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Precalculus",
				"otherPossibleNames": [],
				"logicalName": "PRECALCULUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 758,
					"columnNum": 113
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Calculus",
				"otherPossibleNames": [],
				"logicalName": "CALCULUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 759,
					"offsetEnd": 760,
					"columnNum": 114
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Computer Math (no longer reported)",
				"otherPossibleNames": [],
				"logicalName": "COMPUTER_MATH_(NO_LONGER_REPORTED)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 761,
					"offsetEnd": 762,
					"columnNum": 115
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Other Math Course",
				"otherPossibleNames": [],
				"logicalName": "OTHER_MATH_COURSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 763,
					"offsetEnd": 764,
					"columnNum": 116
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Natural Sciences Years",
				"otherPossibleNames": [],
				"logicalName": "NATURAL_SCIENCES_YEARS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 765,
					"offsetEnd": 774,
					"columnNum": 117
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 765,
					"offsetEnd": 766,
					"columnNum": 118
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chemistry",
				"otherPossibleNames": [],
				"logicalName": "CHEMISTRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 767,
					"offsetEnd": 768,
					"columnNum": 119
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Environmental, Earth, or Space Science",
				"otherPossibleNames": [],
				"logicalName": "ENVIRONMENTAL,_EARTH,_OR_SPACE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 769,
					"offsetEnd": 770,
					"columnNum": 120
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Physics",
				"otherPossibleNames": [],
				"logicalName": "PHYSICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 771,
					"offsetEnd": 772,
					"columnNum": 121
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Other Science Course",
				"otherPossibleNames": [],
				"logicalName": "OTHER_SCIENCE_COURSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 773,
					"offsetEnd": 774,
					"columnNum": 122
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Social Sciences/History Years",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_SCIENCES_HISTORY_YEARS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 796,
					"columnNum": 123
				},
				"fieldLength": 22,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "U.S. History",
				"otherPossibleNames": [],
				"logicalName": "U.S._HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 776,
					"columnNum": 124
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "U.S. Gov’t/Civics",
				"otherPossibleNames": [],
				"logicalName": "U.S._GOV’T_CIVICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 778,
					"columnNum": 125
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "European History",
				"otherPossibleNames": [],
				"logicalName": "EUROPEAN_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 779,
					"offsetEnd": 780,
					"columnNum": 126
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "World History",
				"otherPossibleNames": [],
				"logicalName": "WORLD_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 782,
					"columnNum": 127
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Ancient History",
				"otherPossibleNames": [],
				"logicalName": "ANCIENT_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 783,
					"offsetEnd": 784,
					"columnNum": 128
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Anthropology (no longer reported)",
				"otherPossibleNames": [],
				"logicalName": "ANTHROPOLOGY_(NO_LONGER_REPORTED)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 785,
					"offsetEnd": 786,
					"columnNum": 129
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Economics",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 787,
					"offsetEnd": 788,
					"columnNum": 130
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Geography",
				"otherPossibleNames": [],
				"logicalName": "GEOGRAPHY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 789,
					"offsetEnd": 790,
					"columnNum": 131
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Psychology",
				"otherPossibleNames": [],
				"logicalName": "PSYCHOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 791,
					"offsetEnd": 792,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Sociology",
				"otherPossibleNames": [],
				"logicalName": "SOCIOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 793,
					"offsetEnd": 794,
					"columnNum": 133
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Other Social Science or History Course",
				"otherPossibleNames": [],
				"logicalName": "OTHER_SOCIAL_SCIENCE_OR_HISTORY_COURSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 795,
					"offsetEnd": 796,
					"columnNum": 134
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Average Grade for Each Subject",
				"otherPossibleNames": [],
				"logicalName": "AVERAGE_GRADE_FOR_EACH_SUBJECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 797,
					"offsetEnd": 802,
					"columnNum": 135
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Arts and Music",
				"otherPossibleNames": [],
				"logicalName": "ARTS_AND_MUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 797,
					"offsetEnd": 797,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "English",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 798,
					"offsetEnd": 798,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Foreign and Classical Languages",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_AND_CLASSICAL_LANGUAGES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 799,
					"offsetEnd": 799,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Mathematics",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 800,
					"offsetEnd": 800,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Natural Sciences",
				"otherPossibleNames": [],
				"logicalName": "NATURAL_SCIENCES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 801,
					"offsetEnd": 801,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Social Sciences and History",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_SCIENCES_AND_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 802,
					"offsetEnd": 802,
					"columnNum": 141
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Grade Point Average",
				"otherPossibleNames": [],
				"logicalName": "GRADE_POINT_AVERAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 803,
					"offsetEnd": 803,
					"columnNum": 142
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Class Rank",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_CLASS_RANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 804,
					"offsetEnd": 804,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "English/Language Arts",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_ARTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 805,
					"offsetEnd": 812,
					"columnNum": 144
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Art and Music",
				"otherPossibleNames": [],
				"logicalName": "ART_AND_MUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 813,
					"offsetEnd": 821,
					"columnNum": 145
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Computer",
				"otherPossibleNames": [],
				"logicalName": "COMPUTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 822,
					"offsetEnd": 828,
					"columnNum": 146
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 829,
					"offsetEnd": 834,
					"columnNum": 147
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School/CommunityActivities",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_COMMUNITYACTIVITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 835,
					"offsetEnd": 895,
					"columnNum": 148
				},
				"fieldLength": 61,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Sports",
				"otherPossibleNames": [],
				"logicalName": "SPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 896,
					"offsetEnd": 902,
					"columnNum": 149
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "2-Year or 4-Year School",
				"otherPossibleNames": [],
				"logicalName": "2-YEAR_OR_4-YEAR_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 903,
					"offsetEnd": 906,
					"columnNum": 150
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Public/Private Institution",
				"otherPossibleNames": [],
				"logicalName": "PUBLIC_PRIVATE_INSTITUTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 907,
					"offsetEnd": 910,
					"columnNum": 151
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Size of Institution",
				"otherPossibleNames": [],
				"logicalName": "SIZE_OF_INSTITUTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 911,
					"offsetEnd": 916,
					"columnNum": 152
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Setting",
				"otherPossibleNames": [],
				"logicalName": "SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 917,
					"offsetEnd": 922,
					"columnNum": 153
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Location",
				"otherPossibleNames": [],
				"logicalName": "LOCATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 923,
					"offsetEnd": 928,
					"columnNum": 154
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "College Type",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 929,
					"offsetEnd": 931,
					"columnNum": 155
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Degree Goal",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_GOAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 932,
					"offsetEnd": 932,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "First-Choice Major",
				"otherPossibleNames": [],
				"logicalName": "FIRST-CHOICE_MAJOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 933,
					"offsetEnd": 935,
					"columnNum": 157
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Certainty of First Choice",
				"otherPossibleNames": [],
				"logicalName": "CERTAINTY_OF_FIRST_CHOICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 936,
					"offsetEnd": 936,
					"columnNum": 158
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "OtherMajor",
				"otherPossibleNames": [],
				"logicalName": "OTHERMAJOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 937,
					"offsetEnd": 939,
					"columnNum": 159
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "OtherMajor",
				"otherPossibleNames": [],
				"logicalName": "OTHERMAJOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 940,
					"offsetEnd": 942,
					"columnNum": 160
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "OtherMajor",
				"otherPossibleNames": [],
				"logicalName": "OTHERMAJOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 943,
					"offsetEnd": 945,
					"columnNum": 161
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "OtherMajor",
				"otherPossibleNames": [],
				"logicalName": "OTHERMAJOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 946,
					"offsetEnd": 948,
					"columnNum": 162
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 949,
					"offsetEnd": 950,
					"columnNum": 163
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Advanced Placement or Exemption",
				"otherPossibleNames": [],
				"logicalName": "ADVANCED_PLACEMENT_OR_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 951,
					"offsetEnd": 962,
					"columnNum": 164
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Requested Services",
				"otherPossibleNames": [],
				"logicalName": "REQUESTED_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 963,
					"offsetEnd": 969,
					"columnNum": 165
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "College Activities",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 970,
					"offsetEnd": 990,
					"columnNum": 166
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Financial Aid",
				"otherPossibleNames": [],
				"logicalName": "FINANCIAL_AID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 991,
					"offsetEnd": 991,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Part-Time Job",
				"otherPossibleNames": [],
				"logicalName": "PART-TIME_JOB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 992,
					"offsetEnd": 992,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Housing Plans",
				"otherPossibleNames": [],
				"logicalName": "HOUSING_PLANS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 993,
					"offsetEnd": 993,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Ethnic",
				"otherPossibleNames": [],
				"logicalName": "ETHNIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 994,
					"offsetEnd": 994,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "First Language",
				"otherPossibleNames": [],
				"logicalName": "FIRST_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 995,
					"offsetEnd": 995,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Best Language",
				"otherPossibleNames": [],
				"logicalName": "BEST_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 996,
					"offsetEnd": 996,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Citizenship",
				"otherPossibleNames": [],
				"logicalName": "CITIZENSHIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 997,
					"offsetEnd": 997,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Religion",
				"otherPossibleNames": [],
				"logicalName": "RELIGION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 998,
					"offsetEnd": 999,
					"columnNum": 174
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1000,
					"offsetEnd": 1015,
					"columnNum": 175
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Information",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1016,
					"offsetEnd": 1162,
					"columnNum": 176
				},
				"fieldLength": 147,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Code",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1016,
					"offsetEnd": 1021,
					"columnNum": 177
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Name",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1022,
					"offsetEnd": 1051,
					"columnNum": 178
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Address 1",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_ADDRESS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1052,
					"offsetEnd": 1081,
					"columnNum": 179
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Address 2",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_ADDRESS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1082,
					"offsetEnd": 1111,
					"columnNum": 180
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Address 3",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_ADDRESS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1112,
					"offsetEnd": 1141,
					"columnNum": 181
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Telephone Number",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_TELEPHONE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1142,
					"offsetEnd": 1151,
					"columnNum": 182
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "High School Type",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1152,
					"offsetEnd": 1152,
					"columnNum": 183
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Senior Class Size",
				"otherPossibleNames": [],
				"logicalName": "SENIOR_CLASS_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1153,
					"offsetEnd": 1153,
					"columnNum": 184
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Percent of Seniors Going to College",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_OF_SENIORS_GOING_TO_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1154,
					"offsetEnd": 1154,
					"columnNum": 185
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Location of High School",
				"otherPossibleNames": [],
				"logicalName": "LOCATION_OF_HIGH_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1155,
					"offsetEnd": 1155,
					"columnNum": 186
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Number of Advanced Placement Program Courses Offered",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ADVANCED_PLACEMENT_PROGRAM_COURSES_OFFERED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1156,
					"offsetEnd": 1157,
					"columnNum": 187
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Honors Courses Offered",
				"otherPossibleNames": [],
				"logicalName": "HONORS_COURSES_OFFERED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1158,
					"offsetEnd": 1158,
					"columnNum": 188
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Units to Graduate",
				"otherPossibleNames": [],
				"logicalName": "UNITS_TO_GRADUATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1159,
					"offsetEnd": 1162,
					"columnNum": 189
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Date of Report",
				"otherPossibleNames": [],
				"logicalName": "REPORT_DATE",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1163,
					"offsetEnd": 1168,
					"columnNum": 190
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1169,
					"offsetEnd": 1174,
					"columnNum": 191
				},
				"fieldLength": 6,
				"expectedValues": ["      "],
				"dataTypes": "STRING",
				"scale": -1.0
			}
		]
	},
	"fileExtensions": [".txt"]
}