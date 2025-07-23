{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "SAT_REDESIGN_DELIMITED_BELL_16",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["STUDENT_FIRST_NAME","STUDENT_LAST_NAME"],
		"fields": [{
				"physicalName": "ID",
				"otherPossibleNames": [],
				"logicalName": "CB_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 1
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "School Code (R2) ",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 2
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Last Name (R1) ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 3
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "First Name (R1) ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 4
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "M.I. (R1) ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 5
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Sex (R3) ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 6
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F"],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Birth Date (R5) ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 7
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "S.S.# (R7) ",
				"otherPossibleNames": [],
				"logicalName": "FILLER_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 8
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "State (R10) ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 9
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Zip Code (R10) ",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_ZIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 10
				},
				"fieldLength": 17,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Ethnicity (Q28) ",
				"otherPossibleNames": [],
				"logicalName": "FILLER_38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 11
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "First Language (Q29A) ",
				"otherPossibleNames": [],
				"logicalName": "FIRST_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 12
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Best Language (Q29B) ",
				"otherPossibleNames": [],
				"logicalName": "BEST_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Citizenship (Q30) ",
				"otherPossibleNames": [],
				"logicalName": "CITIZENSHIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 14
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Religious Preference (Q31) ",
				"otherPossibleNames": [],
				"logicalName": "FILLER_39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 15
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Cohort Year",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 16
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Ed Level (R4) ",
				"otherPossibleNames": [],
				"logicalName": "LATEST_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Class Rank (Q9)",
				"otherPossibleNames": [],
				"logicalName": "HS_RANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "GPA (Q8)",
				"otherPossibleNames": [],
				"logicalName": "GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 19
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "PSAT Taker",
				"otherPossibleNames": [],
				"logicalName": "PSAT_TAKER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 20
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Test Date (R16) ",
				"otherPossibleNames": [],
				"logicalName": "LATEST_ASSESSMENT_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 21
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Test Score - Critical Rdg",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 22
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Test Score - Mathematics",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 23
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Test Score - Writing",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 24
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Test Score - Writing MC",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "SAT Test Score - Writing ES",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 26
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "National Percentiles - Critical Rdg %",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "National Percentiles - Mathematics %",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "National Percentiles - Writing %",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Literature - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "LITERATURE_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 30
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Literature - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "LITERATURE_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 31
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "US History - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 32
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "US History - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 33
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "World History - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "WORLD_HISTORY_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 34
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "World History - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "WORLD_HISTORY_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 35
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Math I - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "MATH_I_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 36
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Math I - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "MATH_I_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 37
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Math II - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "MATH_II_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 38
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Math II - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "MATH_II_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 39
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Ecological Biology (EB) - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "ECOLOGICAL_BIOLOGY_(EB)_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 40
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Ecological Biology (EB) - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "ECOLOGICAL_BIOLOGY_(EB)_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 41
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Molecular Biology (MB) - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "MOLECULAR_BIOLOGY_(MB)_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 42
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Molecular Biology (MB) - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "MOLECULAR_BIOLOGY_(MB)_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 43
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chemistry - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "CHEMISTRY_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 44
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chemistry - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "CHEMISTRY_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 45
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Physics - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "PHYSICS_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 46
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Physics - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "PHYSICS_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 47
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chinese With Listening - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "CHINESE_WITH_LISTENING_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 48
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chinese With Listening - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "CHINESE_WITH_LISTENING_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 49
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chinese With Listening - Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "CHINESE_WITH_LISTENING_-_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 50
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chinese With Listening - Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "CHINESE_WITH_LISTENING_-_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 51
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Chinese With Listening - Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "CHINESE_WITH_LISTENING_-_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 52
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "FRENCH_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 53
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "FRENCH_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 54
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French With Listening - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "FRENCH_WITH_LISTENING_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 55
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French With Listening - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "FRENCH_WITH_LISTENING_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 56
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French With Listening - Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "FRENCH_WITH_LISTENING_-_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 57
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "French With Listening - Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "FRENCH_WITH_LISTENING_-_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 58
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "GERMAN_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 59
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "GERMAN_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 60
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German With Listening - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "GERMAN_WITH_LISTENING_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 61
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German With Listening - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "GERMAN_WITH_LISTENING_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 62
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German With Listening - Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "GERMAN_WITH_LISTENING_-_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 63
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "German With Listening - Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "GERMAN_WITH_LISTENING_-_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 64
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Modern Hebrew - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "MODERN_HEBREW_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 65
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Modern Hebrew - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "MODERN_HEBREW_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 66
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Italian - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "ITALIAN_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 67
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Italian - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "ITALIAN_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 68
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Japanese With Listening - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "JAPANESE_WITH_LISTENING_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 69
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Japanese With Listening - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "JAPANESE_WITH_LISTENING_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 70
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Japanese With Listening - Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "JAPANESE_WITH_LISTENING_-_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 71
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Japanese With Listening - Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "JAPANESE_WITH_LISTENING_-_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 72
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Japanese With Listening - Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "JAPANESE_WITH_LISTENING_-_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 73
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Korean With Listening - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "KOREAN_WITH_LISTENING_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 74
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Korean With Listening - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "KOREAN_WITH_LISTENING_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 75
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Korean With Listening - Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "KOREAN_WITH_LISTENING_-_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 76
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Korean With Listening - Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "KOREAN_WITH_LISTENING_-_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 77
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Korean With Listening - Subscore 3",
				"otherPossibleNames": [],
				"logicalName": "KOREAN_WITH_LISTENING_-_SUBSCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 78
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Latin - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "LATIN_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 79
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Latin - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "LATIN_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 80
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 81
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 82
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish With Listening - Subject Test Date",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_WITH_LISTENING_-_SUBJECT_TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 83
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish With Listening - Subject Test Score",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_WITH_LISTENING_-_SUBJECT_TEST_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 84
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish With Listening - Subscore 1",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_WITH_LISTENING_-_SUBSCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 85
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "Spanish With Listening - Subscore 2",
				"otherPossibleNames": [],
				"logicalName": "SPANISH_WITH_LISTENING_-_SUBSCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 86
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			}
		]
	},
	"fileExtensions": [".csv"]
}