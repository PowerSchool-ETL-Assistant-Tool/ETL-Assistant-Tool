{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "STAAR_2023_EOC",
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
				"expectedValues": ["1523", "1623"],
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
				"expectedValues": ["EE", "PK", "KG", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "OS"],
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
				"physicalName": "STUDENT-ID",
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
				"physicalName": "NATIVE-HAWAIIAN-PACIFIC-ISLANDER-CODE",
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
				"physicalName": "Emergent-Bilingual-Indicator-Code",
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
				"expectedValues": ["C", "F", "S", "0","T","R"],
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
				"physicalName": "Fall 2022 TSDS PEIMS Homeless-Status-Code",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_TSDS_PEIMS_HOMELESS_STATUS_CODE",
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
				"physicalName": "Section 504-Indicator-Code",
				"otherPossibleNames": [],
				"logicalName": "SECTION_504_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 112,
					"offsetEnd": 112,
					"columnNum": 30
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 113,
					"offsetEnd": 116,
					"columnNum": 31
				},
				"fieldLength": 4,
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
					"columnNum": 32
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
					"columnNum": 33
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
					"offsetEnd": 122,
					"columnNum": 34
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
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
				"physicalName": "TEST RESULT ID",
				"otherPossibleNames": [],
				"logicalName": "TEST_RESULT_ID",
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
				"physicalName": "DISCREPANCY INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "DISCREPANCY_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 143,
					"offsetEnd": 143,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["0","3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FALL 2022 TSDS PEIMS COUNTY-DISTRICT-CAMPUS NUMBER",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
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
				"physicalName": "FALL 2022 TSDS PEIMS STUDENT LANGUAGE-CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_PEIMS_LANGUAGE_CODE",
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
				"physicalName": "FALL 2022 TSDS PEIMS STUDENT ATTRIBUTION CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_PEIMS_STUDENT_ATTRIBUTION_CODE",
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
				"physicalName": "FAMILY PORTAL UNIQUE ACCESS CODE",
				"otherPossibleNames": [],
				"logicalName": "FAMILY_PORTAL_UNIQUE_ACCESS_CODE",
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
				"physicalName": "FALL 2022 TSDS PEIMS MILITARY-CONNECTED-STUDENT-CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
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
				"physicalName": "FALL 2022 TSDS PEIMS FOSTER-CARE-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_TSDS_PEIMS_FOSTER_CARE_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 166,
					"offsetEnd": 166,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["0","1","2","3"],
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
					"offsetStart": 167,
					"offsetEnd": 186,
					"columnNum": 47
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2022 TSDS PEIMS DYSLEXIA INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_TSDS_PEIMS_DYSLEXIA_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 187,
					"offsetEnd": 187,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": ["1","0"],
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
					"offsetStart": 188,
					"offsetEnd": 189,
					"columnNum": 49
				},
				"fieldLength": 2,
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
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TX UNIQUE STUDENT-ID",
				"otherPossibleNames": [],
				"logicalName": "TX_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 200,
					"columnNum": 51
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": ["A1", "E1", "E2", "BI", "US"],
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
					"columnNum": 53
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
					"columnNum": 54
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE CODE A",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_CODE_A",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 215,
					"offsetEnd": 215,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE CODE B",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_CODE_B",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 216,
					"offsetEnd": 216,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE CODE C",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_CODE_C",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 217,
					"offsetEnd": 217,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE CODE D",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_CODE_D",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 218,
					"offsetEnd": 218,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE CODE E",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_CODE_E",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 219,
					"offsetEnd": 219,
					"columnNum": 59
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
					"offsetEnd": 232,
					"columnNum": 60
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FOR TAKS/TAAS/TEAMS TESTERS ONLY",
				"otherPossibleNames": [],
				"logicalName": "FOR_TAKS_TAAS_TEAMS_TESTERS_ONLY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 233,
					"offsetEnd": 233,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","4"],
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
					"offsetStart": 234,
					"offsetEnd": 252,
					"columnNum": 62
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"columnNum": 63
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
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "NON-EMBEDDED DESIGNATED SUPPORTS",
				"otherPossibleNames": [],
				"logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 255,
					"offsetEnd": 255,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
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
					"columnNum": 66
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
					"columnNum": 67
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
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SPEECH-TO-TEXT",
				"otherPossibleNames": [],
				"logicalName": "SPEECH_TO_TEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 259,
					"offsetEnd": 259,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AUTO TEXT-TO-SPEECH",
				"otherPossibleNames": [],
				"logicalName": "AUTO_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 260,
					"offsetEnd": 260,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
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
					"columnNum": 71
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
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ASL SIGNED VIDEOS",
				"otherPossibleNames": [],
				"logicalName": "ASL_SIGNED_VIDEOS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 263,
					"offsetEnd": 263,
					"columnNum": 73
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
					"offsetStart": 264,
					"offsetEnd": 290,
					"columnNum": 74
				},
				"fieldLength": 27,
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
					"columnNum": 75
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
					"columnNum": 76
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
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["3", "0"],
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
					"columnNum": 78
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
					"columnNum": 79
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
					"columnNum": 80
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
					"columnNum": 81
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
					"columnNum": 82
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
					"columnNum": 83
				},
				"fieldLength": 43,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORTING CATEGORY 1 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_1_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 351,
					"offsetEnd": 352,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORTING CATEGORY 2 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_2_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 353,
					"offsetEnd": 354,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORTING CATEGORY 3 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_3_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 355,
					"offsetEnd": 356,
					"columnNum": 86
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORTING CATEGORY 4 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_4_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 357,
					"offsetEnd": 358,
					"columnNum": 87
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORTING CATEGORY 5 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_CATEGORY_5_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 359,
					"offsetEnd": 360,
					"columnNum": 88
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
					"offsetStart": 361,
					"offsetEnd": 362,
					"columnNum": 89
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERFORMANCE LEVEL INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "PERFORMANCE_LEVEL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 363,
					"offsetEnd": 364,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": ["00","0L","0H","1L","1H","2M","3M"],
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
					"columnNum": 91
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
					"columnNum": 92
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
					"offsetEnd": 371,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EXTENDED CONSTRUCTED RESPONSE SCORE",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_CONSTRUCTED_RESPONSE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 372,
					"offsetEnd": 373,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": ["1","2","3","4","5","6","7","8","9","10"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER ENGLISH II READING RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 374,
					"offsetEnd": 375,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER ENGLISH II READING PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_READING_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 376,
					"offsetEnd": 376,
					"columnNum": 96
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER ENGLISH II WRITING RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_WRITING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 377,
					"offsetEnd": 378,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER ENGLISH II WRITING PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_WRITING_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 379,
					"offsetEnd": 379,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER ALGEBRA I PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 380,
					"offsetEnd": 380,
					"columnNum": 99
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER BIOLOGY PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 381,
					"offsetEnd": 381,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER ENGLISH II PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 382,
					"offsetEnd": 382,
					"columnNum": 101
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "T/T/T TESTER U.S. HISTORY PERFORMANCE INFORMATION",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_PERFORMANCE_INFORMATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 383,
					"offsetEnd": 383,
					"columnNum": 102
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
					"columnNum": 103
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
					"columnNum": 104
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
					"columnNum": 105
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
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
					"columnNum": 106
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
					"columnNum": 107
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
					"columnNum": 108
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
					"columnNum": 109
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
					"columnNum": 110
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
					"columnNum": 111
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL AT THE 2015–2022 STANDARD",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_AT_THE_2015_2022_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 394,
					"offsetEnd": 394,
					"columnNum": 112
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
					"offsetStart": 395,
					"offsetEnd": 417,
					"columnNum": 113
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EL PERFORMANCE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "EL_PERFORMANCE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 418,
					"offsetEnd": 418,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EL PERFORMANCE MEASURE (ELPM) PLAN",
				"otherPossibleNames": [],
				"logicalName": "EL_PERFORMANCE_MEASURE_ELPM_PLAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 419,
					"offsetEnd": 419,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","4","5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YEAR ELPM PLAN DETEERMINED",
				"otherPossibleNames": [],
				"logicalName": "YEAR_ELPM_PLAN_DETEERMINED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 420,
					"offsetEnd": 423,
					"columnNum": 116
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PLAN YEAR TELPAS COMPOSITE RATING",
				"otherPossibleNames": [],
				"logicalName": "PLAN_YEAR_TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 424,
					"offsetEnd": 424,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0","4"],
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
					"offsetStart": 425,
					"offsetEnd": 430,
					"columnNum": 118
				},
				"fieldLength": 6,
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
					"offsetEnd": 494,
					"columnNum": 119
				},
				"fieldLength": 64,
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
					"offsetStart": 495,
					"offsetEnd": 498,
					"columnNum": 120
				},
				"fieldLength": 4,
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
					"offsetEnd": 562,
					"columnNum": 121
				},
				"fieldLength": 64,
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
					"offsetStart": 563,
					"offsetEnd": 566,
					"columnNum": 122
				},
				"fieldLength": 4,
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
					"offsetEnd": 630,
					"columnNum": 123
				},
				"fieldLength": 64,
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
					"offsetStart": 631,
					"offsetEnd": 634,
					"columnNum": 124
				},
				"fieldLength": 4,
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
					"columnNum": 125
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
					"offsetEnd": 716,
					"columnNum": 126
				},
				"fieldLength": 79,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ITEM STUDENT SCORES",
				"otherPossibleNames": [],
				"logicalName": "ITEM_STUDENT_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 717,
					"offsetEnd": 780,
					"columnNum": 127
				},
				"fieldLength": 64,
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
					"offsetStart": 781,
					"offsetEnd": 822,
					"columnNum": 128
				},
				"fieldLength": 42,
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
					"columnNum": 129
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
					"columnNum": 130
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "POINTS POSSIBLE",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 833,
					"offsetEnd": 896,
					"columnNum": 131
				},
				"fieldLength": 64,
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
					"offsetStart": 897,
					"offsetEnd": 1000,
					"columnNum": 132
				},
				"fieldLength": 104,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I ADMINISTRATION_DATE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1001,
					"offsetEnd": 1004,
					"columnNum": 133
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I COUNTY DISTRICT CAMPUS CODE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1005,
					"offsetEnd": 1013,
					"columnNum": 134
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1014,
					"offsetEnd": 1014,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1015,
					"offsetEnd": 1015,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENT’S STANDARD (APPROACHES GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1016,
					"offsetEnd": 1016,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I MEETS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1017,
					"offsetEnd": 1017,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I LEVEL III: ADVANCED ACADEMIC PERFORMANCE (MASTERS GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1018,
					"offsetEnd": 1018,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I SUBSTITUTE ASSESSMENT",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1019,
					"offsetEnd": 1019,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1020,
					"offsetEnd": 1021,
					"columnNum": 141
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1022,
					"offsetEnd": 1025,
					"columnNum": 142
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I REPORTING CATEGORY 1 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_REPORTING_CATEGORY_1_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1026,
					"offsetEnd": 1027,
					"columnNum": 143
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I REPORTING CATEGORY 2 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_REPORTING_CATEGORY_2_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1028,
					"offsetEnd": 1029,
					"columnNum": 144
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I REPORTING CATEGORY 3 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_REPORTING_CATEGORY_3_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1030,
					"offsetEnd": 1031,
					"columnNum": 145
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I REPORTING CATEGORY 4 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_REPORTING_CATEGORY_4_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1032,
					"offsetEnd": 1033,
					"columnNum": 146
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I REPORTING CATEGORY 5 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_REPORTING_CATEGORY_5_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1034,
					"offsetEnd": 1035,
					"columnNum": 147
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I TEST INFORMATION INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_TEST_INFORMATION_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1036,
					"offsetEnd": 1036,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
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
					"offsetStart": 1037,
					"offsetEnd": 1049,
					"columnNum": 149
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I STAAR PROGRESS MEASURE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1050,
					"offsetEnd": 1050,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": ["2", "1", "0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I EL PERFORMANCE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_EL_PERFORMANCE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1051,
					"offsetEnd": 1051,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALGEBRA I PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_I_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1052,
					"offsetEnd": 1054,
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
					"offsetStart": 1055,
					"offsetEnd": 1100,
					"columnNum": 153
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1101,
					"offsetEnd": 1104,
					"columnNum": 154
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY COUNTY DISTRICT CAMPUS CODE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1105,
					"offsetEnd": 1113,
					"columnNum": 155
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1114,
					"offsetEnd": 1114,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1115,
					"offsetEnd": 1115,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENT’S STANDARD (APPROACHES GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1116,
					"offsetEnd": 1116,
					"columnNum": 158
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY MEETS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1117,
					"offsetEnd": 1117,
					"columnNum": 159
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY LEVEL III: ADVANCED ACADEMIC PERFORMANCE (MASTERS GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1118,
					"offsetEnd": 1118,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY SUBSTITUTE ASSESSMENT",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1119,
					"offsetEnd": 1119,
					"columnNum": 161
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1120,
					"offsetEnd": 1121,
					"columnNum": 162
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1122,
					"offsetEnd": 1125,
					"columnNum": 163
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY REPORTING CATEGORY 1 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_REPORTING_CATEGORY_1_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1126,
					"offsetEnd": 1127,
					"columnNum": 164
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY REPORTING CATEGORY 2 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_REPORTING_CATEGORY_2_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1128,
					"offsetEnd": 1129,
					"columnNum": 165
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY REPORTING CATEGORY 3 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_REPORTING_CATEGORY_3_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1130,
					"offsetEnd": 1131,
					"columnNum": 166
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY REPORTING CATEGORY 4 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_REPORTING_CATEGORY_4_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1132,
					"offsetEnd": 1133,
					"columnNum": 167
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY REPORTING CATEGORY 5 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_REPORTING_CATEGORY_5_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1134,
					"offsetEnd": 1135,
					"columnNum": 168
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY TEST INFORMATION INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_TEST_INFORMATION_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1136,
					"offsetEnd": 1136,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
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
					"offsetStart": 1137,
					"offsetEnd": 1150,
					"columnNum": 170
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY EL PERFORMANCE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_EL_PERFORMANCE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1051,
					"offsetEnd": 1051,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIOLOGY PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "BIOLOGY_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1152,
					"offsetEnd": 1154,
					"columnNum": 172
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
					"columnNum": 173
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1201,
					"offsetEnd": 1204,
					"columnNum": 174
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I COUNTY DISTRICT CAMPUS CODE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1205,
					"offsetEnd": 1213,
					"columnNum": 175
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1214,
					"offsetEnd": 1214,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": ["S", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1215,
					"offsetEnd": 1215,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I LEVEL I: SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENT’S STANDARD (APPROACHES GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1216,
					"offsetEnd": 1216,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I MEETS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1217,
					"offsetEnd": 1217,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I LEVEL III: ADVANCED ACADEMIC PERFORMANCE (MASTERS GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1218,
					"offsetEnd": 1218,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I SUBSTITUTE ASSESSMENT",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1219,
					"offsetEnd": 1219,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1220,
					"offsetEnd": 1221,
					"columnNum": 182
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1222,
					"offsetEnd": 1225,
					"columnNum": 183
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I REPORTING CATEGORY 1 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_1_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1226,
					"offsetEnd": 1227,
					"columnNum": 184
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I REPORTING CATEGORY 2 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_2_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1228,
					"offsetEnd": 1229,
					"columnNum": 185
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I REPORTING CATEGORY 3 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_3_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1230,
					"offsetEnd": 1231,
					"columnNum": 186
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I REPORTING CATEGORY 4 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_4_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1132,
					"offsetEnd": 1133,
					"columnNum": 187
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I REPORTING CATEGORY 5 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_5_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1234,
					"offsetEnd": 1235,
					"columnNum": 188
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I REPORTING CATEGORY 6 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_REPORTING_CATEGORY_6_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1236,
					"offsetEnd": 1237,
					"columnNum": 189
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
					"offsetStart": 1238,
					"offsetEnd": 1238,
					"columnNum": 190
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I TEST INFORMATION INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_TEST_INFORMATION_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1239,
					"offsetEnd": 1239,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I WRITTEN COMPOSITION SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_WRITTEN_COMPOSITION_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1240,
					"offsetEnd": 1241,
					"columnNum": 192
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
					"offsetStart": 1242,
					"offsetEnd": 1250,
					"columnNum": 193
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I EL PERFORMANCE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_EL_PERFORMANCE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1251,
					"offsetEnd": 1251,
					"columnNum": 194
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH I PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_I_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1252,
					"offsetEnd": 1254,
					"columnNum": 195
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
					"columnNum": 196
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1301,
					"offsetEnd": 1304,
					"columnNum": 197
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II COUNTY DISTRICT CAMPUS CODE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1305,
					"offsetEnd": 1313,
					"columnNum": 198
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1314,
					"offsetEnd": 1314,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": ["S", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1315,
					"offsetEnd": 1315,
					"columnNum": 200
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENT’S STANDARD (APPROACHES GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1316,
					"offsetEnd": 1316,
					"columnNum": 201
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH_II_MEETS_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1317,
					"offsetEnd": 1317,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II LEVEL III: ADVANCED ACADEMIC PERFORMANCE (MASTERS GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1318,
					"offsetEnd": 1318,
					"columnNum": 203
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II SUBSTITUTE ASSESSMENT",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1319,
					"offsetEnd": 1319,
					"columnNum": 204
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1320,
					"offsetEnd": 1321,
					"columnNum": 205
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1322,
					"offsetEnd": 1325,
					"columnNum": 206
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II REPORTING CATEGORY 1 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_1_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1326,
					"offsetEnd": 1327,
					"columnNum": 207
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II REPORTING CATEGORY 2 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_2_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1328,
					"offsetEnd": 1329,
					"columnNum": 208
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II REPORTING CATEGORY 3 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_3_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1330,
					"offsetEnd": 1331,
					"columnNum": 209
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II REPORTING CATEGORY 4 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_4_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1332,
					"offsetEnd": 1333,
					"columnNum": 210
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II REPORTING CATEGORY 5 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_5_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1334,
					"offsetEnd": 1335,
					"columnNum": 211
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II REPORTING CATEGORY 6 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_REPORTING_CATEGORY_6_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1336,
					"offsetEnd": 1337,
					"columnNum": 212
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
					"offsetStart": 1338,
					"offsetEnd": 1338,
					"columnNum": 213
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II TEST INFORMATION INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_TEST_INFORMATION_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1339,
					"offsetEnd": 1339,
					"columnNum": 214
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II WRITTEN COMPOSITION SCORE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_WRITTEN_COMPOSITION_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1340,
					"offsetEnd": 1341,
					"columnNum": 215
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
					"offsetStart": 1342,
					"offsetEnd": 1349,
					"columnNum": 216
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II STAAR PROGRESS MEASURE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1350,
					"offsetEnd": 1350,
					"columnNum": 217
				},
				"fieldLength": 1,
				"expectedValues": ["2", "1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ENGLISH II EL PERFORMANCE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_II_EL_PERFORMANCE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1351,
					"offsetEnd": 1351,
					"columnNum": 218
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
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
					"columnNum": 219
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
					"columnNum": 220
				},
				"fieldLength": 46,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1401,
					"offsetEnd": 1404,
					"columnNum": 221
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY COUNTY DISTRICT CAMPUS CODE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_COUNTY_DISTRICT_CAMPUS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1405,
					"offsetEnd": 1413,
					"columnNum": 222
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1414,
					"offsetEnd": 1414,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1415,
					"offsetEnd": 1415,
					"columnNum": 224
				},
				"fieldLength": 1,
				"expectedValues": ["A", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "U.S. HISTORY LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENT’S STANDARD (APPROACHES GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1416,
					"offsetEnd": 1416,
					"columnNum": 225
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "US HISTORY MEETS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1417,
					"offsetEnd": 1417,
					"columnNum": 226
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "U.S. HISTORY LEVEL III: ADVANCED ACADEMIC PERFORMANCE (MASTERS GRADE LEVEL)",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1418,
					"offsetEnd": 1418,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "US HISTORY SUBSTITUTE ASSESSMENT",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_SUBSTITUTE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1419,
					"offsetEnd": 1419,
					"columnNum": 228
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "US HISTORY RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1420,
					"offsetEnd": 1421,
					"columnNum": 229
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1422,
					"offsetEnd": 1425,
					"columnNum": 230
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY REPORTING CATEGORY 1 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_REPORTING_CATEGORY_1_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1426,
					"offsetEnd": 1427,
					"columnNum": 231
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY REPORTING CATEGORY 2 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_REPORTING_CATEGORY_2_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1428,
					"offsetEnd": 1429,
					"columnNum": 232
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY REPORTING CATEGORY 3 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_REPORTING_CATEGORY_3_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1430,
					"offsetEnd": 1431,
					"columnNum": 233
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY REPORTING CATEGORY 4 RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_REPORTING_CATEGORY_4_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1432,
					"offsetEnd": 1433,
					"columnNum": 234
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY TEST INFORMATION INDICATOR",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_TEST_INFORMATION_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1434,
					"offsetEnd": 1434,
					"columnNum": 235
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
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
					"offsetStart": 1435,
					"offsetEnd": 1450,
					"columnNum": 236
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "US HISTORY EL PERFORMANCE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "US_HISTORY_EL_PERFORMANCE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1451,
					"offsetEnd": 1451,
					"columnNum": 237
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","0"],
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
					"columnNum": 238
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
					"columnNum": 239
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
					"columnNum": 240
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
					"columnNum": 241
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
					"columnNum": 242
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
					"columnNum": 243
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
					"columnNum": 244
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
					"columnNum": 245
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
					"columnNum": 246
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
					"columnNum": 247
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
					"columnNum": 248
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
					"columnNum": 249
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
					"columnNum": 250
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
					"columnNum": 251
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
					"columnNum": 252
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
					"columnNum": 253
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
					"columnNum": 254
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
					"columnNum": 255
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
					"columnNum": 256
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
					"columnNum": 257
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
					"columnNum": 258
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
					"columnNum": 259
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
					"columnNum": 260
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
					"offsetEnd": 1618,
					"columnNum": 261
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CURRENT YEAR TELPAS YEARS IN U.S. SCHOOLS",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_TELPAS_YEARS_IN_US_SCHOOLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1619,
					"offsetEnd": 1619,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": ["1","2","3","4","5","6"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CURRENT YEAR TELPAS PARENTAL DENIAL",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_TELPAS_PARENTAL_DENIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1620,
					"offsetEnd": 1620,
					"columnNum": 263
				},
				"fieldLength": 1,
				"expectedValues": ["0","1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CURRENT YEAR TELPAS UNSCHOOLED ASYLEE/REFUGEE",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_TELPAS_UNSCHOOLED_ASYLEE_REFUGEE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1621,
					"offsetEnd": 1621,
					"columnNum": 264
				},
				"fieldLength": 1,
				"expectedValues": ["0","1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CURRENT YEAR TELPAS STUDENTS WITH INTERRUPTED FORMAL EDUCATION (SIFE)",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_TELPAS_STUDENTS_WITH_INTERRUPTED_FORMAL_EDUCATION_SIFE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1622,
					"offsetEnd": 1622,
					"columnNum": 265
				},
				"fieldLength": 1,
				"expectedValues": ["0","1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2022 TSDS PEIMS CRISIS CODE 1",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_TSDS_PEIMS_CRISIS_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1623,
					"offsetEnd": 1625,
					"columnNum": 266
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2022 TSDS PEIMS CRISIS CODE 2",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_TSDS_PEIMS_CRISIS_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1626,
					"offsetEnd": 1628,
					"columnNum": 267
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2022 TSDS PEIMS CRISIS CODE 3",
				"otherPossibleNames": [],
				"logicalName": "FALL_2022_TSDS_PEIMS_CRISIS_CODE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1629,
					"offsetEnd": 1631,
					"columnNum": 268
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OPPORTUNITY KEY",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_KEY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1632,
					"offsetEnd": 1667,
					"columnNum": 269
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NON-PARTICIPANT ONLINE REFUSAL",
				"otherPossibleNames": [],
				"logicalName": "NON_PARTICIPANT_ONLINE_REFUSAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1668,
					"offsetEnd": 1668,
					"columnNum": 270
				},
				"fieldLength": 1,
				"expectedValues": ["1","0"],
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
					"offsetStart": 1669,
					"offsetEnd": 1999,
					"columnNum": 271
				},
				"fieldLength": 331,
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
					"columnNum": 272
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