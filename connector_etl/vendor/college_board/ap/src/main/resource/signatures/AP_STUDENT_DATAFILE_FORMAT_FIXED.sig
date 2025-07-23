{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "AP_STUDENT_DATAFILE_FORMAT_FIXED",
		"recordLength": 910,
		"naturalKey": [],
		"fields": [{
				"physicalName": "AP NUMBER",
				"otherPossibleNames": [],
				"logicalName": "AP_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 8,
					"columnNum": 1
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAST NAME",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 9,
					"offsetEnd": 23,
					"columnNum": 2
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FIRST NAME",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 24,
					"offsetEnd": 35,
					"columnNum": 3
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MIDDLE INITIAL",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 36,
					"offsetEnd": 36,
					"columnNum": 4
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT STREET ADDRESS 0",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STREET_ADDRESS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 37,
					"offsetEnd": 66,
					"columnNum": 5
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT STREET ADDRESS 1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STREET_ADDRESS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 67,
					"offsetEnd": 96,
					"columnNum": 6
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT STREET ADDRESS 2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 97,
					"offsetEnd": 126,
					"columnNum": 7
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT STATE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 127,
					"offsetEnd": 128,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT ZIP CODE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_POSTAL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 129,
					"offsetEnd": 137,
					"columnNum": 9
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT COUNTRY CODE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_COUNTRY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 138,
					"offsetEnd": 140,
					"columnNum": 10
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEX",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 141,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "U"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DATE OF BIRTH",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 142,
					"offsetEnd": 147,
					"columnNum": 12
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL SECURITY NUMBER",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_SECURITY_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 148,
					"offsetEnd": 156,
					"columnNum": 13
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDUCATION LEVEL",
				"otherPossibleNames": [],
				"logicalName": "EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 157,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": [" ", "0", "1", "2", "3", "4", "5", "6", "7", "8"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXPECTED COLLEGE ENTRANCE",
				"otherPossibleNames": [],
				"logicalName": "EXPECTED_COLLEGE_ENTRANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 158,
					"offsetEnd": 160,
					"columnNum": 15
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ETHNIC GROUP",
				"otherPossibleNames": [],
				"logicalName": "ETHNIC_GROUP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 161,
					"offsetEnd": 161,
					"columnNum": 16
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT SEARCH",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_SEARCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 162,
					"offsetEnd": 162,
					"columnNum": 17
				},
				"fieldLength": 1,
				"expectedValues": [" ", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BEST LANGUAGE",
				"otherPossibleNames": [],
				"logicalName": "BEST_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 163,
					"offsetEnd": 163,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "APPLYING FOR SOPHOMORE STANDING",
				"otherPossibleNames": [],
				"logicalName": "APPLYING_FOR_SOPHOMORE_STANDING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 164,
					"columnNum": 19
				},
				"fieldLength": 2,
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
					"offsetStart": 165,
					"offsetEnd": 172,
					"columnNum": 20
				},
				"fieldLength": 8,
				"expectedValues": ["        "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previous AI Year 1",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_AI_YEAR_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 173,
					"offsetEnd": 174,
					"columnNum": 21
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previous AI Code 1",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_AI_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 175,
					"offsetEnd": 180,
					"columnNum": 22
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previous AI Year 2",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_AI_YEAR_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 181,
					"offsetEnd": 182,
					"columnNum": 23
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previous AI Code 2",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_AI_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 183,
					"offsetEnd": 188,
					"columnNum": 24
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD TYPE 1",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 189,
					"offsetEnd": 190,
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD YEAR 1",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 192,
					"columnNum": 26
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD TYPE 2",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 193,
					"offsetEnd": 194,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD YEAR 2",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 195,
					"offsetEnd": 196,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD TYPE 3",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 197,
					"offsetEnd": 198,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD YEAR 3",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 199,
					"offsetEnd": 200,
					"columnNum": 30
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD TYPE 4",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 202,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD YEAR 4",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 203,
					"offsetEnd": 204,
					"columnNum": 32
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD TYPE 5",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 205,
					"offsetEnd": 206,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD YEAR 5",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 207,
					"offsetEnd": 208,
					"columnNum": 34
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD TYPE 6",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 209,
					"offsetEnd": 210,
					"columnNum": 35
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AWARD YEAR 6",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 212,
					"columnNum": 36
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCHOOL CODE",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 213,
					"offsetEnd": 218,
					"columnNum": 37
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CONTACT NAME (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "CONTACT_NAME_HIGH_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 219,
					"offsetEnd": 248,
					"columnNum": 38
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "INSTITUTION NAME (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 249,
					"offsetEnd": 278,
					"columnNum": 39
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STREET ADDRESS #1 (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STREET_ADDRESS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 279,
					"offsetEnd": 308,
					"columnNum": 40
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STREET ADDRESS #2 (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STREET_ADDRESS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 309,
					"offsetEnd": 338,
					"columnNum": 41
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STREET ADDRESS #3 (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STREET_ADDRESS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 339,
					"offsetEnd": 368,
					"columnNum": 42
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STATE (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 369,
					"offsetEnd": 370,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ZIP CODE (HIGH SCHOOL)",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_ZIP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 375,
					"columnNum": 44
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLLEGE CODE",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 376,
					"offsetEnd": 381,
					"columnNum": 45
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CONTACT NAME (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "CONTACT_NAME_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 382,
					"offsetEnd": 411,
					"columnNum": 46
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "INSTITUTION NAME (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "INSTITUTION_NAME_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 412,
					"offsetEnd": 441,
					"columnNum": 47
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STREET ADDRESS #1 (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "STREET_ADDRESS_#1_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 442,
					"offsetEnd": 471,
					"columnNum": 48
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STREET ADDRESS #2 (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "STREET_ADDRESS_#2_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 472,
					"offsetEnd": 501,
					"columnNum": 49
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STREET ADDRESS #3 (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "STREET_ADDRESS_#3_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 502,
					"offsetEnd": 531,
					"columnNum": 50
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STATE  (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "STATE_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 532,
					"offsetEnd": 533,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ZIP CODE  (COLLEGE)",
				"otherPossibleNames": [],
				"logicalName": "ZIP_CODE_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 534,
					"offsetEnd": 538,
					"columnNum": 52
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 01",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 539,
					"offsetEnd": 540,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 01",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 541,
					"offsetEnd": 542,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 01",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 543,
					"offsetEnd": 543,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 01",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 544,
					"offsetEnd": 545,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 01",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 546,
					"offsetEnd": 547,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 01",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 548,
					"offsetEnd": 548,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 01",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_01",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 549,
					"offsetEnd": 549,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 02",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 550,
					"offsetEnd": 551,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 02",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 552,
					"offsetEnd": 553,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 02",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 554,
					"offsetEnd": 554,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 02",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 555,
					"offsetEnd": 556,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 02",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 557,
					"offsetEnd": 558,
					"columnNum": 64
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 02",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 559,
					"offsetEnd": 559,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 02",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_02",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 560,
					"offsetEnd": 560,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 03",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 561,
					"offsetEnd": 562,
					"columnNum": 67
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 03",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 563,
					"offsetEnd": 564,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 03",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 565,
					"offsetEnd": 565,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 03",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 566,
					"offsetEnd": 567,
					"columnNum": 70
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 03",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 568,
					"offsetEnd": 569,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 03",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 570,
					"offsetEnd": 570,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 03",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_03",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 571,
					"offsetEnd": 571,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 04",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 572,
					"offsetEnd": 573,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 04",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 574,
					"offsetEnd": 575,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 04",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 576,
					"offsetEnd": 576,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 04",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 577,
					"offsetEnd": 578,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 04",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 579,
					"offsetEnd": 580,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 04",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 581,
					"offsetEnd": 581,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 04",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_04",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 582,
					"offsetEnd": 582,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 05",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 583,
					"offsetEnd": 584,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 05",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 585,
					"offsetEnd": 586,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 05",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 587,
					"offsetEnd": 587,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 05",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 588,
					"offsetEnd": 589,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 05",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 590,
					"offsetEnd": 591,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 05",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 592,
					"offsetEnd": 592,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 05",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_05",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 593,
					"offsetEnd": 593,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 06",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 594,
					"offsetEnd": 595,
					"columnNum": 88
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 06",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 596,
					"offsetEnd": 597,
					"columnNum": 89
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 06",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 598,
					"offsetEnd": 598,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 06",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 599,
					"offsetEnd": 600,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 06",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 601,
					"offsetEnd": 602,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 06",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 603,
					"offsetEnd": 603,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 06",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 604,
					"offsetEnd": 604,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 07",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 605,
					"offsetEnd": 606,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 07",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 607,
					"offsetEnd": 608,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 07",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 609,
					"offsetEnd": 609,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 07",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 610,
					"offsetEnd": 611,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 07",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 612,
					"offsetEnd": 613,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 07",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 614,
					"offsetEnd": 614,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 07",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_07",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 615,
					"offsetEnd": 615,
					"columnNum": 101
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 08",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 616,
					"offsetEnd": 617,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 08",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 618,
					"offsetEnd": 619,
					"columnNum": 103
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 08",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 620,
					"offsetEnd": 620,
					"columnNum": 104
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 08",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 621,
					"offsetEnd": 622,
					"columnNum": 105
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 08",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 623,
					"offsetEnd": 624,
					"columnNum": 106
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 08",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 625,
					"offsetEnd": 625,
					"columnNum": 107
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 08",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_08",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 626,
					"offsetEnd": 626,
					"columnNum": 108
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 09",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 627,
					"offsetEnd": 628,
					"columnNum": 109
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 09",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 629,
					"offsetEnd": 630,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 09",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 631,
					"offsetEnd": 631,
					"columnNum": 111
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 09",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 632,
					"offsetEnd": 633,
					"columnNum": 112
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 09",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 634,
					"offsetEnd": 635,
					"columnNum": 113
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 09",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 636,
					"offsetEnd": 636,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 09",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_09",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 637,
					"offsetEnd": 637,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 10",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 638,
					"offsetEnd": 639,
					"columnNum": 116
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 10",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 640,
					"offsetEnd": 641,
					"columnNum": 117
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 10",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 642,
					"offsetEnd": 642,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 10",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 643,
					"offsetEnd": 644,
					"columnNum": 119
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 10",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 645,
					"offsetEnd": 646,
					"columnNum": 120
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 10",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 647,
					"offsetEnd": 647,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 10",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 648,
					"offsetEnd": 648,
					"columnNum": 122
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 11",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 649,
					"offsetEnd": 650,
					"columnNum": 123
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 11",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 651,
					"offsetEnd": 652,
					"columnNum": 124
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 11",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 653,
					"offsetEnd": 653,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 11",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 654,
					"offsetEnd": 655,
					"columnNum": 126
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 11",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 656,
					"offsetEnd": 657,
					"columnNum": 127
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 11",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 658,
					"offsetEnd": 658,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 11",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 659,
					"offsetEnd": 659,
					"columnNum": 129
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 12",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 660,
					"offsetEnd": 661,
					"columnNum": 130
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 12",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 662,
					"offsetEnd": 663,
					"columnNum": 131
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 12",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 664,
					"offsetEnd": 664,
					"columnNum": 132
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 12",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 665,
					"offsetEnd": 666,
					"columnNum": 133
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 12",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 667,
					"offsetEnd": 668,
					"columnNum": 134
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 12",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 669,
					"offsetEnd": 669,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 12",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 670,
					"offsetEnd": 670,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 13",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 671,
					"offsetEnd": 672,
					"columnNum": 137
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 13",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 673,
					"offsetEnd": 674,
					"columnNum": 138
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 13",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 675,
					"offsetEnd": 675,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 13",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 676,
					"offsetEnd": 677,
					"columnNum": 140
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 13",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 678,
					"offsetEnd": 679,
					"columnNum": 141
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 13",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 680,
					"offsetEnd": 680,
					"columnNum": 142
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 13",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 681,
					"offsetEnd": 681,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 14",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 682,
					"offsetEnd": 683,
					"columnNum": 144
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 14",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 684,
					"offsetEnd": 685,
					"columnNum": 145
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 14",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 686,
					"offsetEnd": 686,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 14",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 687,
					"offsetEnd": 688,
					"columnNum": 147
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 14",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 689,
					"offsetEnd": 690,
					"columnNum": 148
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 14",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 691,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 14",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 692,
					"offsetEnd": 692,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 15",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 693,
					"offsetEnd": 694,
					"columnNum": 151
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 15",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 695,
					"offsetEnd": 696,
					"columnNum": 152
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 15",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 697,
					"offsetEnd": 697,
					"columnNum": 153
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 15",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 698,
					"offsetEnd": 699,
					"columnNum": 154
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 15",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 700,
					"offsetEnd": 701,
					"columnNum": 155
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 15",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 702,
					"offsetEnd": 702,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 15",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 703,
					"offsetEnd": 703,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 16",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 704,
					"offsetEnd": 705,
					"columnNum": 158
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 16",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 706,
					"offsetEnd": 707,
					"columnNum": 159
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 16",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 708,
					"offsetEnd": 708,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 16",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 709,
					"offsetEnd": 710,
					"columnNum": 161
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 16",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 711,
					"offsetEnd": 712,
					"columnNum": 162
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 16",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 713,
					"offsetEnd": 713,
					"columnNum": 163
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 16",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 714,
					"offsetEnd": 714,
					"columnNum": 164
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 17",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 715,
					"offsetEnd": 716,
					"columnNum": 165
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 17",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 717,
					"offsetEnd": 718,
					"columnNum": 166
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 17",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 719,
					"offsetEnd": 719,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 17",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 720,
					"offsetEnd": 721,
					"columnNum": 168
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 17",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 722,
					"offsetEnd": 723,
					"columnNum": 169
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 17",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 724,
					"offsetEnd": 724,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 17",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 725,
					"offsetEnd": 725,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 18",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 726,
					"offsetEnd": 727,
					"columnNum": 172
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 18",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 728,
					"offsetEnd": 729,
					"columnNum": 173
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 18",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 730,
					"offsetEnd": 730,
					"columnNum": 174
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 18",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 731,
					"offsetEnd": 732,
					"columnNum": 175
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 18",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 733,
					"offsetEnd": 734,
					"columnNum": 176
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 18",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 735,
					"offsetEnd": 735,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 18",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 736,
					"offsetEnd": 736,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 19",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 737,
					"offsetEnd": 738,
					"columnNum": 179
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 19",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 739,
					"offsetEnd": 740,
					"columnNum": 180
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 19",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 741,
					"offsetEnd": 741,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 19",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 742,
					"offsetEnd": 743,
					"columnNum": 182
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 19",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 744,
					"offsetEnd": 745,
					"columnNum": 183
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 19",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 746,
					"offsetEnd": 746,
					"columnNum": 184
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 19",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 747,
					"offsetEnd": 747,
					"columnNum": 185
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 20",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 748,
					"offsetEnd": 749,
					"columnNum": 186
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 20",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 750,
					"offsetEnd": 751,
					"columnNum": 187
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 20",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 752,
					"offsetEnd": 752,
					"columnNum": 188
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 20",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 753,
					"offsetEnd": 754,
					"columnNum": 189
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 20",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 755,
					"offsetEnd": 756,
					"columnNum": 190
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 20",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 757,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 20",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 758,
					"offsetEnd": 758,
					"columnNum": 192
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 21",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 759,
					"offsetEnd": 760,
					"columnNum": 193
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 21",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 761,
					"offsetEnd": 762,
					"columnNum": 194
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 21",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 763,
					"offsetEnd": 763,
					"columnNum": 195
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 21",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 764,
					"offsetEnd": 765,
					"columnNum": 196
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 21",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 766,
					"offsetEnd": 767,
					"columnNum": 197
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 21",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 768,
					"offsetEnd": 768,
					"columnNum": 198
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 21",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 769,
					"offsetEnd": 769,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 22",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 770,
					"offsetEnd": 771,
					"columnNum": 200
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 22",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 772,
					"offsetEnd": 773,
					"columnNum": 201
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 22",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 774,
					"offsetEnd": 774,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 22",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 776,
					"columnNum": 203
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 22",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 778,
					"columnNum": 204
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 22",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 779,
					"offsetEnd": 779,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 22",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 780,
					"offsetEnd": 780,
					"columnNum": 206
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 23",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 782,
					"columnNum": 207
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 23",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 783,
					"offsetEnd": 784,
					"columnNum": 208
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 23",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 785,
					"offsetEnd": 785,
					"columnNum": 209
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 23",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 786,
					"offsetEnd": 787,
					"columnNum": 210
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 23",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 788,
					"offsetEnd": 789,
					"columnNum": 211
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 23",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 790,
					"offsetEnd": 790,
					"columnNum": 212
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 23",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 791,
					"offsetEnd": 791,
					"columnNum": 213
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 24",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 792,
					"offsetEnd": 793,
					"columnNum": 214
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 24",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 794,
					"offsetEnd": 795,
					"columnNum": 215
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 24",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 796,
					"offsetEnd": 796,
					"columnNum": 216
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 24",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 797,
					"offsetEnd": 798,
					"columnNum": 217
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 24",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 799,
					"offsetEnd": 800,
					"columnNum": 218
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 24",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 801,
					"offsetEnd": 801,
					"columnNum": 219
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 24",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 802,
					"offsetEnd": 802,
					"columnNum": 220
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 25",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 803,
					"offsetEnd": 804,
					"columnNum": 221
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 25",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 805,
					"offsetEnd": 806,
					"columnNum": 222
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 25",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 807,
					"offsetEnd": 807,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 25",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 808,
					"offsetEnd": 809,
					"columnNum": 224
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 25",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 810,
					"offsetEnd": 811,
					"columnNum": 225
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 25",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 812,
					"offsetEnd": 812,
					"columnNum": 226
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 25",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 813,
					"offsetEnd": 813,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 26",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 814,
					"offsetEnd": 815,
					"columnNum": 228
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 26",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 816,
					"offsetEnd": 817,
					"columnNum": 229
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 26",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 818,
					"offsetEnd": 818,
					"columnNum": 230
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 26",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 819,
					"offsetEnd": 820,
					"columnNum": 231
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 26",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 821,
					"offsetEnd": 822,
					"columnNum": 232
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 06",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_06",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 823,
					"offsetEnd": 823,
					"columnNum": 233
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 26",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 824,
					"offsetEnd": 824,
					"columnNum": 234
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 27",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 825,
					"offsetEnd": 826,
					"columnNum": 235
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 27",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 827,
					"offsetEnd": 828,
					"columnNum": 236
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 27",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 829,
					"offsetEnd": 829,
					"columnNum": 237
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 27",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 830,
					"offsetEnd": 831,
					"columnNum": 238
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 27",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 832,
					"offsetEnd": 833,
					"columnNum": 239
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 27",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 834,
					"offsetEnd": 834,
					"columnNum": 240
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 27",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 835,
					"offsetEnd": 835,
					"columnNum": 241
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 28",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 836,
					"offsetEnd": 837,
					"columnNum": 242
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 28",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 838,
					"offsetEnd": 839,
					"columnNum": 243
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 28",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 840,
					"offsetEnd": 840,
					"columnNum": 244
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 28",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 841,
					"offsetEnd": 842,
					"columnNum": 245
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 28",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 843,
					"offsetEnd": 844,
					"columnNum": 246
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 28",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 845,
					"offsetEnd": 845,
					"columnNum": 247
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 28",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 846,
					"offsetEnd": 846,
					"columnNum": 248
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 29",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 847,
					"offsetEnd": 848,
					"columnNum": 249
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 29",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 849,
					"offsetEnd": 850,
					"columnNum": 250
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 29",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 851,
					"offsetEnd": 851,
					"columnNum": 251
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 29",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 852,
					"offsetEnd": 853,
					"columnNum": 252
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 29",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 854,
					"offsetEnd": 855,
					"columnNum": 253
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 29",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 856,
					"offsetEnd": 856,
					"columnNum": 254
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 29",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 857,
					"offsetEnd": 857,
					"columnNum": 255
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADMIN YEAR 30",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 858,
					"offsetEnd": 859,
					"columnNum": 256
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM CODE 30",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 860,
					"offsetEnd": 861,
					"columnNum": 257
				},
				"fieldLength": 2,
				"expectedValues": ["07", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM GRADE 30",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 862,
					"offsetEnd": 862,
					"columnNum": 258
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #1 30",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#1_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 863,
					"offsetEnd": 864,
					"columnNum": 259
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IRREGULARITY CODE #2 30",
				"otherPossibleNames": [],
				"logicalName": "IRREGULARITY_CODE_#2_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 865,
					"offsetEnd": 866,
					"columnNum": 260
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXAM SUPPRESSION FLAG 30",
				"otherPossibleNames": [],
				"logicalName": "EXAM_SUPPRESSION_FLAG_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 867,
					"offsetEnd": 867,
					"columnNum": 261
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CLASS SECTION CODE 30",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 868,
					"offsetEnd": 868,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DATE GRADES RELEASED TO COLLEGE",
				"otherPossibleNames": [],
				"logicalName": "DATE_GRADES_RELEASED_TO_COLLEGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 869,
					"offsetEnd": 874,
					"columnNum": 263
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "DATE OF LAST STUDENT UPDATE",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_LAST_STUDENT_UPDATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 875,
					"offsetEnd": 880,
					"columnNum": 264
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "DATE OF THIS REPORT",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_THIS_REPORT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 881,
					"offsetEnd": 886,
					"columnNum": 265
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "SERVICE TYPE",
				"otherPossibleNames": [],
				"logicalName": "SERVICE_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 887,
					"offsetEnd": 888,
					"columnNum": 266
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SERVICE CODE",
				"otherPossibleNames": [],
				"logicalName": "SERVICE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 889,
					"offsetEnd": 892,
					"columnNum": 267
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ORDER INSTITUTION KEY",
				"otherPossibleNames": [],
				"logicalName": "ORDER_INSTITUTION_KEY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 893,
					"offsetEnd": 900,
					"columnNum": 268
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER2",
				"otherPossibleNames": [],
				"logicalName": "FILLER2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 901,
					"offsetEnd": 910,
					"columnNum": 269
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}