{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "STAAR_2018_EOC",
		"recordLength": 2000,
		"naturalKey": ["ADMINISTRATION_DATE", "TEST_VERSION", "END_OF_COURSE_CODE", "LOCAL_STUDENT_ID", "FIRST_NAME", "LAST_NAME","FIRST_TIME_TESTER_RETESTER"],
		"fields": [{
				"physicalName": "ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 4,
					"columnNum": 1
				},
				"fieldLength": 4,
				"expectedValues": ["1518", "1618", "1318"],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "GRADE-LEVEL-CODE",
				"otherPossibleNames": [],
				"logicalName": "GRADE_LEVEL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5,
					"offsetEnd": 6,
					"columnNum": 2
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ESC REGION NUMBER",
				"otherPossibleNames": [],
				"logicalName": "ESC_REGION_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 8,
					"columnNum": 3
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COUNTY-DISTRICT-CAMPUS NUMBER",
				"otherPossibleNames": [],
				"logicalName": "COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 9,
					"offsetEnd": 17,
					"columnNum": 4
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DISTRICT-NAME",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 18,
					"offsetEnd": 32,
					"columnNum": 5
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CAMPUS–NAME",
				"otherPossibleNames": [],
				"logicalName": "CAMPUS_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 33,
					"offsetEnd": 47,
					"columnNum": 6
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAST-NAME",
				"otherPossibleNames": [],
				"logicalName": "LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 48,
					"offsetEnd": 62,
					"columnNum": 7
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FIRST-NAME",
				"otherPossibleNames": [],
				"logicalName": "FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 63,
					"offsetEnd": 72,
					"columnNum": 8
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MIDDLE INITIAL",
				"otherPossibleNames": [],
				"logicalName": "MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 73,
					"offsetEnd": 73,
					"columnNum": 9
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT-ID (as used for TSDS PEIMS)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 74,
					"offsetEnd": 82,
					"columnNum": 10
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEX-CODE",
				"otherPossibleNames": [],
				"logicalName": "SEX_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 83,
					"offsetEnd": 83,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DATE-OF-BIRTH (MMDDYYYY)",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "MMDDYYYY",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 84,
					"offsetEnd": 91,
					"columnNum": 12
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 92,
					"offsetEnd": 92,
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HISPANIC-LATINO-CODE",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC_LATINO_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 93,
					"offsetEnd": 93,
					"columnNum": 14
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "AMERICAN-INDIAN-ALASKA-NATIVE-CODE",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_ALASKA_NATIVE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 94,
					"columnNum": 15
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ASIAN-CODE",
				"otherPossibleNames": [],
				"logicalName": "ASIAN_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 95,
					"offsetEnd": 95,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLACK-AFRICAN-AMERICAN-CODE",
				"otherPossibleNames": [],
				"logicalName": "BLACK_AFRICAN_AMERICAN_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 96,
					"offsetEnd": 96,
					"columnNum": 17
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "NATIVE-HAWAI AN-PACIFIC-ISLANDER-CODE",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAI_AN_PACIFIC_ISLANDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 97,
					"offsetEnd": 97,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "WHITE-CODE",
				"otherPossibleNames": [],
				"logicalName": "WHITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 98,
					"offsetEnd": 98,
					"columnNum": 19
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ETHNICITY/RACE REPORTING CATEGORY",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_RACE_REPORTING_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 99,
					"offsetEnd": 99,
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["H", "I", "A", "B", "P", "W", "T", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ECONOMIC-DISADVANTAGE-CODE",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 100,
					"offsetEnd": 100,
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "9", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TITLE-I-PART-A-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "TITLE_I_PART_A_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 101,
					"offsetEnd": 101,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": ["6", "7", "8", "9", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MIGRANT-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 102,
					"offsetEnd": 102,
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 103,
					"offsetEnd": 106,
					"columnNum": 24
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEP-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "LEP_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 107,
					"offsetEnd": 107,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": ["C", "F", "S", "0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BILINGUAL-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "BILINGUAL_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 108,
					"offsetEnd": 108,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["2", "3", "4", "5", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ESL-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "ESL_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 109,
					"offsetEnd": 109,
					"columnNum": 27
				},
				"fieldLength": 1,
				"expectedValues": ["2", "3", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 110,
					"offsetEnd": 110,
					"columnNum": 28
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPECIAL-ED-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "SPECIAL_ED_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 111,
					"offsetEnd": 111,
					"columnNum": 29
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 112,
					"offsetEnd": 116,
					"columnNum": 30
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GIFTED-TALENTED-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "GIFTED_TALENTED_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 117,
					"columnNum": 31
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "AT-RISK-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "AT_RISK_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 118,
					"offsetEnd": 118,
					"columnNum": 32
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 119,
					"offsetEnd": 121,
					"columnNum": 33
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CAREER-AND-TECHNICAL-ED-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "CAREER_AND_TECHNICAL_ED_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 122,
					"offsetEnd": 122,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "LOCAL-STUDENT-ID",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 123,
					"offsetEnd": 131,
					"columnNum": 35
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DOCUMENT NUMBER",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 132,
					"offsetEnd": 140,
					"columnNum": 36
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 142,
					"columnNum": 37
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RECORD UPDATE INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "RECORD_UPDATE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 143,
					"offsetEnd": 143,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FALL 2017 TSDS PEIMS COUNTY-DISTRICT-CAMPUS NUMBER",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 144,
					"offsetEnd": 152,
					"columnNum": 39
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2017 TSDS PEIMS CRISIS CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_PEIMS_CRISIS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 153,
					"offsetEnd": 154,
					"columnNum": 40
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2017 TSDS PEIMS STUDENT ATTRIBUTION CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_PEIMS_STUDENT_ATTRIBUTION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 156,
					"columnNum": 41
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT PORTAL UNIQUE ACCESS CODE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_PORTAL_UNIQUE_ACCESS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 162,
					"columnNum": 42
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MIGRANT STUDENT IN TEXAS MIGRANT INTERSTATE PROGRAM (TMIP)",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_STUDENT_IN_TEXAS_MIGRANT_INTERSTATE_PROGRAM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 163,
					"offsetEnd": 163,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "HIGH SCHOOL EQUIVALENCY PROGRAM (HSEP)",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_EQUIVALENCY_PROGRAM_HSEP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 164,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FALL 2017 TSDS PEIMS MILITARY-CONNECTED-STUDENT-CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 165,
					"offsetEnd": 165,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 166,
					"offsetEnd": 189,
					"columnNum": 46
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEW TO TEXAS",
				"otherPossibleNames": [],
				"logicalName": "NEW_TO_TEXAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 190,
					"offsetEnd": 190,
					"columnNum": 47
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TEXAS STUDENT DATA SYSTEM (TSDS) UNIQUE STUDENT ID",
				"otherPossibleNames": [],
				"logicalName": "TSDS_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 200,
					"columnNum": 48
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "END-OF-COURSE CODE",
				"otherPossibleNames": [],
				"logicalName": "END_OF_COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 202,
					"columnNum": 49
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "A2", "E1", "E2", "E3", "BI", "US"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LOCAL USE",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 203,
					"offsetEnd": 206,
					"columnNum": 50
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 207,
					"offsetEnd": 214,
					"columnNum": 51
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN A: TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_A_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 215,
					"offsetEnd": 215,
					"columnNum": 52
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN B: TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_B_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 216,
					"offsetEnd": 216,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN C: TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_C_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 217,
					"offsetEnd": 217,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN D: TAKS/TAAS/TEAMS",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_D_TAKS_TAAS_TEAMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 218,
					"offsetEnd": 218,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "COLUMN E: TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_E_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 219,
					"offsetEnd": 219,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 220,
					"offsetEnd": 229,
					"columnNum": 57
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TEST DATE",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 230,
					"offsetEnd": 231,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SUBSTITUTE ASSESSMENT",
				"otherPossibleNames": [],
				"logicalName": "SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 232,
					"offsetEnd": 232,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 233,
					"offsetEnd": 251,
					"columnNum": 60
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DESIGNATED SUPPORTS",
				"otherPossibleNames": [],
				"logicalName": "DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 252,
					"offsetEnd": 252,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BRAILLE",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 253,
					"offsetEnd": 253,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "LARGE PRINT",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 254,
					"offsetEnd": 254,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 255,
					"offsetEnd": 255,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXTRA DAY",
				"otherPossibleNames": [],
				"logicalName": "EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 256,
					"offsetEnd": 256,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 257,
					"offsetEnd": 257,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TEXT-TO-SPEECH",
				"otherPossibleNames": [],
				"logicalName": "TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 258,
					"offsetEnd": 258,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 259,
					"offsetEnd": 260,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CONTENT AND LANGUAGE SUPPORTS",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_AND_LANGUAGE_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 261,
					"offsetEnd": 261,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SPELLING ASSISTANCE",
				"otherPossibleNames": [],
				"logicalName": "SPELLING_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 262,
					"offsetEnd": 262,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 263,
					"offsetEnd": 290,
					"columnNum": 71
				},
				"fieldLength": 28,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 291,
					"offsetEnd": 291,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 292,
					"offsetEnd": 295,
					"columnNum": 73
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE CODE DEFAULT",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_DEFAULT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 296,
					"offsetEnd": 296,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["3", "1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 297,
					"offsetEnd": 300,
					"columnNum": 75
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TEST ADMINISTRATION MODE",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMINISTRATION_MODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 301,
					"offsetEnd": 301,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["O", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 302,
					"offsetEnd": 305,
					"columnNum": 77
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 306,
					"offsetEnd": 306,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FIRST-TIME TESTER/RETESTER",
				"otherPossibleNames": [],
				"logicalName": "FIRST_TIME_TESTER_RETESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 307,
					"offsetEnd": 307,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": ["F", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 308,
					"offsetEnd": 350,
					"columnNum": 80
				},
				"fieldLength": 43,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORTING CATEGORY SCORES",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 351,
					"offsetEnd": 362,
					"columnNum": 81
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 363,
					"offsetEnd": 364,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 365,
					"offsetEnd": 366,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 367,
					"offsetEnd": 370,
					"columnNum": 84
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 372,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITTEN COMPOSITION SCORE",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_COMPOSITION_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 373,
					"offsetEnd": 373,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": ["0", "2", "3", "4", "5", "6", "7", "8"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II READING RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 374,
					"offsetEnd": 375,
					"columnNum": 87
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II READING PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_READING_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 376,
					"offsetEnd": 376,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II WRITING RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_WRITING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 377,
					"offsetEnd": 378,
					"columnNum": 89
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II WRITING PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_WRITING_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 379,
					"offsetEnd": 379,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 380,
					"offsetEnd": 380,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 381,
					"offsetEnd": 381,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 382,
					"offsetEnd": 382,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "U.S. HISTORY PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 383,
					"offsetEnd": 383,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TAKS/TAAS/TEAMS TESTER INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "TAKS_TAAS_TEAMS_TESTER_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 384,
					"offsetEnd": 384,
					"columnNum": 95
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 385,
					"offsetEnd": 386,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENT’S PASSING STANDARD FOR APPROACHES GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "STUDENTS_PASSING_STANDARD_FOR_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 387,
					"offsetEnd": 387,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 388,
					"offsetEnd": 388,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MEETS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 389,
					"offsetEnd": 389,
					"columnNum": 99
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL AT THE STUDENT’S STANDARD",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 390,
					"offsetEnd": 390,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MASTERS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 391,
					"offsetEnd": 391,
					"columnNum": 101
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL AT THE 2012–2015 STANDARD",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_AT_THE_2012_2015_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 392,
					"offsetEnd": 392,
					"columnNum": 102
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL AT THE CURRENT STANDARD",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_AT_THE_CURRENT_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 393,
					"offsetEnd": 393,
					"columnNum": 103
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 394,
					"offsetEnd": 399,
					"columnNum": 104
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR PROGRESS MEASURE (Algebra I and English II for STAAR)",
				"otherPossibleNames": [],
				"logicalName": "STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 400,
					"offsetEnd": 400,
					"columnNum": 105
				},
				"fieldLength": 1,
				"expectedValues": ["2", "1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 401,
					"offsetEnd": 401,
					"columnNum": 106
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 402,
					"offsetEnd": 405,
					"columnNum": 107
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 406,
					"offsetEnd": 409,
					"columnNum": 108
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 410,
					"offsetEnd": 410,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 411,
					"offsetEnd": 411,
					"columnNum": 110
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR ENGLISH I FIRST-TIME/RETESTER",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_ENGLISH_I_FIRST_TIME_RETESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 412,
					"offsetEnd": 412,
					"columnNum": 111
				},
				"fieldLength": 1,
				"expectedValues": ["F", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENT’S",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 413,
					"offsetEnd": 413,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR LEVEL III : ADVANCED ACADEMIC PERFORMANCE (Masters Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_LEVEL_III_ADVANCED_ACADEMIC_PERFORMANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 414,
					"offsetEnd": 414,
					"columnNum": 113
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR GRADE/COURSE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_GRADE_COURSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 415,
					"offsetEnd": 416,
					"columnNum": 114
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 417,
					"offsetEnd": 430,
					"columnNum": 115
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ITEM REPORTING CATEGORY NUMBERS",
				"otherPossibleNames": [],
				"logicalName": "ITEM_REPORTING_CATEGORY_NUMBERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 431,
					"offsetEnd": 498,
					"columnNum": 116
				},
				"fieldLength": 68,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ITEM STUDENT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "ITEM_STUDENT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 499,
					"offsetEnd": 566,
					"columnNum": 117
				},
				"fieldLength": 68,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ITEM CORRECT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "ITEM_CORRECT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 567,
					"offsetEnd": 634,
					"columnNum": 118
				},
				"fieldLength": 68,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "ITEM_LEVEL_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 635,
					"offsetEnd": 637,
					"columnNum": 119
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 638,
					"offsetEnd": 822,
					"columnNum": 120
				},
				"fieldLength": 185,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEXILE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 823,
					"offsetEnd": 827,
					"columnNum": 121
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "QUANTILE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 828,
					"offsetEnd": 832,
					"columnNum": 122
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 833,
					"offsetEnd": 1000,
					"columnNum": 123
				},
				"fieldLength": 168,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration Date Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1001,
					"offsetEnd": 1004,
					"columnNum": 124
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Code Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1005,
					"offsetEnd": 1013,
					"columnNum": 125
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1014,
					"offsetEnd": 1014,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1015,
					"offsetEnd": 1015,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Level II: Satisfactory Academic Performance at the Student’s Standard Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1016,
					"offsetEnd": 1016,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1017,
					"offsetEnd": 1017,
					"columnNum": 129
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Level III: Advanced Academic Performance (Masters Grade Level) Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1018,
					"offsetEnd": 1018,
					"columnNum": 130
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Substitute Assessment Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1019,
					"offsetEnd": 1019,
					"columnNum": 131
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Raw Score Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1020,
					"offsetEnd": 1021,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1022,
					"offsetEnd": 1025,
					"columnNum": 133
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category Scores Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1026,
					"offsetEnd": 1035,
					"columnNum": 134
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1036,
					"offsetEnd": 1049,
					"columnNum": 135
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1050,
					"offsetEnd": 1050,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": ["2", "1", "0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1051,
					"offsetEnd": 1051,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile Algebra",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1052,
					"offsetEnd": 1054,
					"columnNum": 138
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1055,
					"offsetEnd": 1100,
					"columnNum": 139
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration Date Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1101,
					"offsetEnd": 1104,
					"columnNum": 140
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Code Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1105,
					"offsetEnd": 1113,
					"columnNum": 141
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1114,
					"offsetEnd": 1114,
					"columnNum": 142
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1115,
					"offsetEnd": 1115,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Level II: Satisfactory Academic Performance at the Student’s Standard Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1116,
					"offsetEnd": 1116,
					"columnNum": 144
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1117,
					"offsetEnd": 1117,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Level III : Advanced Academic Performance (Masters Grade Level) Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1118,
					"offsetEnd": 1118,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Substitute Assessment Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1119,
					"offsetEnd": 1119,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Raw Score Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1120,
					"offsetEnd": 1121,
					"columnNum": 148
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1122,
					"offsetEnd": 1125,
					"columnNum": 149
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category Scores Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1126,
					"offsetEnd": 1135,
					"columnNum": 150
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1136,
					"offsetEnd": 1151,
					"columnNum": 151
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile Biology",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1152,
					"offsetEnd": 1154,
					"columnNum": 152
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1155,
					"offsetEnd": 1200,
					"columnNum": 153
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration Date English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1201,
					"offsetEnd": 1204,
					"columnNum": 154
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Code English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1205,
					"offsetEnd": 1213,
					"columnNum": 155
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1214,
					"offsetEnd": 1214,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": ["S", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1215,
					"offsetEnd": 1215,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Level II: Satisfactory Academic Performance at the Student’s Standard English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1216,
					"offsetEnd": 1216,
					"columnNum": 158
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1217,
					"offsetEnd": 1217,
					"columnNum": 159
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Level III : Advanced Academic Performance (Masters Grade Level) English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1218,
					"offsetEnd": 1218,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Substitute Assessment English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1219,
					"offsetEnd": 1219,
					"columnNum": 161
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Raw Score English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1220,
					"offsetEnd": 1221,
					"columnNum": 162
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1222,
					"offsetEnd": 1225,
					"columnNum": 163
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category Scores English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1226,
					"offsetEnd": 1237,
					"columnNum": 164
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Written Composition Score English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_WRITTEN_COMPOSITION_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1238,
					"offsetEnd": 1238,
					"columnNum": 165
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1239,
					"offsetEnd": 1251,
					"columnNum": 166
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile English I",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1252,
					"offsetEnd": 1254,
					"columnNum": 167
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1255,
					"offsetEnd": 1300,
					"columnNum": 168
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration Date English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1301,
					"offsetEnd": 1304,
					"columnNum": 169
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Code English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1305,
					"offsetEnd": 1313,
					"columnNum": 170
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1314,
					"offsetEnd": 1314,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": ["S", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1315,
					"offsetEnd": 1315,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Level II: Satisfactory Academic Performance at the Student’s Standard English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1316,
					"offsetEnd": 1316,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1317,
					"offsetEnd": 1317,
					"columnNum": 174
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Level III : Advanced Academic Performance (Masters Grade Level) English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1318,
					"offsetEnd": 1318,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Substitute Assessment English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1319,
					"offsetEnd": 1319,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Raw Score English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1320,
					"offsetEnd": 1321,
					"columnNum": 177
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1322,
					"offsetEnd": 1325,
					"columnNum": 178
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category Scores English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1326,
					"offsetEnd": 1337,
					"columnNum": 179
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Written Composition Score English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_WRITTEN_COMPOSITION_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1338,
					"offsetEnd": 1338,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1339,
					"offsetEnd": 1349,
					"columnNum": 181
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1350,
					"offsetEnd": 1350,
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": ["2", "1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1351,
					"offsetEnd": 1351,
					"columnNum": 183
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile English II",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1352,
					"offsetEnd": 1354,
					"columnNum": 184
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1355,
					"offsetEnd": 1400,
					"columnNum": 185
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration Date US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1401,
					"offsetEnd": 1404,
					"columnNum": 186
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Code US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1405,
					"offsetEnd": 1413,
					"columnNum": 187
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1414,
					"offsetEnd": 1414,
					"columnNum": 188
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1415,
					"offsetEnd": 1415,
					"columnNum": 189
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Level II: Satisfactory Academic Performance at the Student’s Standard US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1416,
					"offsetEnd": 1416,
					"columnNum": 190
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1417,
					"offsetEnd": 1417,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Level III: Advanced Academic Performance (Masters Grade Level) US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1418,
					"offsetEnd": 1418,
					"columnNum": 192
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Substitute Assessment US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1419,
					"offsetEnd": 1419,
					"columnNum": 193
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Raw Score US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1420,
					"offsetEnd": 1421,
					"columnNum": 194
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1422,
					"offsetEnd": 1425,
					"columnNum": 195
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Category Scores US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1426,
					"offsetEnd": 1433,
					"columnNum": 196
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1434,
					"offsetEnd": 1451,
					"columnNum": 197
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile US History",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1452,
					"offsetEnd": 1454,
					"columnNum": 198
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1455,
					"offsetEnd": 1498,
					"columnNum": 199
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 8",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1499,
					"offsetEnd": 1503,
					"columnNum": 200
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 8 End-of-Course Code",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_8_END_OF_COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1504,
					"offsetEnd": 1505,
					"columnNum": 201
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 8 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_8_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1506,
					"offsetEnd": 1509,
					"columnNum": 202
				},
				"fieldLength": 4,
				"expectedValues": ["XX", "YY"],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 9",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1510,
					"offsetEnd": 1514,
					"columnNum": 203
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 9 End-of-Course Code",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_9_END_OF_COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1515,
					"offsetEnd": 1516,
					"columnNum": 204
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 9 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_9_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1517,
					"offsetEnd": 1520,
					"columnNum": 205
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 10",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1521,
					"offsetEnd": 1525,
					"columnNum": 206
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 10 End-of-Course Code",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_10_END_OF_COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1526,
					"offsetEnd": 1527,
					"columnNum": 207
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 10 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_10_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1528,
					"offsetEnd": 1531,
					"columnNum": 208
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 11",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1532,
					"offsetEnd": 1536,
					"columnNum": 209
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 11 End-of-Course Code",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_11_END_OF_COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1537,
					"offsetEnd": 1538,
					"columnNum": 210
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 11 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_11_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1539,
					"offsetEnd": 1542,
					"columnNum": 211
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1543,
					"offsetEnd": 1562,
					"columnNum": 212
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 8",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1563,
					"offsetEnd": 1567,
					"columnNum": 213
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 8 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_8_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1568,
					"offsetEnd": 1571,
					"columnNum": 214
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 9",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1572,
					"offsetEnd": 1576,
					"columnNum": 215
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 9 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_9_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1577,
					"offsetEnd": 1580,
					"columnNum": 216
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 10",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1581,
					"offsetEnd": 1585,
					"columnNum": 217
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 10 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_10_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1586,
					"offsetEnd": 1589,
					"columnNum": 218
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 11",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1590,
					"offsetEnd": 1594,
					"columnNum": 219
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 11 Administration Date",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_11_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1595,
					"offsetEnd": 1598,
					"columnNum": 220
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1599,
					"offsetEnd": 1999,
					"columnNum": 221
				},
				"fieldLength": 401,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERIOD",
				"otherPossibleNames": [],
				"logicalName": "PERIOD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2000,
					"offsetEnd": 2000,
					"columnNum": 222
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}