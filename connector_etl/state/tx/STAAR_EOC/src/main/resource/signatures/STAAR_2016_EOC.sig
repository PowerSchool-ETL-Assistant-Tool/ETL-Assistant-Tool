{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "STAAR_2016_EOC",
		"recordLength": 1000,
		"naturalKey": ["ADMINISTRATION_DATE", "TEST_VERSION", "END_OF_COURSE_CODE", "LOCAL_STUDENT_ID", "FIRST_NAME", "MIDDLE_INITIAL", "LAST_NAME", "FIRST_TIME_TESTER_RETESTER"],
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
				"physicalName": "GRADELEVELCODE",
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
				"physicalName": "COUNTYDISTRICTCAMPUS NUMBER",
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
				"physicalName": "DISTRICTNAME",
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
				"physicalName": "CAMPUS_NAME",
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
				"physicalName": "LASTNAME",
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
				"physicalName": "FIRSTNAME",
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
				"physicalName": "STUDENTID as used for TSDS PEIMS",
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
				"physicalName": "SEXCODE",
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
				"physicalName": "DATEOFBIRTH MMDDYYYY",
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
				"physicalName": "HISPANICLATINOCODE",
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
				"physicalName": "AMERICANINDIANALASKANATIVECODE",
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
				"physicalName": "ASIANCODE",
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
				"physicalName": "BLACKAFRICANAMERICANCODE",
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
				"physicalName": "NATIVEHAWAIIANPACIFICISLANDERCODE",
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
				"physicalName": "WHITECODE",
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
				"physicalName": "ETHNICITY_RACE REPORTING CATEGORY",
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
				"physicalName": "ECONOMICDISADVANTAGECODE",
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
				"physicalName": "TITLEIPARTAINDICATORCODE",
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
				"physicalName": "MIGRANTINDICATORCODE",
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
				"physicalName": "LEPINDICATORCODE",
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
				"physicalName": "BILINGUALINDICATORCODE",
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
				"physicalName": "ESLINDICATORCODE",
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
				"physicalName": "SPECIALEDINDICATORCODE",
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
				"physicalName": "GIFTEDTALENTEDINDICATORCODE",
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
				"physicalName": "ATRISKINDICATORCODE",
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
				"physicalName": "CAREERANDTECHNICALEDINDICATORCODE",
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
				"physicalName": "LOCALSTUDENTID",
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
				"physicalName": "FALL 2015 TSDS PEIMS COUNTYDISTRICTCAMPUS NUMBER",
				"otherPossibleNames": [],
				"logicalName": "FALL_2015_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
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
				"physicalName": "FALL 2015 TSDS PEIMS CRISIS CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2015_PEIMS_CRISIS_CODE",
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
				"physicalName": "FALL 2015 TSDS PEIMS STUDENT ATTRIBUTION CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_2015_PEIMS_STUDENT_ATTRIBUTION_CODE",
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
				"physicalName": "MIGRANT STUDENT IN TEXAS MIGRANT INTERSTATE PROGRAM TMIP",
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
				"physicalName": "HIGH SCHOOL EQUIVALENCY PROGRAM HSEP",
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
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 165,
					"offsetEnd": 189,
					"columnNum": 45
				},
				"fieldLength": 25,
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
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TEXAS STUDENT DATA SYSTEM TSDS UNIQUE STUDENT ID",
				"otherPossibleNames": [],
				"logicalName": "TSDS_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 200,
					"columnNum": 47
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENDOFCOURSE CODE",
				"otherPossibleNames": [],
				"logicalName": "END_OF_COURSE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 202,
					"columnNum": 48
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
					"columnNum": 49
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
					"columnNum": 50
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN A TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_A_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 215,
					"offsetEnd": 215,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN B TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_B_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 216,
					"offsetEnd": 216,
					"columnNum": 52
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN C TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_C_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 217,
					"offsetEnd": 217,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COLUMN D TAKS_TAAS_TEAMS",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_D_TAKS_TAAS_TEAMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 218,
					"offsetEnd": 218,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "COLUMN E TEA APPROVED USES",
				"otherPossibleNames": [],
				"logicalName": "COLUMN_E_TEA_APPROVED_USES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 219,
					"offsetEnd": 219,
					"columnNum": 55
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
					"columnNum": 56
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
					"columnNum": 57
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
					"columnNum": 58
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
					"columnNum": 59
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GENERAL ACCOMODATIONS",
				"otherPossibleNames": [],
				"logicalName": "GENERAL_ACCOMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 252,
					"offsetEnd": 252,
					"columnNum": 60
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
					"columnNum": 61
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
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ORAL ADMINISTRATION",
				"otherPossibleNames": [],
				"logicalName": "ORAL_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 255,
					"offsetEnd": 255,
					"columnNum": 63
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
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "LINGUISTIC ACCOMODATIONS",
				"otherPossibleNames": [],
				"logicalName": "LINGUISTIC_ACCOMODATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 257,
					"offsetEnd": 257,
					"columnNum": 65
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
					"offsetStart": 258,
					"offsetEnd": 290,
					"columnNum": 66
				},
				"fieldLength": 33,
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
					"columnNum": 67
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
					"columnNum": 68
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
					"columnNum": 69
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
					"columnNum": 70
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
					"columnNum": 71
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
					"columnNum": 72
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
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FIRSTTIME TESTER_RETESTER",
				"otherPossibleNames": [],
				"logicalName": "FIRST_TIME_TESTER_RETESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 307,
					"offsetEnd": 307,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["F", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ONLINE TEST DISRUPTION FLAG",
				"otherPossibleNames": [],
				"logicalName": "ONLINE_TEST_DISRUPTION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 308,
					"offsetEnd": 308,
					"columnNum": 75
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
					"offsetStart": 309,
					"offsetEnd": 350,
					"columnNum": 76
				},
				"fieldLength": 42,
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
					"columnNum": 77
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
					"columnNum": 78
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
					"columnNum": 79
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
					"columnNum": 80
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SHORT ANSWER ITEM SINGLE SELECTION",
				"otherPossibleNames": [],
				"logicalName": "SHORT_ANSWER_ITEM_SINGLE_SELECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 371,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SHORT ANSWER ITEM PAIRED SELECTIONS",
				"otherPossibleNames": [],
				"logicalName": "SHORT_ANSWER_ITEM_PAIRED_SELECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 372,
					"offsetEnd": 372,
					"columnNum": 82
				},
				"fieldLength": 1,
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
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": ["0", "2", "3", "4", "5", "6", "7", "8"],
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
					"offsetStart": 374,
					"offsetEnd": 386,
					"columnNum": 84
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENTS PASSING STANDARD FOR APPROACHES GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "STUDENTS_PASSING_STANDARD_FOR_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 387,
					"offsetEnd": 387,
					"columnNum": 85
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
					"offsetEnd": 389,
					"columnNum": 86
				},
				"fieldLength": 2,
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
					"offsetStart": 390,
					"offsetEnd": 390,
					"columnNum": 87
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
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL AT THE 2012_2015 STANDARD",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_AT_THE_2012_2015_STANDARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 392,
					"offsetEnd": 392,
					"columnNum": 89
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
					"columnNum": 90
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
					"columnNum": 91
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR PROGRESS MEASURE Algebra I and English II for STAAR",
				"otherPossibleNames": [],
				"logicalName": "STAAR_PROGRESS_MEASURE_ALGEBRA_I_AND_ENGLISH_II_FOR_STAAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 400,
					"offsetEnd": 400,
					"columnNum": 92
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
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 402,
					"offsetEnd": 405,
					"columnNum": 94
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 406,
					"offsetEnd": 409,
					"columnNum": 95
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 410,
					"offsetEnd": 410,
					"columnNum": 96
				},
				"fieldLength": 1,
				"expectedValues": ["S", "L", "A"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 411,
					"offsetEnd": 411,
					"columnNum": 97
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
					"offsetStart": 412,
					"offsetEnd": 412,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR LEVEL II SATISFACTORY ACADEMIC PERFORMANCE AT THE STUDENTS",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 413,
					"offsetEnd": 413,
					"columnNum": 99
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR LEVEL III  ADVANCED ACADEMIC PERFORMANCE Masters Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_LEVEL_III_ADVANCED_ACADEMIC_PERFORMANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 414,
					"offsetEnd": 414,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUSYEAR GRADE_COURSE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_GRADE_COURSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 415,
					"offsetEnd": 416,
					"columnNum": 101
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
					"columnNum": 102
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
					"columnNum": 103
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
					"columnNum": 104
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
					"columnNum": 105
				},
				"fieldLength": 68,
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
					"offsetStart": 635,
					"offsetEnd": 830,
					"columnNum": 106
				},
				"fieldLength": 196,
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
					"offsetStart": 831,
					"offsetEnd": 999,
					"columnNum": 107
				},
				"fieldLength": 169,
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
					"offsetStart": 1000,
					"offsetEnd": 1000,
					"columnNum": 108
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