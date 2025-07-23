{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "COGAT_FW_4579",
		"recordLength": 4579,
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
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
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Building Name",
                "otherPossibleNames": [],
                "logicalName": "BUILDING_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 159,
                    "offsetEnd": 188,
                    "columnNum": 8
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Building Code",
                "otherPossibleNames": [],
                "logicalName": "BUILDING_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 189,
                    "offsetEnd": 203,
                    "columnNum": 9
                },
                "fieldLength": 15,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Class Name",
                "otherPossibleNames": [],
                "logicalName": "CLASS_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 204,
                    "offsetEnd": 233,
                    "columnNum": 10
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Class Code",
                "otherPossibleNames": [],
                "logicalName": "CLASS_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 234,
                    "offsetEnd": 248,
                    "columnNum": 11
                },
                "fieldLength": 15,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Class Grade",
                "otherPossibleNames": [],
                "logicalName": "CLASS_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 249,
                    "offsetEnd": 250,
                    "columnNum": 12
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Date Tested",
                "otherPossibleNames": [],
                "logicalName": "DATE_TESTED",
                "formatMask": "MMDDYYYY",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 251,
                    "offsetEnd": 258,
                    "columnNum": 13
                },
                "fieldLength": 8,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "DATE",
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
                    "offsetStart": 259,
                    "offsetEnd": 278,
                    "columnNum": 14
                },
                "fieldLength": 20,
                "fieldPrecision": null,
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
                    "offsetStart": 279,
                    "offsetEnd": 298,
                    "columnNum": 15
                },
                "fieldLength": 20,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Gender",
                "otherPossibleNames": [],
                "logicalName": "GENDER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 299,
                    "offsetEnd": 299,
                    "columnNum": 16
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Date of Birth",
                "otherPossibleNames": [],
                "logicalName": "DATE_OF_BIRTH",
                "formatMask": "MM  YYYY",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 300,
                    "offsetEnd": 307,
                    "columnNum": 17
                },
                "fieldLength": 8,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "DATE",
                "scale": null
            },
            {
                "physicalName": "Student ID",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 308,
                    "offsetEnd": 318,
                    "columnNum": 18
                },
                "fieldLength": 11,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Battery",
                "otherPossibleNames": [],
                "logicalName": "BATTERY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 319,
                    "offsetEnd": 319,
                    "columnNum": 19
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Level",
                "otherPossibleNames": [],
                "logicalName": "LEVEL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 320,
                    "offsetEnd": 321,
                    "columnNum": 20
                },
                "fieldLength": 2,
                "fieldPrecision": null,
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
                    "offsetStart": 322,
                    "offsetEnd": 322,
                    "columnNum": 21
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Norm Year",
                "otherPossibleNames": [],
                "logicalName": "NORM_YEAR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 323,
                    "offsetEnd": 324,
                    "columnNum": 22
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Quartermonth",
                "otherPossibleNames": [],
                "logicalName": "QUARTERMONTH",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 325,
                    "offsetEnd": 331,
                    "columnNum": 23
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "DATE",
                "scale": null
            },
            {
                "physicalName": "Semester",
                "otherPossibleNames": [],
                "logicalName": "SEMESTER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 332,
                    "offsetEnd": 332,
                    "columnNum": 24
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 333,
                    "offsetEnd": 333,
                    "columnNum": 25
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age in Months",
                "otherPossibleNames": [],
                "logicalName": "AGE_IN_MONTHS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 334,
                    "offsetEnd": 337,
                    "columnNum": 26
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age in Years\/Months",
                "otherPossibleNames": [],
                "logicalName": "AGE_IN_YEARS_MONTHS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 338,
                    "offsetEnd": 341,
                    "columnNum": 27
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 342,
                    "offsetEnd": 371,
                    "columnNum": 28
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Admin Use Z Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_Z_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 372,
                    "offsetEnd": 381,
                    "columnNum": 29
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Admin Use Z No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_Z_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 382,
                    "offsetEnd": 382,
                    "columnNum": 30
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Admin Use Z Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_Z_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 383,
                    "offsetEnd": 383,
                    "columnNum": 31
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Admin Use Z Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_Z_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 384,
                    "offsetEnd": 384,
                    "columnNum": 32
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Verbal",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 385,
                    "offsetEnd": 386,
                    "columnNum": 33
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 387,
                    "offsetEnd": 388,
                    "columnNum": 34
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 389,
                    "offsetEnd": 390,
                    "columnNum": 35
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 391,
                    "offsetEnd": 392,
                    "columnNum": 36
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 393,
                    "offsetEnd": 394,
                    "columnNum": 37
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 395,
                    "offsetEnd": 396,
                    "columnNum": 38
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 397,
                    "offsetEnd": 398,
                    "columnNum": 39
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Number Attempted (NA)",
                "otherPossibleNames": [],
                "logicalName": "NUMBER_ATTEMPTED",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 399,
                    "offsetEnd": 444,
                    "columnNum": 40
                },
                "fieldLength": 46,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Verbal",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 445,
                    "offsetEnd": 445,
                    "columnNum": 41
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 446,
                    "offsetEnd": 446,
                    "columnNum": 42
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 447,
                    "offsetEnd": 447,
                    "columnNum": 43
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 448,
                    "offsetEnd": 448,
                    "columnNum": 44
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 449,
                    "offsetEnd": 449,
                    "columnNum": 45
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 450,
                    "offsetEnd": 450,
                    "columnNum": 46
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 451,
                    "offsetEnd": 451,
                    "columnNum": 47
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Completion Criteria (CC)",
                "otherPossibleNames": [],
                "logicalName": "COMPLETION_CRITERIA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 452,
                    "offsetEnd": 474,
                    "columnNum": 48
                },
                "fieldLength": 23,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Verbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 475,
                    "offsetEnd": 476,
                    "columnNum": 49
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 477,
                    "offsetEnd": 478,
                    "columnNum": 50
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 479,
                    "offsetEnd": 480,
                    "columnNum": 51
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 481,
                    "offsetEnd": 482,
                    "columnNum": 52
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 483,
                    "offsetEnd": 484,
                    "columnNum": 53
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 485,
                    "offsetEnd": 486,
                    "columnNum": 54
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 487,
                    "offsetEnd": 488,
                    "columnNum": 55
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score (RS)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 489,
                    "offsetEnd": 534,
                    "columnNum": 56
                },
                "fieldLength": 46,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Verbal",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 535,
                    "offsetEnd": 537,
                    "columnNum": 57
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 538,
                    "offsetEnd": 540,
                    "columnNum": 58
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 541,
                    "offsetEnd": 543,
                    "columnNum": 59
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 544,
                    "offsetEnd": 546,
                    "columnNum": 60
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 547,
                    "offsetEnd": 549,
                    "columnNum": 61
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 550,
                    "offsetEnd": 552,
                    "columnNum": 62
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 553,
                    "offsetEnd": 555,
                    "columnNum": 63
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Universal Scale Score (USS)",
                "otherPossibleNames": [],
                "logicalName": "UNIVERSAL_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 556,
                    "offsetEnd": 624,
                    "columnNum": 64
                },
                "fieldLength": 69,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_3",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 625,
                    "offsetEnd": 744,
                    "columnNum": 65
                },
                "fieldLength": 120,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Verbal",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 745,
                    "offsetEnd": 747,
                    "columnNum": 66
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 748,
                    "offsetEnd": 750,
                    "columnNum": 67
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 751,
                    "offsetEnd": 753,
                    "columnNum": 68
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 754,
                    "offsetEnd": 756,
                    "columnNum": 69
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 757,
                    "offsetEnd": 759,
                    "columnNum": 70
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 760,
                    "offsetEnd": 762,
                    "columnNum": 71
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 763,
                    "offsetEnd": 765,
                    "columnNum": 72
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Standard Age Score (SAS)",
                "otherPossibleNames": [],
                "logicalName": "STANDARD_AGE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 766,
                    "offsetEnd": 834,
                    "columnNum": 73
                },
                "fieldLength": 69,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Verbal",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 835,
                    "offsetEnd": 836,
                    "columnNum": 74
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 837,
                    "offsetEnd": 838,
                    "columnNum": 75
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 839,
                    "offsetEnd": 840,
                    "columnNum": 76
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 841,
                    "offsetEnd": 842,
                    "columnNum": 77
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 843,
                    "offsetEnd": 844,
                    "columnNum": 78
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 845,
                    "offsetEnd": 846,
                    "columnNum": 79
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 847,
                    "offsetEnd": 848,
                    "columnNum": 80
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Percentile Rank (GPR)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_PERCENTILE_RANK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 849,
                    "offsetEnd": 894,
                    "columnNum": 81
                },
                "fieldLength": 46,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Verbal",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 895,
                    "offsetEnd": 896,
                    "columnNum": 82
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 897,
                    "offsetEnd": 898,
                    "columnNum": 83
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 899,
                    "offsetEnd": 900,
                    "columnNum": 84
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 901,
                    "offsetEnd": 902,
                    "columnNum": 85
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 903,
                    "offsetEnd": 904,
                    "columnNum": 86
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 905,
                    "offsetEnd": 906,
                    "columnNum": 87
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 907,
                    "offsetEnd": 908,
                    "columnNum": 88
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Percentile Rank (APR)",
                "otherPossibleNames": [],
                "logicalName": "AGE_PERCENTILE_RANK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 909,
                    "offsetEnd": 954,
                    "columnNum": 89
                },
                "fieldLength": 46,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_4",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 955,
                    "offsetEnd": 1014,
                    "columnNum": 90
                },
                "fieldLength": 60,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Verbal",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1015,
                    "offsetEnd": 1015,
                    "columnNum": 91
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1016,
                    "offsetEnd": 1016,
                    "columnNum": 92
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1017,
                    "offsetEnd": 1017,
                    "columnNum": 93
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1018,
                    "offsetEnd": 1018,
                    "columnNum": 94
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1019,
                    "offsetEnd": 1019,
                    "columnNum": 95
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1020,
                    "offsetEnd": 1020,
                    "columnNum": 96
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS) Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1021,
                    "offsetEnd": 1021,
                    "columnNum": 97
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Stanine (GS)",
                "otherPossibleNames": [],
                "logicalName": "GRADE_STANINE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1022,
                    "offsetEnd": 1044,
                    "columnNum": 98
                },
                "fieldLength": 23,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS) Verbal",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1045,
                    "offsetEnd": 1045,
                    "columnNum": 99
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS) Quantitative",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1046,
                    "offsetEnd": 1046,
                    "columnNum": 100
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS) Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1047,
                    "offsetEnd": 1047,
                    "columnNum": 101
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS) Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1048,
                    "offsetEnd": 1048,
                    "columnNum": 102
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS) Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1049,
                    "offsetEnd": 1049,
                    "columnNum": 103
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS) Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1050,
                    "offsetEnd": 1050,
                    "columnNum": 104
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS)  Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1051,
                    "offsetEnd": 1051,
                    "columnNum": 105
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Age Stanine (AS)",
                "otherPossibleNames": [],
                "logicalName": "AGE_STANINE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1052,
                    "offsetEnd": 1074,
                    "columnNum": 106
                },
                "fieldLength": 23,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler ",
                "otherPossibleNames": [],
                "logicalName": "FILLER_5",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1075,
                    "offsetEnd": 1104,
                    "columnNum": 107
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Valid Flags",
                "otherPossibleNames": [],
                "logicalName": "SAS_VALID_FLAGS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1105,
                    "offsetEnd": 1134,
                    "columnNum": 108
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TMO Flags",
                "otherPossibleNames": [],
                "logicalName": "TMO_FLAGS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1135,
                    "offsetEnd": 1164,
                    "columnNum": 109
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Extremely Variable Flags",
                "otherPossibleNames": [],
                "logicalName": "EXTREMELY_VARIABLE_FLAGS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1165,
                    "offsetEnd": 1194,
                    "columnNum": 110
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Chance Flags ",
                "otherPossibleNames": [],
                "logicalName": "CHANCE_FLAGS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1195,
                    "offsetEnd": 1224,
                    "columnNum": 111
                },
                "fieldLength": 30,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Ability Profile ",
                "otherPossibleNames": [],
                "logicalName": "ABILITY_PROFILE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1225,
                    "offsetEnd": 1234,
                    "columnNum": 112
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_6",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1235,
                    "offsetEnd": 1324,
                    "columnNum": 113
                },
                "fieldLength": 90,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_7",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1325,
                    "offsetEnd": 1444,
                    "columnNum": 114
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
                "logicalName": "FILLER_8",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1445,
                    "offsetEnd": 1504,
                    "columnNum": 115
                },
                "fieldLength": 60,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_9",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1505,
                    "offsetEnd": 1624,
                    "columnNum": 116
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
                "logicalName": "FILLER_10",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1625,
                    "offsetEnd": 1744,
                    "columnNum": 117
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
                "logicalName": "FILLER_11",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1745,
                    "offsetEnd": 1834,
                    "columnNum": 118
                },
                "fieldLength": 90,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Verbal",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1835,
                    "offsetEnd": 1836,
                    "columnNum": 119
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Quantitative",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1837,
                    "offsetEnd": 1838,
                    "columnNum": 120
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1839,
                    "offsetEnd": 1840,
                    "columnNum": 121
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1841,
                    "offsetEnd": 1842,
                    "columnNum": 122
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1843,
                    "offsetEnd": 1844,
                    "columnNum": 123
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1845,
                    "offsetEnd": 1846,
                    "columnNum": 124
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1847,
                    "offsetEnd": 1848,
                    "columnNum": 125
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Percentile Rank",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_PERCENTILE_RANK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1849,
                    "offsetEnd": 1894,
                    "columnNum": 126
                },
                "fieldLength": 46,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines Verbal",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1895,
                    "offsetEnd": 1895,
                    "columnNum": 127
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines Quantitative",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1896,
                    "offsetEnd": 1896,
                    "columnNum": 128
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1897,
                    "offsetEnd": 1897,
                    "columnNum": 129
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1898,
                    "offsetEnd": 1898,
                    "columnNum": 130
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1899,
                    "offsetEnd": 1899,
                    "columnNum": 131
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1900,
                    "offsetEnd": 1900,
                    "columnNum": 132
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines  Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1901,
                    "offsetEnd": 1901,
                    "columnNum": 133
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Stanines",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STANINE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1902,
                    "offsetEnd": 1924,
                    "columnNum": 134
                },
                "fieldLength": 23,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_12",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1925,
                    "offsetEnd": 1984,
                    "columnNum": 135
                },
                "fieldLength": 60,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_13",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1985,
                    "offsetEnd": 2044,
                    "columnNum": 136
                },
                "fieldLength": 60,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_14",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2045,
                    "offsetEnd": 2047,
                    "columnNum": 137
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_15",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2048,
                    "offsetEnd": 2050,
                    "columnNum": 138
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_16",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2051,
                    "offsetEnd": 2053,
                    "columnNum": 139
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_17",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2054,
                    "offsetEnd": 2056,
                    "columnNum": 140
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_18",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2057,
                    "offsetEnd": 2059,
                    "columnNum": 141
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_19",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2060,
                    "offsetEnd": 2062,
                    "columnNum": 142
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Item Responses 1-220",
                "otherPossibleNames": [],
                "logicalName": "ITEM_RESPONSES_1_220",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2063,
                    "offsetEnd": 2282,
                    "columnNum": 143
                },
                "fieldLength": 220,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Item Responses 221-440",
                "otherPossibleNames": [],
                "logicalName": "ITEM_RESPONSES_221_440",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2283,
                    "offsetEnd": 2502,
                    "columnNum": 144
                },
                "fieldLength": 220,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Item Responses 441-660",
                "otherPossibleNames": [],
                "logicalName": "ITEM_RESPONSES_441_660",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2503,
                    "offsetEnd": 2722,
                    "columnNum": 145
                },
                "fieldLength": 220,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Ethnicity String ",
                "otherPossibleNames": [],
                "logicalName": "ETHNICITY_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2723,
                    "offsetEnd": 2736,
                    "columnNum": 146
                },
                "fieldLength": 14,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Programs String",
                "otherPossibleNames": [],
                "logicalName": "PROGRAMS_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2737,
                    "offsetEnd": 2757,
                    "columnNum": 147
                },
                "fieldLength": 21,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Title1Math                 ",
                "otherPossibleNames": [],
                "logicalName": "TITLE1_MATH",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2758,
                    "offsetEnd": 2758,
                    "columnNum": 148
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Title1Language",
                "otherPossibleNames": [],
                "logicalName": "TITLE1_LANGUAGE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2759,
                    "offsetEnd": 2759,
                    "columnNum": 149
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Information String 1    ",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_STRING_1_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2760,
                    "offsetEnd": 2762,
                    "columnNum": 150
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Information String 2     ",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_STRING_2_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2763,
                    "offsetEnd": 2765,
                    "columnNum": 151
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Information String 3    ",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_STRING_3_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2766,
                    "offsetEnd": 2768,
                    "columnNum": 152
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Info Field 1 No Bubble",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_FIELD_1_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2769,
                    "offsetEnd": 2769,
                    "columnNum": 153
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Info Field 2 No Bubble",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_FIELD_2_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2770,
                    "offsetEnd": 2770,
                    "columnNum": 154
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Info Field 3 No Bubble",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_FIELD_3_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2771,
                    "offsetEnd": 2771,
                    "columnNum": 155
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Info Field 1 Value",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_FIELD_1_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2772,
                    "offsetEnd": 2774,
                    "columnNum": 156
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Info Field 2 Value",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_FIELD_2_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2775,
                    "offsetEnd": 2777,
                    "columnNum": 157
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Other Info Field 3 Value",
                "otherPossibleNames": [],
                "logicalName": "OTHER_INFO_FIELD_3_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2778,
                    "offsetEnd": 2780,
                    "columnNum": 158
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Code Character String (A-T)",
                "otherPossibleNames": [],
                "logicalName": "CODE_CHARACTER_STRING_A-T",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2781,
                    "offsetEnd": 2800,
                    "columnNum": 159
                },
                "fieldLength": 20,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Code No Bubble",
                "otherPossibleNames": [],
                "logicalName": "CODE_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2801,
                    "offsetEnd": 2801,
                    "columnNum": 160
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use A Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_A_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2802,
                    "offsetEnd": 2811,
                    "columnNum": 161
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use A No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_A_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2812,
                    "offsetEnd": 2812,
                    "columnNum": 162
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use A Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_A_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2813,
                    "offsetEnd": 2813,
                    "columnNum": 163
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use A Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_A_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2814,
                    "offsetEnd": 2814,
                    "columnNum": 164
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use B Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_B_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2815,
                    "offsetEnd": 2824,
                    "columnNum": 165
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use B No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_B_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2825,
                    "offsetEnd": 2825,
                    "columnNum": 166
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use B Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_B_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2826,
                    "offsetEnd": 2826,
                    "columnNum": 167
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use B Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_B_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2827,
                    "offsetEnd": 2827,
                    "columnNum": 168
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use C Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_C_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2828,
                    "offsetEnd": 2837,
                    "columnNum": 169
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use C No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_C_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2838,
                    "offsetEnd": 2838,
                    "columnNum": 170
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use C Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_C_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2839,
                    "offsetEnd": 2839,
                    "columnNum": 171
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use C Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_C_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2840,
                    "offsetEnd": 2840,
                    "columnNum": 172
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use D Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_D_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2841,
                    "offsetEnd": 2850,
                    "columnNum": 173
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use D No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_D_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2851,
                    "offsetEnd": 2851,
                    "columnNum": 174
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use D Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_D_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2852,
                    "offsetEnd": 2852,
                    "columnNum": 175
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use D Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_D_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2853,
                    "offsetEnd": 2853,
                    "columnNum": 176
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use E Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_E_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2854,
                    "offsetEnd": 2863,
                    "columnNum": 177
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use E No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_E_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2864,
                    "offsetEnd": 2864,
                    "columnNum": 178
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use E Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_E_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2865,
                    "offsetEnd": 2865,
                    "columnNum": 179
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use E Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_E_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2866,
                    "offsetEnd": 2866,
                    "columnNum": 180
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use F Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_F_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2867,
                    "offsetEnd": 2876,
                    "columnNum": 181
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use F No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_F_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2877,
                    "offsetEnd": 2877,
                    "columnNum": 182
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use F Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_F_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2878,
                    "offsetEnd": 2878,
                    "columnNum": 183
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use F Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_F_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2879,
                    "offsetEnd": 2879,
                    "columnNum": 184
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use G Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_G_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2880,
                    "offsetEnd": 2881,
                    "columnNum": 185
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use G No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_G_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2882,
                    "offsetEnd": 2882,
                    "columnNum": 186
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use G Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_G_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2883,
                    "offsetEnd": 2884,
                    "columnNum": 187
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use H Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_H_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2885,
                    "offsetEnd": 2886,
                    "columnNum": 188
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use H No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_H_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2887,
                    "offsetEnd": 2887,
                    "columnNum": 189
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use H Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_H_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2888,
                    "offsetEnd": 2889,
                    "columnNum": 190
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use I Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_I_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2890,
                    "offsetEnd": 2891,
                    "columnNum": 191
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use I No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_I_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2892,
                    "offsetEnd": 2892,
                    "columnNum": 192
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use I Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_I_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2893,
                    "offsetEnd": 2894,
                    "columnNum": 193
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use J Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_J_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2895,
                    "offsetEnd": 2896,
                    "columnNum": 194
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use J No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_J_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2897,
                    "offsetEnd": 2897,
                    "columnNum": 195
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use J Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_J_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2898,
                    "offsetEnd": 2899,
                    "columnNum": 196
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use K Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_L_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2900,
                    "offsetEnd": 2901,
                    "columnNum": 197
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use K No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_L_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2902,
                    "offsetEnd": 2902,
                    "columnNum": 198
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use K Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_L_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2903,
                    "offsetEnd": 2904,
                    "columnNum": 199
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use L Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_L_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2905,
                    "offsetEnd": 2906,
                    "columnNum": 200
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use L No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_L_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2907,
                    "offsetEnd": 2907,
                    "columnNum": 201
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use L Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_L_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2908,
                    "offsetEnd": 2909,
                    "columnNum": 202
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use M Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_M_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2910,
                    "offsetEnd": 2911,
                    "columnNum": 203
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use M No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_M_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2912,
                    "offsetEnd": 2912,
                    "columnNum": 204
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use M Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_M_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2913,
                    "offsetEnd": 2914,
                    "columnNum": 205
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use N Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_N_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2915,
                    "offsetEnd": 2924,
                    "columnNum": 206
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use N No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_N_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2925,
                    "offsetEnd": 2925,
                    "columnNum": 207
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use N Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_N_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2926,
                    "offsetEnd": 2926,
                    "columnNum": 208
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use N Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_N_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2927,
                    "offsetEnd": 2927,
                    "columnNum": 209
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use O Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_O_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2928,
                    "offsetEnd": 2937,
                    "columnNum": 210
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use O No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_O_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2938,
                    "offsetEnd": 2938,
                    "columnNum": 211
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use O Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_O_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2939,
                    "offsetEnd": 2939,
                    "columnNum": 212
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use O Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_O_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2940,
                    "offsetEnd": 2940,
                    "columnNum": 213
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use P Character String",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_P_CHAR_STRING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2941,
                    "offsetEnd": 2950,
                    "columnNum": 214
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use P No Bubble",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_P_NO_BUBBLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2951,
                    "offsetEnd": 2951,
                    "columnNum": 215
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use P Darkest Mark",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_P_DARKEST_MAEK",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2952,
                    "offsetEnd": 2952,
                    "columnNum": 216
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Administrator Use P Value",
                "otherPossibleNames": [],
                "logicalName": "TEST_ADMINISTRATOR_USE_P_VALUE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2953,
                    "offsetEnd": 2953,
                    "columnNum": 217
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Verbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2954,
                    "offsetEnd": 2960,
                    "columnNum": 218
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Quantitative",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2961,
                    "offsetEnd": 2967,
                    "columnNum": 219
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2968,
                    "offsetEnd": 2974,
                    "columnNum": 220
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2975,
                    "offsetEnd": 2981,
                    "columnNum": 221
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2982,
                    "offsetEnd": 2988,
                    "columnNum": 222
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2989,
                    "offsetEnd": 2995,
                    "columnNum": 223
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 2996,
                    "offsetEnd": 3002,
                    "columnNum": 224
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Personal Standard Error",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_PERSONAL_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3003,
                    "offsetEnd": 3163,
                    "columnNum": 225
                },
                "fieldLength": 161,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Verbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3164,
                    "offsetEnd": 3170,
                    "columnNum": 226
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Quantitative",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3171,
                    "offsetEnd": 3177,
                    "columnNum": 227
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3178,
                    "offsetEnd": 3184,
                    "columnNum": 228
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3185,
                    "offsetEnd": 3191,
                    "columnNum": 229
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3192,
                    "offsetEnd": 3198,
                    "columnNum": 230
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3199,
                    "offsetEnd": 3205,
                    "columnNum": 231
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3206,
                    "offsetEnd": 3212,
                    "columnNum": 232
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Upper Bound",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_UPPER_BOUND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3213,
                    "offsetEnd": 3373,
                    "columnNum": 233
                },
                "fieldLength": 161,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Verbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3374,
                    "offsetEnd": 3380,
                    "columnNum": 234
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Quantitative",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3381,
                    "offsetEnd": 3387,
                    "columnNum": 235
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3388,
                    "offsetEnd": 3394,
                    "columnNum": 236
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3395,
                    "offsetEnd": 3401,
                    "columnNum": 237
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3402,
                    "offsetEnd": 3408,
                    "columnNum": 238
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3409,
                    "offsetEnd": 3415,
                    "columnNum": 239
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3416,
                    "offsetEnd": 3422,
                    "columnNum": 240
                },
                "fieldLength": 7,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Raw Score Lower Bound",
                "otherPossibleNames": [],
                "logicalName": "RAW_SCORE_LOWER_BOUND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3423,
                    "offsetEnd": 3583,
                    "columnNum": 241
                },
                "fieldLength": 161,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Verbal",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3584,
                    "offsetEnd": 3589,
                    "columnNum": 242
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Quantitative",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3590,
                    "offsetEnd": 3595,
                    "columnNum": 243
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3596,
                    "offsetEnd": 3601,
                    "columnNum": 244
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3602,
                    "offsetEnd": 3607,
                    "columnNum": 245
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3608,
                    "offsetEnd": 3613,
                    "columnNum": 246
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3614,
                    "offsetEnd": 3619,
                    "columnNum": 247
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3620,
                    "offsetEnd": 3625,
                    "columnNum": 248
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Upper Bound",
                "otherPossibleNames": [],
                "logicalName": "SAS_UPPER_BOUND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3626,
                    "offsetEnd": 3763,
                    "columnNum": 249
                },
                "fieldLength": 138,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Verbal",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_VERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3764,
                    "offsetEnd": 3769,
                    "columnNum": 250
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Quantitative",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_QUANTITATIVE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3770,
                    "offsetEnd": 3775,
                    "columnNum": 251
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Nonverbal",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_NONVERBAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3776,
                    "offsetEnd": 3781,
                    "columnNum": 252
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Composite (V+Q)",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_VQ",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3782,
                    "offsetEnd": 3787,
                    "columnNum": 253
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Composite (V+N)",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_VN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3788,
                    "offsetEnd": 3793,
                    "columnNum": 254
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Composite (Q+N)",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_QN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3794,
                    "offsetEnd": 3799,
                    "columnNum": 255
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound Composite (V+Q+N)",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND_VQN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3800,
                    "offsetEnd": 3805,
                    "columnNum": 256
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SAS Lower Bound ",
                "otherPossibleNames": [],
                "logicalName": "SAS_LOWER_BOUND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3806,
                    "offsetEnd": 3943,
                    "columnNum": 257
                },
                "fieldLength": 138,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_20",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 3944,
                    "offsetEnd": 4200,
                    "columnNum": 258
                },
                "fieldLength": 257,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Secondary Student ID",
                "otherPossibleNames": [],
                "logicalName": "SECONDARY_STUDENT_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 4201,
                    "offsetEnd": 4220,
                    "columnNum": 259
                },
                "fieldLength": 20,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER_21",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 4221,
                    "offsetEnd": 4579,
                    "columnNum": 260
                },
                "fieldLength": 359,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            }
		]
	},
	"fileExtensions": [".txt"]
}