{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "MA_ACCESS_18",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["ADMIN_YEAR", "STATE_STUDENT_ID"],
		"fields": [{
				"physicalName": "adminyear",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "sprp_dis",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLE_DISTRICT_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "sprp_sch",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLE_SCHOOL_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "districtnumber",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "districtname",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "schoolnumber",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "schoolname",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SASID",
				"otherPossibleNames": [],
				"logicalName": "STATE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "lastname",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 32,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "firstname",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 32,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "mi",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "dob",
				"otherPossibleNames": [],
				"logicalName": "BIRTH_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "yrsinmass",
				"otherPossibleNames": [],
				"logicalName": "YEARS_IN_MASS",
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
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "grade",
				"otherPossibleNames": [],
				"logicalName": "GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "gradecluster",
				"otherPossibleNames": [],
				"logicalName": "GRADE_CLUSTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tier",
				"otherPossibleNames": [],
				"logicalName": "TIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": ["A", "B", "C", "-", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "mode",
				"otherPossibleNames": [],
				"logicalName": "MODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 6,
				"expectedValues": ["Paper", "Online", "Mixed", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "gender",
				"otherPossibleNames": [],
				"logicalName": "GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "race",
				"otherPossibleNames": [],
				"logicalName": "RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 1,
				"expectedValues": ["A", "B", "H", "M", "N", "P", "W"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "elp_prog",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_PROGRAM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "nativelanguage",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "IEP",
				"otherPossibleNames": [],
				"logicalName": "IEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "plan504",
				"otherPossibleNames": [],
				"logicalName": "504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "ecodis",
				"otherPossibleNames": [],
				"logicalName": "DISADVANTAGED_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "teststatus",
				"otherPossibleNames": [],
				"logicalName": "TEST_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 3,
				"expectedValues": ["T", "ABS", "INV", "EXE", "ALT"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "listeningss_adj",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "speakingss_adj",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "readingss_adj",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "writingss_adj",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "comprehensionss_adj",
				"otherPossibleNames": [],
				"logicalName": "COMPREHENSION_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "oralss_adj",
				"otherPossibleNames": [],
				"logicalName": "ORAL_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "literacyss_adj",
				"otherPossibleNames": [],
				"logicalName": "LITERACY_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "overallss_adj",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALED_SCORE",
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
				"scale": 0.0
			},
			{
				"physicalName": "listeninglevel_adj",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PROFICIENCY_LEVEL",
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
				"scale": 1.0
			},
			{
				"physicalName": "speakinglevel_adj",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PROFICIENCY_LEVEL",
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
				"scale": 1.0
			},
			{
				"physicalName": "readinglevel_adj",
				"otherPossibleNames": [],
				"logicalName": "READING_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "writinglevel_adj",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "comprehensionlevel_adj",
				"otherPossibleNames": [],
				"logicalName": "COMPREHENSION_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "orallevel_adj",
				"otherPossibleNames": [],
				"logicalName": "ORAL_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "literacylevel_adj",
				"otherPossibleNames": [],
				"logicalName": "LITERACY_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "overalllevel_adj",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "ALT",
				"otherPossibleNames": [],
				"logicalName": "ALT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "listeninglevel_alt",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "speakinglevel_alt",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "readinglevel_alt",
				"otherPossibleNames": [],
				"logicalName": "READING_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "writinglevel_alt",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "comprehensionlevel_alt",
				"otherPossibleNames": [],
				"logicalName": "COMPREHENSION_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "orallevel_alt",
				"otherPossibleNames": [],
				"logicalName": "ORAL_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "literacylevel_alt",
				"otherPossibleNames": [],
				"logicalName": "LITERACY_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "overalllevel_alt",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "A3", "P1", "P2", "P3", ""],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "DRCrecordID",
				"otherPossibleNames": [],
				"logicalName": "DRC_RECORD_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "grade2017",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "overallss2017",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_OVERALL_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "overalllevel2017",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_OVERALL_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "overalllevel_alt2017",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_OVERALL_ALT_PROFICIENCY_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MadeExitCriteria",
				"otherPossibleNames": [],
				"logicalName": "MADE_EXIT_CRITERIA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SGPA",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GROWTH_PERCENTILE",
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
				"scale": 0.0
			},
			{
				"physicalName": "ProgressTarget18",
				"otherPossibleNames": [],
				"logicalName": "PROGRESS_TARGET",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "MadeProgress",
				"otherPossibleNames": [],
				"logicalName": "MADE_PROGRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DifficultyIndex18",
				"otherPossibleNames": [],
				"logicalName": "DIFFICULTY_INDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "access_part",
				"otherPossibleNames": [],
				"logicalName": "PARTICIPATION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1"],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": [".csv"]
}
