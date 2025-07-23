{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "CELDT_COMMA_1314",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": [],
		"fields": [{
				"physicalName": "Edition",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_YEAR",
				"formatMask": "([0-9]{4})[-]{1}([0-9]) {4}",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 9,
				"expectedValues": ["2013-2014"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "testName",
				"otherPossibleNames": [],
				"logicalName": "TEST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 6,
				"expectedValues": ["CELDT ", "CELDT", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "districtName",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "countyCode",
				"otherPossibleNames": [],
				"logicalName": "COUNTY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "districtCode",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "schoolName",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "schoolCode",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "charterNum",
				"otherPossibleNames": [],
				"logicalName": "CHARTER_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "charterFlag",
				"otherPossibleNames": [],
				"logicalName": "CHARTER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "gisGrade",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GRADE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "  ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "specCodes",
				"otherPossibleNames": [],
				"logicalName": "SPEC_CODES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "batchScan",
				"otherPossibleNames": [],
				"logicalName": "BATCH_SCAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "scanDate",
				"otherPossibleNames": [],
				"logicalName": "SCAN_DATE",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "bookID",
				"otherPossibleNames": [],
				"logicalName": "BOOK_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "batDate",
				"otherPossibleNames": [],
				"logicalName": "BAT_DATE",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "studentLName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "studentFName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "studentMInitial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "birthDate",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB_STR",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "plCode",
				"otherPossibleNames": [],
				"logicalName": "PL_CODE",
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
				"physicalName": "pdCode",
				"otherPossibleNames": [],
				"logicalName": "PD_CODE",
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
				"physicalName": "gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "StudentIDLocal",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LOCAL_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SSID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "  ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "testPurpose",
				"otherPossibleNames": [],
				"logicalName": "TEST_PURPOSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "4", "5", ""],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "brFlag",
				"otherPossibleNames": [],
				"logicalName": "BR_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "testForm",
				"otherPossibleNames": [],
				"logicalName": "TEST_FORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "testDate",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMIN_DATE_STR",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "enrolledDate",
				"otherPossibleNames": [],
				"logicalName": "ENROLLED_DATE",
				"formatMask": "yyyyMMdd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "prevTestDate",
				"otherPossibleNames": [],
				"logicalName": "prev_Test_Date",
				"formatMask": "MMyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "prevListenSS",
				"otherPossibleNames": [],
				"logicalName": "PREV_LISTEN_SS",
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
				"physicalName": "prevSpeakSS",
				"otherPossibleNames": [],
				"logicalName": "PREV_SPEAK_SS",
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
				"physicalName": "prevReadSS",
				"otherPossibleNames": [],
				"logicalName": "PREV_READ_SS",
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
				"scale": 0.0
			},
			{
				"physicalName": "prevWritSS",
				"otherPossibleNames": [],
				"logicalName": "PREV_WRIT_SS",
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
				"scale": 0.0
			},
			{
				"physicalName": "prevOverallSS",
				"otherPossibleNames": [],
				"logicalName": "PREV_OVERALL_SS",
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
				"scale": 0.0
			},
			{
				"physicalName": "prevListenPL",
				"otherPossibleNames": [],
				"logicalName": "PREV_LISTEN_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "prevSpeakPL",
				"otherPossibleNames": [],
				"logicalName": "PREV_SPEAK_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "prevReadPL",
				"otherPossibleNames": [],
				"logicalName": "PREV_READ_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "prevWritPL",
				"otherPossibleNames": [],
				"logicalName": "PREV_WRIT_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "prevOverallPL",
				"otherPossibleNames": [],
				"logicalName": "PREV_OVERALL_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "hispanicLatino",
				"otherPossibleNames": [],
				"logicalName": "hispanicLatino",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "filler",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "africanAmerican",
				"otherPossibleNames": [],
				"logicalName": "africanAmerican",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "americanIndian",
				"otherPossibleNames": [],
				"logicalName": "americanIndian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "chinese",
				"otherPossibleNames": [],
				"logicalName": "chinese",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "japanese",
				"otherPossibleNames": [],
				"logicalName": "japanese",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "korean",
				"otherPossibleNames": [],
				"logicalName": "korean",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "vietnamese",
				"otherPossibleNames": [],
				"logicalName": "vietnamese",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "asianIndian",
				"otherPossibleNames": [],
				"logicalName": "asianIndian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "laotian",
				"otherPossibleNames": [],
				"logicalName": "laotian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "cambodian",
				"otherPossibleNames": [],
				"logicalName": "cambodian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "otherAsian",
				"otherPossibleNames": [],
				"logicalName": "otherAsian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "hmong",
				"otherPossibleNames": [],
				"logicalName": "hmong",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filipino",
				"otherPossibleNames": [],
				"logicalName": "filipino",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "nativeHawaiian",
				"otherPossibleNames": [],
				"logicalName": "nativeHawaiian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "guamanian",
				"otherPossibleNames": [],
				"logicalName": "guamanian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "samoan",
				"otherPossibleNames": [],
				"logicalName": "samoan",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tahitian",
				"otherPossibleNames": [],
				"logicalName": "tahitian",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "otherPacificIslander",
				"otherPossibleNames": [],
				"logicalName": "otherPacificIslander",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "white",
				"otherPossibleNames": [],
				"logicalName": "white",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ppMigrant",
				"otherPossibleNames": [],
				"logicalName": "PP_MIGRANT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ppGates",
				"otherPossibleNames": [],
				"logicalName": "PP_GATES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ppEl",
				"otherPossibleNames": [],
				"logicalName": "PP_EL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", " ", ""],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "localUse",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tstIrrListen",
				"otherPossibleNames": [],
				"logicalName": "TST_IRR_LISTEN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tstIrrSpeak",
				"otherPossibleNames": [],
				"logicalName": "TST_IRR_SPEAK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tstIrrRead",
				"otherPossibleNames": [],
				"logicalName": "TST_IRR_READ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tstIrrWrite",
				"otherPossibleNames": [],
				"logicalName": "TST_IRR_WRITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "nps",
				"otherPossibleNames": [],
				"logicalName": "NPS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "npsCode",
				"otherPossibleNames": [],
				"logicalName": "NPS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "prevGrade",
				"otherPossibleNames": [],
				"logicalName": "PREV_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "  ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "accListen",
				"otherPossibleNames": [],
				"logicalName": "ACC_LISTEN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "accSpeak",
				"otherPossibleNames": [],
				"logicalName": "ACC_SPEAK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "accRead",
				"otherPossibleNames": [],
				"logicalName": "ACC_READ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "accWrite",
				"otherPossibleNames": [],
				"logicalName": "ACC_WRITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "modListen",
				"otherPossibleNames": [],
				"logicalName": "MOD_LISTEN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "modSpeak",
				"otherPossibleNames": [],
				"logicalName": "MOD_SPEAK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "modRead",
				"otherPossibleNames": [],
				"logicalName": "MOD_READ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "modWrite",
				"otherPossibleNames": [],
				"logicalName": "MOD_WRITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "aaListen",
				"otherPossibleNames": [],
				"logicalName": "AA_LISTEN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "aaSpeak",
				"otherPossibleNames": [],
				"logicalName": "AA_SPEAK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "aaRead",
				"otherPossibleNames": [],
				"logicalName": "AA_READ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "aaWrite",
				"otherPossibleNames": [],
				"logicalName": "AA_WRITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "countyDistrictRes",
				"otherPossibleNames": [],
				"logicalName": "COUNTY_DISTRICT_RES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler1",
				"otherPossibleNames": [],
				"logicalName": "FILLER4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler2",
				"otherPossibleNames": [],
				"logicalName": "FILLER5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler3",
				"otherPossibleNames": [],
				"logicalName": "FILLER6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler4",
				"otherPossibleNames": [],
				"logicalName": "FILLER7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "gradeSpan",
				"otherPossibleNames": [],
				"logicalName": "GRADE_SPAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "numCorrectListen",
				"otherPossibleNames": [],
				"logicalName": "LISTEN_TEST_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "numCorrectSpeak",
				"otherPossibleNames": [],
				"logicalName": "SPEAK_TEST_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "numCorrectRead",
				"otherPossibleNames": [],
				"logicalName": "READ_TEST_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "numCorrectWrite",
				"otherPossibleNames": [],
				"logicalName": "WRITE_TEST_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ssListen",
				"otherPossibleNames": [],
				"logicalName": "LISTEN_TEST_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ssSpeak",
				"otherPossibleNames": [],
				"logicalName": "SPEAK_TEST_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ssRead",
				"otherPossibleNames": [],
				"logicalName": "READ_TEST_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ssComp",
				"otherPossibleNames": [],
				"logicalName": "COMP_TEST_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ssWrite",
				"otherPossibleNames": [],
				"logicalName": "WRITE_TEST_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ssOverall",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_TEST_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "semListen",
				"otherPossibleNames": [],
				"logicalName": "LISTEN_TEST_STANDARD_ERROR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "semSpeak",
				"otherPossibleNames": [],
				"logicalName": "SPEAK_TEST_STANDARD_ERROR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "semRead",
				"otherPossibleNames": [],
				"logicalName": "READ_TEST_STANDARD_ERROR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "semWrite",
				"otherPossibleNames": [],
				"logicalName": "WRITE_TEST_STANDARD_ERROR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "plListen",
				"otherPossibleNames": [],
				"logicalName": "LISTEN_TEST_PRIMARY_RESULT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "plSpeak",
				"otherPossibleNames": [],
				"logicalName": "SPEAK_TEST_PRIMARY_RESULT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "plRead",
				"otherPossibleNames": [],
				"logicalName": "READ_TEST_PRIMARY_RESULT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "plWrite",
				"otherPossibleNames": [],
				"logicalName": "WRITE_TEST_PRIMARY_RESULT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "plOverall",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_TEST_PRIMARY_RESULT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "celdtCriterion",
				"otherPossibleNames": [],
				"logicalName": "CELDT_CRITERION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 1,
				"expectedValues": ["1", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "repEthnicity",
				"otherPossibleNames": [],
				"logicalName": "FILLER3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tkFlag",
				"otherPossibleNames": [],
				"logicalName": "MATCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "scoringDate",
				"otherPossibleNames": [],
				"logicalName": "SCORING_DATE",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "batchCode",
				"otherPossibleNames": [],
				"logicalName": "BATCH_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "downloadDate",
				"otherPossibleNames": [],
				"logicalName": "DOWNLOAD_DATE",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "addressLine1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STREET_ADDRESS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "addressLine2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STREET_ADDRESS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "city",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "state",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "zip",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_POSTAL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": ["csv"]
}