{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "COGAT_FW",
		"recordLength": 5682,
		"naturalKey": ["STUDENT_ID", "STUDENT_FIRST_NAME", "STUDENT_LAST_NAME", "DATE_OF_BIRTH", "QUARTERMONTH"],
		"fields": [{
				"physicalName": "Order Number",
				"otherPossibleNames": [],
				"logicalName": "ORDER_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 30,
					"columnNum": 1
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test",
				"otherPossibleNames": [],
				"logicalName": "TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 31,
					"offsetEnd": 38,
					"columnNum": 2
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "State Name",
				"otherPossibleNames": [],
				"logicalName": "STATE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 39,
					"offsetEnd": 68,
					"columnNum": 3
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Region Name",
				"otherPossibleNames": [],
				"logicalName": "REGION_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 69,
					"offsetEnd": 98,
					"columnNum": 4
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Region Code",
				"otherPossibleNames": [],
				"logicalName": "REGION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 99,
					"offsetEnd": 113,
					"columnNum": 5
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "System Name",
				"otherPossibleNames": [],
				"logicalName": "SYSTEM_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 114,
					"offsetEnd": 143,
					"columnNum": 6
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "System Code",
				"otherPossibleNames": [],
				"logicalName": "SYSTEM_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 144,
					"offsetEnd": 158,
					"columnNum": 7
				},
				"fieldLength": 15,
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
					"offsetStart": 159,
					"offsetEnd": 188,
					"columnNum": 8
				},
				"fieldLength": 30,
				"expectedValues": [],
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
					"offsetStart": 189,
					"offsetEnd": 203,
					"columnNum": 9
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Building Name",
				"otherPossibleNames": [],
				"logicalName": "BUILDING_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 204,
					"offsetEnd": 233,
					"columnNum": 10
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Building Code",
				"otherPossibleNames": [],
				"logicalName": "BUILDING_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 234,
					"offsetEnd": 248,
					"columnNum": 11
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Class Name",
				"otherPossibleNames": [],
				"logicalName": "CLASS_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 249,
					"offsetEnd": 278,
					"columnNum": 12
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Class Code",
				"otherPossibleNames": [],
				"logicalName": "CLASS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 279,
					"offsetEnd": 293,
					"columnNum": 13
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Class Grade",
				"otherPossibleNames": [],
				"logicalName": "CLASS_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 294,
					"offsetEnd": 295,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Date Tested",
				"otherPossibleNames": [],
				"logicalName": "DATE_TESTED",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 296,
					"offsetEnd": 303,
					"columnNum": 15
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
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
					"offsetStart": 304,
					"offsetEnd": 323,
					"columnNum": 16
				},
				"fieldLength": 20,
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
					"offsetStart": 324,
					"offsetEnd": 343,
					"columnNum": 17
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Name/Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 344,
					"offsetEnd": 363,
					"columnNum": 18
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "GUID",
				"otherPossibleNames": [],
				"logicalName": "GUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 364,
					"offsetEnd": 403,
					"columnNum": 19
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student ID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 404,
					"offsetEnd": 414,
					"columnNum": 20
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Secondary Student ID",
				"otherPossibleNames": [],
				"logicalName": "SECONDARY_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 415,
					"offsetEnd": 434,
					"columnNum": 21
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Gender",
				"otherPossibleNames": [],
				"logicalName": "GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 435,
					"offsetEnd": 435,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": ["F", "M", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 436,
					"offsetEnd": 443,
					"columnNum": 23
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "Age in Months",
				"otherPossibleNames": [],
				"logicalName": "AGE_IN_MONTHS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 444,
					"offsetEnd": 447,
					"columnNum": 24
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age in Years/Months",
				"otherPossibleNames": [],
				"logicalName": "AGE_IN_YEARS_MONTHS",
				"formatMask": "yyMM",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 448,
					"offsetEnd": 451,
					"columnNum": 25
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Ethnicity String ",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_STRING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 452,
					"offsetEnd": 465,
					"columnNum": 26
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 466,
					"offsetEnd": 466,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Battery",
				"otherPossibleNames": [],
				"logicalName": "BATTERY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 467,
					"offsetEnd": 467,
					"columnNum": 28
				},
				"fieldLength": 1,
				"expectedValues": ["C", "S", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Level",
				"otherPossibleNames": [],
				"logicalName": "LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 468,
					"offsetEnd": 469,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": [],
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
					"offsetStart": 470,
					"offsetEnd": 470,
					"columnNum": 30
				},
				"fieldLength": 1,
				"expectedValues": ["7", "8"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Norm Year",
				"otherPossibleNames": [],
				"logicalName": "NORM_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 471,
					"offsetEnd": 472,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Quartermonth",
				"otherPossibleNames": [],
				"logicalName": "QUARTERMONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 473,
					"offsetEnd": 479,
					"columnNum": 32
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Semester",
				"otherPossibleNames": [],
				"logicalName": "SEMESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 480,
					"offsetEnd": 480,
					"columnNum": 33
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Home Reporting",
				"otherPossibleNames": [],
				"logicalName": "HOME_REPORTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 481,
					"offsetEnd": 481,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Programs String",
				"otherPossibleNames": [],
				"logicalName": "PROGRAMS_STRING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 482,
					"offsetEnd": 502,
					"columnNum": 35
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Info Field 1 Value",
				"otherPossibleNames": [],
				"logicalName": "OTHER_INFO_FIELD_1_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 503,
					"offsetEnd": 505,
					"columnNum": 36
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Info Field 2 Value",
				"otherPossibleNames": [],
				"logicalName": "OTHER_INFO_FIELD_2_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 506,
					"offsetEnd": 508,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Info Field 3 Value",
				"otherPossibleNames": [],
				"logicalName": "OTHER_INFO_FIELD_3_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 509,
					"offsetEnd": 511,
					"columnNum": 38
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Other Info Field 4 Value",
				"otherPossibleNames": [],
				"logicalName": "OTHER_INFO_FIELD_4_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 512,
					"offsetEnd": 514,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 515,
					"offsetEnd": 515,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Office Use Subtest Exclusion",
				"otherPossibleNames": [],
				"logicalName": "OFFICE_USE_SUBTEST_EXCLUSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 516,
					"offsetEnd": 545,
					"columnNum": 41
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 546,
					"offsetEnd": 546,
					"columnNum": 42
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Office Use Only Z Value",
				"otherPossibleNames": [],
				"logicalName": "OFFICE_USE_ONLY_Z_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 547,
					"offsetEnd": 547,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Code Character String (A-T)",
				"otherPossibleNames": [],
				"logicalName": "CODE_CHARACTER_STRING_A-T",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 548,
					"offsetEnd": 567,
					"columnNum": 44
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 568,
					"offsetEnd": 577,
					"columnNum": 45
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use A Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_A_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 578,
					"offsetEnd": 578,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 579,
					"offsetEnd": 588,
					"columnNum": 47
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use B Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_B_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 589,
					"offsetEnd": 589,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 590,
					"offsetEnd": 599,
					"columnNum": 49
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use C Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_C_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 600,
					"offsetEnd": 600,
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 601,
					"offsetEnd": 610,
					"columnNum": 51
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use D Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_D_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 611,
					"offsetEnd": 611,
					"columnNum": 52
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 612,
					"offsetEnd": 621,
					"columnNum": 53
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use E Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_E_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 622,
					"offsetEnd": 622,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 623,
					"offsetEnd": 632,
					"columnNum": 55
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use F Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_F_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 633,
					"offsetEnd": 633,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use G Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_G_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 634,
					"offsetEnd": 635,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use H Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_H_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 636,
					"offsetEnd": 637,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use I Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_I_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 638,
					"offsetEnd": 639,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use J Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_J_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 640,
					"offsetEnd": 641,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use K Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_K_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 642,
					"offsetEnd": 643,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use L Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_L_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 644,
					"offsetEnd": 645,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use M Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_M_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 646,
					"offsetEnd": 647,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 648,
					"offsetEnd": 657,
					"columnNum": 64
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use N Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_N_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 658,
					"offsetEnd": 658,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 659,
					"offsetEnd": 668,
					"columnNum": 66
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use O Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_O_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 669,
					"offsetEnd": 669,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 670,
					"offsetEnd": 679,
					"columnNum": 68
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use P Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_P_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 680,
					"offsetEnd": 680,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 681,
					"offsetEnd": 690,
					"columnNum": 70
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use Q Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_Q_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 691,
					"columnNum": 71
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 692,
					"offsetEnd": 701,
					"columnNum": 72
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use R Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_R_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 702,
					"offsetEnd": 702,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 703,
					"offsetEnd": 712,
					"columnNum": 74
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Administrator Use S Value",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATOR_USE_S_VALUE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 713,
					"offsetEnd": 713,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 714,
					"offsetEnd": 753,
					"columnNum": 76
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Verbal",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 754,
					"offsetEnd": 755,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 756,
					"offsetEnd": 757,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 758,
					"offsetEnd": 759,
					"columnNum": 79
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 760,
					"offsetEnd": 761,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 762,
					"offsetEnd": 763,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 764,
					"offsetEnd": 765,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 766,
					"offsetEnd": 767,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number Attempted (NA)",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 768,
					"offsetEnd": 813,
					"columnNum": 84
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Verbal",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 814,
					"offsetEnd": 814,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 815,
					"offsetEnd": 815,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 816,
					"offsetEnd": 816,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 817,
					"offsetEnd": 817,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 818,
					"offsetEnd": 818,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 819,
					"offsetEnd": 819,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 820,
					"offsetEnd": 820,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Completion Criteria (CC)",
				"otherPossibleNames": [],
				"logicalName": "COMPLETION_CRITERIA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 821,
					"offsetEnd": 843,
					"columnNum": 92
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Verbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 844,
					"offsetEnd": 845,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 846,
					"offsetEnd": 847,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 848,
					"offsetEnd": 849,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 850,
					"offsetEnd": 851,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 852,
					"offsetEnd": 853,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 854,
					"offsetEnd": 855,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 856,
					"offsetEnd": 857,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score (RS)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 858,
					"offsetEnd": 903,
					"columnNum": 100
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Verbal",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 904,
					"offsetEnd": 906,
					"columnNum": 101
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 907,
					"offsetEnd": 909,
					"columnNum": 102
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 910,
					"offsetEnd": 912,
					"columnNum": 103
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 913,
					"offsetEnd": 915,
					"columnNum": 104
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 916,
					"offsetEnd": 918,
					"columnNum": 105
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 919,
					"offsetEnd": 921,
					"columnNum": 106
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 922,
					"offsetEnd": 924,
					"columnNum": 107
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Universal Scale Score (USS)",
				"otherPossibleNames": [],
				"logicalName": "UNIVERSAL_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 925,
					"offsetEnd": 993,
					"columnNum": 108
				},
				"fieldLength": 69,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 994,
					"offsetEnd": 1113,
					"columnNum": 109
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Verbal",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1114,
					"offsetEnd": 1116,
					"columnNum": 110
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1117,
					"offsetEnd": 1119,
					"columnNum": 111
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1120,
					"offsetEnd": 1122,
					"columnNum": 112
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1123,
					"offsetEnd": 1125,
					"columnNum": 113
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1126,
					"offsetEnd": 1128,
					"columnNum": 114
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1129,
					"offsetEnd": 1131,
					"columnNum": 115
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1132,
					"offsetEnd": 1134,
					"columnNum": 116
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Age Score (SAS)",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_AGE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1135,
					"offsetEnd": 1203,
					"columnNum": 117
				},
				"fieldLength": 69,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Verbal",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1204,
					"offsetEnd": 1205,
					"columnNum": 118
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1206,
					"offsetEnd": 1207,
					"columnNum": 119
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1208,
					"offsetEnd": 1209,
					"columnNum": 120
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1210,
					"offsetEnd": 1211,
					"columnNum": 121
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1212,
					"offsetEnd": 1213,
					"columnNum": 122
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1214,
					"offsetEnd": 1215,
					"columnNum": 123
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1216,
					"offsetEnd": 1217,
					"columnNum": 124
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Percentile Rank (GPR)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_PERCENTILE_RANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1218,
					"offsetEnd": 1263,
					"columnNum": 125
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Verbal",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1264,
					"offsetEnd": 1265,
					"columnNum": 126
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1266,
					"offsetEnd": 1267,
					"columnNum": 127
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1268,
					"offsetEnd": 1269,
					"columnNum": 128
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1270,
					"offsetEnd": 1271,
					"columnNum": 129
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1272,
					"offsetEnd": 1273,
					"columnNum": 130
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1274,
					"offsetEnd": 1275,
					"columnNum": 131
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1276,
					"offsetEnd": 1277,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Percentile Rank (APR)",
				"otherPossibleNames": [],
				"logicalName": "AGE_PERCENTILE_RANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1278,
					"offsetEnd": 1323,
					"columnNum": 133
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1324,
					"offsetEnd": 1383,
					"columnNum": 134
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Verbal",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1384,
					"offsetEnd": 1384,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1385,
					"offsetEnd": 1385,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1386,
					"offsetEnd": 1386,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1387,
					"offsetEnd": 1387,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1388,
					"offsetEnd": 1388,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1389,
					"offsetEnd": 1389,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS) Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1390,
					"offsetEnd": 1390,
					"columnNum": 141
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Stanine (GS)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_STANINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1391,
					"offsetEnd": 1413,
					"columnNum": 142
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS) Verbal",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1414,
					"offsetEnd": 1414,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS) Quantitative",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1415,
					"offsetEnd": 1415,
					"columnNum": 144
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS) Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1416,
					"offsetEnd": 1416,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS) Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1417,
					"offsetEnd": 1417,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS) Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1418,
					"offsetEnd": 1418,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS) Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1419,
					"offsetEnd": 1419,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS)  Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1420,
					"offsetEnd": 1420,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Age Stanine (AS)",
				"otherPossibleNames": [],
				"logicalName": "AGE_STANINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1421,
					"offsetEnd": 1443,
					"columnNum": 150
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1444,
					"offsetEnd": 1473,
					"columnNum": 151
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Valid Flags",
				"otherPossibleNames": [],
				"logicalName": "SAS_VALID_FLAGS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1474,
					"offsetEnd": 1503,
					"columnNum": 152
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TMO Flags",
				"otherPossibleNames": [],
				"logicalName": "TMO_FLAGS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1504,
					"offsetEnd": 1533,
					"columnNum": 153
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Extremely Variable Flags",
				"otherPossibleNames": [],
				"logicalName": "EXTREMELY_VARIABLE_FLAGS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1534,
					"offsetEnd": 1563,
					"columnNum": 154
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Chance Flags ",
				"otherPossibleNames": [],
				"logicalName": "CHANCE_FLAGS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1564,
					"offsetEnd": 1593,
					"columnNum": 155
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Ability Profile ",
				"otherPossibleNames": [],
				"logicalName": "ABILITY_PROFILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1594,
					"offsetEnd": 1603,
					"columnNum": 156
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1604,
					"offsetEnd": 1693,
					"columnNum": 157
				},
				"fieldLength": 90,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1694,
					"offsetEnd": 1813,
					"columnNum": 158
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1814,
					"offsetEnd": 1873,
					"columnNum": 159
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1874,
					"offsetEnd": 1993,
					"columnNum": 160
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1994,
					"offsetEnd": 2113,
					"columnNum": 161
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2114,
					"offsetEnd": 2203,
					"columnNum": 162
				},
				"fieldLength": 90,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Verbal",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2204,
					"offsetEnd": 2205,
					"columnNum": 163
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Quantitative",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2206,
					"offsetEnd": 2207,
					"columnNum": 164
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2208,
					"offsetEnd": 2209,
					"columnNum": 165
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2210,
					"offsetEnd": 2211,
					"columnNum": 166
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2212,
					"offsetEnd": 2213,
					"columnNum": 167
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2214,
					"offsetEnd": 2215,
					"columnNum": 168
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2216,
					"offsetEnd": 2217,
					"columnNum": 169
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Percentile Rank",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_PERCENTILE_RANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2218,
					"offsetEnd": 2263,
					"columnNum": 170
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines Verbal",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2264,
					"offsetEnd": 2264,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines Quantitative",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2265,
					"offsetEnd": 2265,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2266,
					"offsetEnd": 2266,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2267,
					"offsetEnd": 2267,
					"columnNum": 174
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2268,
					"offsetEnd": 2268,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2269,
					"offsetEnd": 2269,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines  Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2270,
					"offsetEnd": 2270,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Local Stanines",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STANINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2271,
					"offsetEnd": 2293,
					"columnNum": 178
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2294,
					"offsetEnd": 2353,
					"columnNum": 179
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2354,
					"offsetEnd": 2413,
					"columnNum": 180
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2414,
					"offsetEnd": 2416,
					"columnNum": 181
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2417,
					"offsetEnd": 2419,
					"columnNum": 182
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2420,
					"offsetEnd": 2422,
					"columnNum": 183
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2423,
					"offsetEnd": 2425,
					"columnNum": 184
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2426,
					"offsetEnd": 2428,
					"columnNum": 185
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2429,
					"offsetEnd": 2431,
					"columnNum": 186
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Verbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2432,
					"offsetEnd": 2438,
					"columnNum": 187
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Quantitative",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2439,
					"offsetEnd": 2445,
					"columnNum": 188
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2446,
					"offsetEnd": 2452,
					"columnNum": 189
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2453,
					"offsetEnd": 2459,
					"columnNum": 190
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2460,
					"offsetEnd": 2466,
					"columnNum": 191
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2467,
					"offsetEnd": 2473,
					"columnNum": 192
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2474,
					"offsetEnd": 2480,
					"columnNum": 193
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Personal Standard Error",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2481,
					"offsetEnd": 2641,
					"columnNum": 194
				},
				"fieldLength": 161,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Verbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2642,
					"offsetEnd": 2648,
					"columnNum": 195
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Quantitative",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2649,
					"offsetEnd": 2655,
					"columnNum": 196
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2656,
					"offsetEnd": 2662,
					"columnNum": 197
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2663,
					"offsetEnd": 2669,
					"columnNum": 198
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2670,
					"offsetEnd": 2676,
					"columnNum": 199
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2677,
					"offsetEnd": 2683,
					"columnNum": 200
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2684,
					"offsetEnd": 2690,
					"columnNum": 201
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Upper Bound",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_UPPER_BOUND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2691,
					"offsetEnd": 2851,
					"columnNum": 202
				},
				"fieldLength": 161,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Verbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2852,
					"offsetEnd": 2858,
					"columnNum": 203
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Quantitative",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2859,
					"offsetEnd": 2865,
					"columnNum": 204
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2866,
					"offsetEnd": 2872,
					"columnNum": 205
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2873,
					"offsetEnd": 2879,
					"columnNum": 206
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2880,
					"offsetEnd": 2886,
					"columnNum": 207
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2887,
					"offsetEnd": 2893,
					"columnNum": 208
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2894,
					"offsetEnd": 2900,
					"columnNum": 209
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score Lower Bound",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_LOWER_BOUND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2901,
					"offsetEnd": 3061,
					"columnNum": 210
				},
				"fieldLength": 161,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Verbal",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3062,
					"offsetEnd": 3067,
					"columnNum": 211
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Quantitative",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3068,
					"offsetEnd": 3073,
					"columnNum": 212
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3074,
					"offsetEnd": 3079,
					"columnNum": 213
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3080,
					"offsetEnd": 3085,
					"columnNum": 214
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3086,
					"offsetEnd": 3091,
					"columnNum": 215
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3092,
					"offsetEnd": 3097,
					"columnNum": 216
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3098,
					"offsetEnd": 3103,
					"columnNum": 217
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Upper Bound",
				"otherPossibleNames": [],
				"logicalName": "SAS_UPPER_BOUND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3104,
					"offsetEnd": 3241,
					"columnNum": 218
				},
				"fieldLength": 138,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Verbal",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_VERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3242,
					"offsetEnd": 3247,
					"columnNum": 219
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Quantitative",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_QUANTITATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3248,
					"offsetEnd": 3253,
					"columnNum": 220
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Nonverbal",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_NONVERBAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3254,
					"offsetEnd": 3259,
					"columnNum": 221
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Composite (V+Q)",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_VQ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3260,
					"offsetEnd": 3265,
					"columnNum": 222
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Composite (V+N)",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_VN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3266,
					"offsetEnd": 3271,
					"columnNum": 223
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Composite (Q+N)",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_QN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3272,
					"offsetEnd": 3277,
					"columnNum": 224
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound Composite (V+Q+N)",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND_VQN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3278,
					"offsetEnd": 3283,
					"columnNum": 225
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SAS Lower Bound ",
				"otherPossibleNames": [],
				"logicalName": "SAS_LOWER_BOUND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3284,
					"offsetEnd": 3421,
					"columnNum": 226
				},
				"fieldLength": 138,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3422,
					"offsetEnd": 3481,
					"columnNum": 227
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3482,
					"offsetEnd": 3485,
					"columnNum": 228
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3486,
					"offsetEnd": 3489,
					"columnNum": 229
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3490,
					"offsetEnd": 3493,
					"columnNum": 230
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3494,
					"offsetEnd": 3494,
					"columnNum": 231
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3495,
					"offsetEnd": 3498,
					"columnNum": 232
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3499,
					"offsetEnd": 3499,
					"columnNum": 233
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_41",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3500,
					"offsetEnd": 3589,
					"columnNum": 234
				},
				"fieldLength": 90,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_42",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3590,
					"offsetEnd": 3679,
					"columnNum": 235
				},
				"fieldLength": 90,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_43",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3680,
					"offsetEnd": 3769,
					"columnNum": 236
				},
				"fieldLength": 90,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_44",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3770,
					"offsetEnd": 3949,
					"columnNum": 237
				},
				"fieldLength": 180,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_45",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3950,
					"offsetEnd": 4029,
					"columnNum": 238
				},
				"fieldLength": 80,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_46",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4030,
					"offsetEnd": 4149,
					"columnNum": 239
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_47",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4150,
					"offsetEnd": 4179,
					"columnNum": 240
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Item Responses (1-660)",
				"otherPossibleNames": [],
				"logicalName": "ITEM_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4180,
					"offsetEnd": 4839,
					"columnNum": 241
				},
				"fieldLength": 660,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_48",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4840,
					"offsetEnd": 4929,
					"columnNum": 242
				},
				"fieldLength": 90,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_49",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4930,
					"offsetEnd": 5049,
					"columnNum": 243
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_50",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5050,
					"offsetEnd": 5109,
					"columnNum": 244
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_51",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5110,
					"offsetEnd": 5139,
					"columnNum": 245
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Mode of Administration",
				"otherPossibleNames": [],
				"logicalName": "MODE_OF_ADMINISTRATION_STRING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5140,
					"offsetEnd": 5159,
					"columnNum": 246
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestInstance GUID",
				"otherPossibleNames": [],
				"logicalName": "TEST_INSTANCE_GUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5160,
					"offsetEnd": 5199,
					"columnNum": 247
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER_52",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5200,
					"offsetEnd": 5319,
					"columnNum": 248
				},
				"fieldLength": 120,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_53",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 5320,
                    "offsetEnd": 5439,
                    "columnNum": 249
                },
                "fieldLength": 120,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_54",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 5440,
                    "offsetEnd": 5559,
                    "columnNum": 250
                },
                "fieldLength": 120,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_55",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 5560,
                    "offsetEnd": 5679,
                    "columnNum": 251
                },
                "fieldLength": 120,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Administration Language",
                "otherPossibleNames": [],
                "logicalName": "ADMINISTRATION_LANGUAGE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 5680,
                    "offsetEnd": 5682,
                    "columnNum": 252
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            }
		]
	},
	"fileExtensions": [".csv",".txt"]
}