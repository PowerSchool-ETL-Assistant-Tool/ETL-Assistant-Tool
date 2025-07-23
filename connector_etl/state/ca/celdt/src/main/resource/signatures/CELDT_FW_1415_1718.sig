{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "CELDT_FW_1415_1718",
		"recordLength": 668.0,
		"naturalKey": [],
		"fields": [{
				"physicalName": "Edition",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_YEAR",
				"formatMask": "([0-9]{4})[-]{1}([0-9]) {4}",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 9,
					"columnNum": 1
				},
				"fieldLength": 9,
				"expectedValues": ["2014-2015", "2015-2016", "2016-2017", "2017-2018"],
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
					"offsetStart": 10,
					"offsetEnd": 15,
					"columnNum": 2
				},
				"fieldLength": 6,
				"expectedValues": ["CELDT "],
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
					"offsetStart": 16,
					"offsetEnd": 45,
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
					"offsetStart": 46,
					"offsetEnd": 47,
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
					"offsetStart": 48,
					"offsetEnd": 52,
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
					"offsetStart": 53,
					"offsetEnd": 82,
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
					"offsetStart": 83,
					"offsetEnd": 89,
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
					"offsetStart": 90,
					"offsetEnd": 93,
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
					"offsetStart": 94,
					"offsetEnd": 94,
					"columnNum": 9
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 95,
					"offsetEnd": 96,
					"columnNum": 10
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "  "],
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
					"offsetStart": 97,
					"offsetEnd": 111,
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
					"offsetStart": 112,
					"offsetEnd": 119,
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
					"offsetStart": 120,
					"offsetEnd": 125,
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
					"offsetStart": 126,
					"offsetEnd": 135,
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
					"offsetStart": 136,
					"offsetEnd": 141,
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
					"offsetStart": 142,
					"offsetEnd": 152,
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
					"offsetStart": 153,
					"offsetEnd": 161,
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
					"offsetStart": 162,
					"offsetEnd": 162,
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
					"offsetStart": 163,
					"offsetEnd": 170,
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
					"offsetStart": 171,
					"offsetEnd": 172,
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
					"offsetStart": 173,
					"offsetEnd": 175,
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
					"offsetStart": 176,
					"offsetEnd": 176,
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
					"offsetStart": 177,
					"offsetEnd": 186,
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
					"offsetStart": 187,
					"offsetEnd": 196,
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
					"offsetStart": 197,
					"offsetEnd": 198,
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "  "],
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
					"offsetStart": 199,
					"offsetEnd": 199,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 200,
					"offsetEnd": 200,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 201,
					"offsetEnd": 202,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": ["01", "  "],
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
					"offsetStart": 203,
					"offsetEnd": 210,
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
					"offsetStart": 211,
					"offsetEnd": 218,
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
					"offsetStart": 219,
					"offsetEnd": 224,
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
					"offsetStart": 225,
					"offsetEnd": 227,
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
					"offsetStart": 228,
					"offsetEnd": 230,
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
					"offsetStart": 231,
					"offsetEnd": 233,
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
					"offsetStart": 234,
					"offsetEnd": 236,
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
					"offsetStart": 237,
					"offsetEnd": 239,
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
					"offsetStart": 240,
					"offsetEnd": 240,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 241,
					"offsetEnd": 241,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 242,
					"offsetEnd": 242,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 243,
					"offsetEnd": 243,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 244,
					"offsetEnd": 244,
					"columnNum": 41
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler1",
				"otherPossibleNames": [],
				"logicalName": "FILLER1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 245,
					"offsetEnd": 265,
					"columnNum": 42
				},
				"fieldLength": 21,
				"expectedValues": [],
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
					"offsetStart": 266,
					"offsetEnd": 266,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler2",
				"otherPossibleNames": [],
				"logicalName": "FILLER2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 267,
					"offsetEnd": 268,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"offsetStart": 269,
					"offsetEnd": 278,
					"columnNum": 45
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
					"offsetStart": 279,
					"offsetEnd": 279,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 280,
					"offsetEnd": 280,
					"columnNum": 47
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 281,
					"offsetEnd": 281,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 282,
					"offsetEnd": 282,
					"columnNum": 49
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 283,
					"offsetEnd": 283,
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 284,
					"offsetEnd": 290,
					"columnNum": 51
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
					"offsetStart": 291,
					"offsetEnd": 292,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "  "],
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
					"offsetStart": 293,
					"offsetEnd": 293,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 294,
					"offsetEnd": 294,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 295,
					"offsetEnd": 295,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 296,
					"offsetEnd": 296,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 297,
					"offsetEnd": 297,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 298,
					"offsetEnd": 298,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 299,
					"offsetEnd": 299,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 300,
					"offsetEnd": 300,
					"columnNum": 60
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 301,
					"offsetEnd": 301,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 302,
					"offsetEnd": 302,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 303,
					"offsetEnd": 303,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 304,
					"offsetEnd": 304,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["Y", " "],
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
					"offsetStart": 305,
					"offsetEnd": 311,
					"columnNum": 65
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler4",
				"otherPossibleNames": [],
				"logicalName": "FILLER4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 312,
					"offsetEnd": 361,
					"columnNum": 66
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler5",
				"otherPossibleNames": [],
				"logicalName": "FILLER5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 362,
					"offsetEnd": 411,
					"columnNum": 67
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler6",
				"otherPossibleNames": [],
				"logicalName": "FILLER6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 412,
					"offsetEnd": 461,
					"columnNum": 68
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler7",
				"otherPossibleNames": [],
				"logicalName": "FILLER7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 462,
					"offsetEnd": 511,
					"columnNum": 69
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
					"offsetStart": 512,
					"offsetEnd": 512,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 513,
					"offsetEnd": 514,
					"columnNum": 71
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
					"offsetStart": 515,
					"offsetEnd": 516,
					"columnNum": 72
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
					"offsetStart": 517,
					"offsetEnd": 518,
					"columnNum": 73
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
					"offsetStart": 519,
					"offsetEnd": 520,
					"columnNum": 74
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
					"offsetStart": 521,
					"offsetEnd": 523,
					"columnNum": 75
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
					"offsetStart": 524,
					"offsetEnd": 526,
					"columnNum": 76
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
					"offsetStart": 527,
					"offsetEnd": 529,
					"columnNum": 77
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
					"offsetStart": 530,
					"offsetEnd": 532,
					"columnNum": 78
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
					"offsetStart": 533,
					"offsetEnd": 535,
					"columnNum": 79
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
					"offsetStart": 536,
					"offsetEnd": 538,
					"columnNum": 80
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
					"offsetStart": 539,
					"offsetEnd": 541,
					"columnNum": 81
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
					"offsetStart": 542,
					"offsetEnd": 544,
					"columnNum": 82
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
					"offsetStart": 545,
					"offsetEnd": 547,
					"columnNum": 83
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
					"offsetStart": 548,
					"offsetEnd": 550,
					"columnNum": 84
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
					"offsetStart": 551,
					"offsetEnd": 551,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 552,
					"offsetEnd": 552,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 553,
					"offsetEnd": 553,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 554,
					"offsetEnd": 554,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 555,
					"offsetEnd": 555,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", " "],
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
					"offsetStart": 556,
					"offsetEnd": 556,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["1", " "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler3",
				"otherPossibleNames": [],
				"logicalName": "FILLER3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 557,
					"offsetEnd": 559,
					"columnNum": 91
				},
				"fieldLength": 3,
				"expectedValues": ["   "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "matchFlag",
				"otherPossibleNames": [],
				"logicalName": "MATCH_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 560,
					"offsetEnd": 560,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": ["M", " "],
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
					"offsetStart": 561,
					"offsetEnd": 568,
					"columnNum": 93
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
					"offsetStart": 569,
					"offsetEnd": 569,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", " "],
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
					"offsetStart": 570,
					"offsetEnd": 577,
					"columnNum": 95
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
					"offsetStart": 578,
					"offsetEnd": 607,
					"columnNum": 96
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
					"offsetStart": 608,
					"offsetEnd": 637,
					"columnNum": 97
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
					"offsetStart": 638,
					"offsetEnd": 657,
					"columnNum": 98
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
					"offsetStart": 658,
					"offsetEnd": 659,
					"columnNum": 99
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
					"offsetStart": 660,
					"offsetEnd": 668,
					"columnNum": 100
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": ["txt"]
}