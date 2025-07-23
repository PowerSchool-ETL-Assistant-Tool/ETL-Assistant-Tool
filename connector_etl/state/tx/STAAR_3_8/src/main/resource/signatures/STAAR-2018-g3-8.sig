{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "STAAR-2018-g3-8",
		"recordLength": 4000,
		"naturalKey": ["ADMINISTRATION_DATE", "LOCAL_STUDENT_ID", "FIRST_NAME", "MIDDLE_INITIAL", "LAST_NAME",
		"DATE_OF_BIRTH","SCORE_CODE_INFORMATION_READING","SCORE_CODE_INFORMATION_MATHEMATICS","SCORE_CODE_INFORMATION_WRITING",
		"SCORE_CODE_INFORMATION_SOCIAL_STUDIES","SCORE_CODE_INFORMATION_SCIENCE"],
		"fields": [{
				"physicalName": "ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 4,
					"columnNum": 1
				},
				"fieldLength": 4,
				"expectedValues": ["0418", "0518", "0618"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GRADE LEVEL TESTED",
				"otherPossibleNames": [],
				"logicalName": "GRADE_LEVEL_TESTED",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"physicalName": "CAMPUS-NAME",
				"otherPossibleNames": [],
				"logicalName": "CAMPUS_NAME",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"physicalName": "DATE-OF-BIRTH",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "MMDDYYYY",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 84,
					"offsetEnd": 91,
					"columnNum": 12
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"logicalName": "NATIVE_HAWAIIAN_PACIFIC_ISLANDER_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"logicalName": "ETHNICITY/RACE_REPORTING_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 103,
					"offsetEnd": 106,
					"columnNum": 24
				},
				"fieldLength": 4,
				"expectedValues": ["C", "F", "S", "0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEP-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "LEP_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 107,
					"offsetEnd": 107,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": ["2", "3", "4", "5", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BILINGUAL-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "BILINGUAL_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 108,
					"offsetEnd": 108,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["2", "3", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ESL-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "ESL_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 109,
					"offsetEnd": 109,
					"columnNum": 27
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"physicalName": "CAREER-AND-TECHNICAL-ED-INDICATOR-CODE (Grades 6–8)",
				"otherPossibleNames": [],
				"logicalName": "CAREER_AND_TECHNICAL_ED_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"physicalName": "ENROLLED GRADE",
				"otherPossibleNames": [],
				"logicalName": "ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 143,
					"offsetEnd": 143,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2017 TSDS PEIMS COUNTY-DISTRICT-CAMPUS NUMBER",
				"otherPossibleNames": ["FALL 2020 TSDS PEIMS COUNTY-DISTRICT-CAMPUS NUMBER"],
				"logicalName": "FALL_2017_TSDS_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"otherPossibleNames": ["FALL 2020 TSDS PEIMS CRISIS CODE"],
				"logicalName": "FALL_2017_TSDS_PEIMS_CRISIS_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"otherPossibleNames": ["FALL 2020 TSDS PEIMS STUDENT ATTRIBUTION CODE"],
				"logicalName": "FALL_2017_TSDS_PEIMS_STUDENT_ATTRIBUTION_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"isFieldRequired": "N",
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
				"physicalName": "FALL 2017 TSDS PEIMS MILITARY-CONNECTED-STUDENT-CODE",
				"otherPossibleNames": ["FALL 2020 TSDS PEIMS MILITARY-CONNECTED-STUDENT-CODE"],
				"logicalName": "FALL_2017_TSDS_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 164,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FALL 2020 TSDS PEIMS FOSTER-CARE-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "FALL_PEIMS_FST_CARE_CD",
				"formatMask": null,
				"isFieldRequired": "N",
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
                "physicalName": "CLASS GROUP NAME",
                "otherPossibleNames": [],
                "logicalName": "GROUP_NAME",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 166,
                  "offsetEnd": 185,
                  "columnNum": 46
                },
                "fieldLength": 20,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
              },
              {
                "physicalName": "FALL 2020 TSDS PEIMS DYSLEXIA-INDICATOR-CODE",
                "otherPossibleNames": [],
                "logicalName": "FALL_TSDS_DYSLEXIA_CDE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 186,
                  "offsetEnd": 186,
                  "columnNum": 47
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },

			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 187,
					"offsetEnd": 189,
					"columnNum": 48
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEW TO TEXAS",
				"otherPossibleNames": [],
				"logicalName": "NEW_TO_TEXAS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 190,
					"offsetEnd": 190,
					"columnNum": 49
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TEXAS STUDENT DATA SYSTEM (TSDS) UNIQUE STUDENT ID",
				"otherPossibleNames": [],
				"logicalName": "TSDS_SYSTEM_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 200,
					"columnNum": 50
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 204,
					"columnNum": 51
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 205,
					"offsetEnd": 208,
					"columnNum": 52
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 209,
					"offsetEnd": 212,
					"columnNum": 53
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 213,
					"offsetEnd": 216,
					"columnNum": 54
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 217,
					"offsetEnd": 220,
					"columnNum": 55
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 221,
					"offsetEnd": 225,
					"columnNum": 56
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 226,
					"offsetEnd": 230,
					"columnNum": 57
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 231,
					"offsetEnd": 235,
					"columnNum": 58
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 236,
					"offsetEnd": 240,
					"columnNum": 59
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 241,
					"offsetEnd": 245,
					"columnNum": 60
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING",
				"otherPossibleNames": [],
				"logicalName": "EOC_ABOVE_GRADE_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 246,
					"offsetEnd": 246,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "EOC_ABOVE_GRADE_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 247,
					"offsetEnd": 247,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "EOC_ABOVE_GRADE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 248,
					"offsetEnd": 248,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "EOC_ABOVE_GRADE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 249,
					"offsetEnd": 249,
					"columnNum": 64
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 250,
					"offsetEnd": 251,
					"columnNum": 65
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_READING_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 252,
					"offsetEnd": 252,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_READING_BRAILLE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 253,
					"offsetEnd": 253,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_READING_LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 254,
					"offsetEnd": 254,
					"columnNum": 68
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 255,
					"offsetEnd": 255,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extra Day",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_READING_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 256,
					"offsetEnd": 256,
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 257,
					"offsetEnd": 258,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-To-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_READING_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 259,
					"offsetEnd": 259,
					"columnNum": 72
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 260,
					"offsetEnd": 261,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content and Language Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_READING_CONTENT_AND_LANGUAGE_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 262,
					"offsetEnd": 262,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
	        {
                "physicalName": "ASL Signed Videos",
                "otherPossibleNames": [],
                "logicalName": "TEST_ACCOMMODATIONS_READING_ASL_SIGNED_VIDEO",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 263,
                  "offsetEnd": 263,
                  "columnNum": 75
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 264,
					"offsetEnd": 271,
					"columnNum": 76
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_MATHEMATICS_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 272,
					"offsetEnd": 272,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_MATHEMATICS_BRAILLE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 273,
					"offsetEnd": 273,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_MATHEMATICS_LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 274,
					"offsetEnd": 274,
					"columnNum": 79
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 275,
					"offsetEnd": 275,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extra Day",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_MATHEMATICS_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 276,
					"offsetEnd": 276,
					"columnNum": 81
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 277,
					"offsetEnd": 278,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-To-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_MATHEMATICS_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 279,
					"offsetEnd": 279,
					"columnNum": 83
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 280,
					"offsetEnd": 281,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content and Language Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_MATHEMATICS_CONTENT_AND_LANGUAGE_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 282,
					"offsetEnd": 282,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
            {
                "physicalName": "ASL Signed Videos",
                "otherPossibleNames": [],
                "logicalName": "TEST_ACCOMMODATIONS_READING_ASL_SIGNED_VIDEO",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 283,
                  "offsetEnd": 283,
                  "columnNum": 86
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 284,
					"offsetEnd": 291,
					"columnNum": 87
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 292,
					"offsetEnd": 292,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_BRAILLE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 293,
					"offsetEnd": 293,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 294,
					"offsetEnd": 294,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Extra Day",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 295,
					"offsetEnd": 295,
					"columnNum": 91
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 296,
					"offsetEnd": 296,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-To-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 297,
					"offsetEnd": 297,
					"columnNum": 93
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 298,
					"offsetEnd": 299,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content and Language Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_CONTENT_AND_LANGUAGE_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 300,
					"offsetEnd": 300,
					"columnNum": 95
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Spelling Assistance",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_WRITTING_SPELLING_ASSISTANCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 301,
					"offsetEnd": 301,
					"columnNum": 96
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 302,
					"offsetEnd": 311,
					"columnNum": 97
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SOCIAL_STUDIES_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 312,
					"offsetEnd": 312,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SOCIAL_STUDIES_BRAILLE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 313,
					"offsetEnd": 313,
					"columnNum": 99
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SOCIAL_STUDIES_LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 314,
					"offsetEnd": 314,
					"columnNum": 100
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 315,
					"offsetEnd": 315,
					"columnNum": 101
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extra Day",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SOCIAL_STUDIES_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 316,
					"offsetEnd": 316,
					"columnNum": 102
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 317,
					"offsetEnd": 318,
					"columnNum": 103
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-To-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SOCIAL_STUDIES_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 319,
					"offsetEnd": 319,
					"columnNum": 104
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 320,
					"offsetEnd": 321,
					"columnNum": 105
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content and Language Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SOCIAL_STUDIES_CONTENT_AND_LANGUAGE_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 322,
					"offsetEnd": 322,
					"columnNum": 106
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
	        {
                "physicalName": "ASL Signed Videos",
                "otherPossibleNames": [],
                "logicalName": "TEST_ACCOMMODATIONS_READING_ASL_SIGNED_VIDEO",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 323,
                  "offsetEnd": 323,
                  "columnNum": 107
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
             },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 324,
					"offsetEnd": 331,
					"columnNum": 108
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SCIENCE_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 332,
					"offsetEnd": 332,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Braille",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SCIENCE_BRAILLE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 333,
					"offsetEnd": 333,
					"columnNum": 110
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Large Print",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SCIENCE_LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 334,
					"offsetEnd": 334,
					"columnNum": 111
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 335,
					"offsetEnd": 335,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Extra Day",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SCIENCE_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 336,
					"offsetEnd": 336,
					"columnNum": 113
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 337,
					"offsetEnd": 338,
					"columnNum": 114
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Text-To-Speech",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SCIENCE_TEXT_TO_SPEECH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 339,
					"offsetEnd": 339,
					"columnNum": 115
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 340,
					"offsetEnd": 341,
					"columnNum": 116
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Content and Language Supports",
				"otherPossibleNames": [],
				"logicalName": "TEST_ACCOMMODATIONS_SCIENCE_CONTENT_AND_LANGUAGE_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 342,
					"offsetEnd": 342,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
            {
                "physicalName": "ASL Signed Videos",
                "otherPossibleNames": [],
                "logicalName": "TEST_ACCOMMODATIONS_READING_ASL_SIGNED_VIDEO",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 343,
                  "offsetEnd": 343,
                  "columnNum": 118
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 344,
					"offsetEnd": 350,
					"columnNum": 119
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE_CODE_INFORMATION_READING",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_INFORMATION_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 351,
					"offsetEnd": 351,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "P", "W", "*", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE_CODE_INFORMATION_MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_INFORMATION_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 352,
					"offsetEnd": 352,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "P", "W", "*", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE_CODE_INFORMATION_WRITING",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_INFORMATION_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 353,
					"offsetEnd": 353,
					"columnNum": 122
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE_CODE_INFORMATION_SOCIAL_STUDIES",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_INFORMATION_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 354,
					"offsetEnd": 354,
					"columnNum": 123
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "*", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE_CODE_INFORMATION_SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_INFORMATION_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 355,
					"offsetEnd": 355,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "*", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_DEFAULT_INFORMATION_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 356,
					"offsetEnd": 356,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": ["3", "2", "1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_DEFAULT_INFORMATION_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 357,
					"offsetEnd": 357,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": ["3", "2", "1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "WRITING",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_DEFAULT_INFORMATION_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 358,
					"offsetEnd": 358,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_DEFAULT_INFORMATION_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 359,
					"offsetEnd": 359,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_CODE_DEFAULT_INFORMATION_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 360,
					"offsetEnd": 360,
					"columnNum": 129
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 361,
					"offsetEnd": 400,
					"columnNum": 130
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING REPORTING CATEGORY SCORES",
				"otherPossibleNames": [],
				"logicalName": "READING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 401,
					"offsetEnd": 406,
					"columnNum": 131
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 407,
					"offsetEnd": 408,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 409,
					"offsetEnd": 412,
					"columnNum": 133
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "READING_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 413,
					"offsetEnd": 413,
					"columnNum": 134
				},
				"fieldLength": 1,
				"expectedValues": ["E", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "READING_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 414,
					"offsetEnd": 414,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING TEST ADMINISTRATION MODE",
				"otherPossibleNames": [],
				"logicalName": "READING_TEST_ADMINISTRATION_MODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 415,
					"offsetEnd": 415,
					"columnNum": 136
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 416,
					"offsetEnd": 422,
					"columnNum": 137
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MEETS GRADE LEVEL IN READING",
				"otherPossibleNames": [],
				"logicalName": "MEETS_GRADE_LEVEL_IN_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 423,
					"offsetEnd": 423,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL IN READING",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_IN_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 424,
					"offsetEnd": 424,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MASTERS GRADE LEVEL IN READING",
				"otherPossibleNames": [],
				"logicalName": "MASTERS_GRADE_LEVEL_IN_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 425,
					"offsetEnd": 425,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "READING_STAAR_PROGRESS_MEASURE(grades 4–8)",
				"otherPossibleNames": [],
				"logicalName": "READING_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 426,
					"offsetEnd": 426,
					"columnNum": 141
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 427,
					"offsetEnd": 428,
					"columnNum": 142
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ON TRACK TO MEET GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "READING_ON_TRACK_TO_MEET_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 429,
					"offsetEnd": 429,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "READING_PREVIOUS_YEAR_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 430,
					"offsetEnd": 433,
					"columnNum": 144
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "READING_PREVIOUS_YEAR_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 434,
					"offsetEnd": 437,
					"columnNum": 145
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "READING_PREVIOUS_YEAR_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 438,
					"offsetEnd": 438,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": ["E", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 439,
					"offsetEnd": 439,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "READING_PREVIOUS_YEAR_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 440,
					"offsetEnd": 440,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "P", "W", "*", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 441,
					"offsetEnd": 441,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR MASTERS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "READING_PREVIOUS_YEAR_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 442,
					"offsetEnd": 442,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR TESTED GRADE",
				"otherPossibleNames": [],
				"logicalName": "READING_PREVIOUS_YEAR_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 443,
					"offsetEnd": 444,
					"columnNum": 151
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
            "physicalName": "READING EL PERFORMANCE MEASURE",
            "otherPossibleNames": [],
            "logicalName": "RD_EL_PERF_MEASURE",
            "formatMask": null,
            "isFieldRequired": "N",
            "canBeNull": "Y",
            "fieldOffset": {
              "offsetStart": 445,
              "offsetEnd": 445,
              "columnNum": 152
            },
            "fieldLength": 1,
            "fieldPrecision": null,
            "expectedValues": [],
            "dataTypes": "STRING",
            "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 446,
					"offsetEnd": 450,
					"columnNum": 153
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING ITEM REPORTING CATEGORY NUMBERS",
				"otherPossibleNames": [],
				"logicalName": "READING_ITEM_REPORTING_CATEGORY_NUMBERS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 451,
					"offsetEnd": 494,
					"columnNum": 154
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 495,
					"offsetEnd": 502,
					"columnNum": 155
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING ITEM STUDENT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "READING_ITEM_STUDENT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 503,
					"offsetEnd": 546,
					"columnNum": 156
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 547,
					"offsetEnd": 554,
					"columnNum": 157
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING ITEM CORRECT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "READING_ITEM_CORRECT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 555,
					"offsetEnd": 598,
					"columnNum": 158
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 599,
					"offsetEnd": 606,
					"columnNum": 159
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEXILE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 607,
					"offsetEnd": 611,
					"columnNum": 160
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "READING_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 612,
					"offsetEnd": 614,
					"columnNum": 161
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 615,
					"offsetEnd": 750,
					"columnNum": 162
				},
				"fieldLength": 136,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS REPORTING CATEGORY SCORES",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 751,
					"offsetEnd": 758,
					"columnNum": 163
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 759,
					"offsetEnd": 760,
					"columnNum": 164
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 761,
					"offsetEnd": 762,
					"columnNum": 165
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 763,
					"offsetEnd": 766,
					"columnNum": 166
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 767,
					"offsetEnd": 767,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": ["E", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 768,
					"offsetEnd": 768,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS TEST ADMINISTRATION MODE",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_TEST_ADMINISTRATION_MODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 769,
					"offsetEnd": 769,
					"columnNum": 169
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 770,
					"offsetEnd": 776,
					"columnNum": 170
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MEETS GRADE LEVEL IN MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "MEETS_GRADE_LEVEL_IN_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 777,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL IN MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_IN_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 778,
					"offsetEnd": 778,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MASTERS GRADE LEVEL IN MATHEMATICS",
				"otherPossibleNames": [],
				"logicalName": "MASTERS_GRADE_LEVEL_IN_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 779,
					"offsetEnd": 779,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS_STAAR_PROGRESS_MEASURE(grades 4–8)",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 780,
					"offsetEnd": 780,
					"columnNum": 174
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 781,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ON TRACK TO MEET GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ON_TRACK_TO_MEET_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 782,
					"offsetEnd": 782,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR ADMINISTRATION DATE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_ADMINISTRATION_DATE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 783,
					"offsetEnd": 786,
					"columnNum": 177
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 787,
					"offsetEnd": 790,
					"columnNum": 178
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 791,
					"offsetEnd": 791,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": ["E", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 792,
					"offsetEnd": 792,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR SCORE CODE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 793,
					"offsetEnd": 793,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["A", "D", "O", "P", "W", "*", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 794,
					"offsetEnd": 794,
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR MASTERS GRADE LEVEL",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 795,
					"offsetEnd": 795,
					"columnNum": 183
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PREVIOUS-YEAR TESTED GRADE",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 796,
					"offsetEnd": 797,
					"columnNum": 184
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "MATHEMATICS EL PERFORMANCE MEASURE",
                "otherPossibleNames": [],
                "logicalName": "MA_EL_PERF_MEASURE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 798,
                  "offsetEnd": 798,
                  "columnNum": 185
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 799,
					"offsetEnd": 800,
					"columnNum": 186
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS ITEM REPORTING CATEGORY NUMBERS",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_ITEM_REPORTING_CATEGORY_NUMBERS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 801,
					"offsetEnd": 842,
					"columnNum": 187
				},
				"fieldLength": 42,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 843,
					"offsetEnd": 856,
					"columnNum": 188
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS ITEM STUDENT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_ITEM_STUDENT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 857,
					"offsetEnd": 898,
					"columnNum": 189
				},
				"fieldLength": 42,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 899,
					"offsetEnd": 912,
					"columnNum": 190
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS ITEM CORRECT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_ITEM_CORRECT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 913,
					"offsetEnd": 954,
					"columnNum": 191
				},
				"fieldLength": 42,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 955,
					"offsetEnd": 968,
					"columnNum": 192
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATHEMATICS PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 969,
					"offsetEnd": 971,
					"columnNum": 193
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "QUANTILE MEASURE",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 972,
					"offsetEnd": 976,
					"columnNum": 194
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
		    {
                "physicalName": "MATHEMATICS BADGE INDICATOR",
                "otherPossibleNames": [],
                "logicalName": "MA_BADGE_IND",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 977,
                  "offsetEnd": 977,
                  "columnNum": 195
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
             },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 978,
					"offsetEnd": 1100,
					"columnNum": 196
				},
				"fieldLength": 123,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING REPORTING CATEGORY SCORES",
				"otherPossibleNames": [],
				"logicalName": "WRITING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1101,
					"offsetEnd": 1106,
					"columnNum": 197
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1107,
					"offsetEnd": 1108,
					"columnNum": 198
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1109,
					"offsetEnd": 1112,
					"columnNum": 199
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "WRITING_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1113,
					"offsetEnd": 1113,
					"columnNum": 200
				},
				"fieldLength": 1,
				"expectedValues": ["E", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "WRITING_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1114,
					"offsetEnd": 1114,
					"columnNum": 201
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING TEST ADMINISTRATION MODE",
				"otherPossibleNames": [],
				"logicalName": "WRITING_TEST_ADMINISTRATION_MODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1115,
					"offsetEnd": 1115,
					"columnNum": 202
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1116,
					"offsetEnd": 1120,
					"columnNum": 203
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
		    {
                "physicalName": "WRITING TEST FORM VERSION",
                "otherPossibleNames": [],
                "logicalName": "WRITING_TST_FORM_VERSION",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 1121,
                  "offsetEnd": 1122,
                  "columnNum": 204
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "MEETS GRADE LEVEL IN WRITING",
				"otherPossibleNames": [],
				"logicalName": "MEETS_GRADE_LEVEL_IN_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1123,
					"offsetEnd": 1123,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL IN WRITING",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_IN_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1124,
					"offsetEnd": 1124,
					"columnNum": 206
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MASTERS GRADE LEVEL IN WRITING",
				"otherPossibleNames": [],
				"logicalName": "MASTERS_GRADE_LEVEL_IN_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1125,
					"offsetEnd": 1125,
					"columnNum": 207
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "WRITTEN COMPOSITION SCORE",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_COMPOSITION_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1126,
					"offsetEnd": 1126,
					"columnNum": 208
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1127,
					"offsetEnd": 1153,
					"columnNum": 209
				},
				"fieldLength": 27,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
	        {
                "physicalName": "WRITING EL PERFORMANCE MEASURE",
                "otherPossibleNames": [],
                "logicalName": "WR_EL_PERF_MEASURE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 1154,
                  "offsetEnd": 1154,
                  "columnNum": 210
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "BLANK",
                "otherPossibleNames": [],
                "logicalName": "BLANK",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 1155,
                  "offsetEnd": 1200,
                  "columnNum": 211
                },
                "fieldLength": 46,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "WRITING ITEM REPORTING CATEGORY NUMBERS",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ITEM_REPORTING_CATEGORY_NUMBERS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1201,
					"offsetEnd": 1230,
					"columnNum": 212
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1231,
					"offsetEnd": 1240,
					"columnNum": 213
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING ITEM STUDENT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ITEM_STUDENT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1241,
					"offsetEnd": 1270,
					"columnNum": 214
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1271,
					"offsetEnd": 1280,
					"columnNum": 215
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING ITEM CORRECT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ITEM_CORRECT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1281,
					"offsetEnd": 1310,
					"columnNum": 216
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITING PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1311,
					"offsetEnd": 1313,
					"columnNum": 217
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1314,
					"offsetEnd": 1500,
					"columnNum": 218
				},
				"fieldLength": 187,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES REPORTING CATEGORY SCORES",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1501,
					"offsetEnd": 1508,
					"columnNum": 219
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1509,
					"offsetEnd": 1510,
					"columnNum": 220
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1511,
					"offsetEnd": 1514,
					"columnNum": 221
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1515,
					"offsetEnd": 1515,
					"columnNum": 222
				},
				"fieldLength": 1,
				"expectedValues": ["E"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1516,
					"offsetEnd": 1516,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES TEST ADMINISTRATION MODE",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_TEST_ADMINISTRATION_MODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1517,
					"offsetEnd": 1517,
					"columnNum": 224
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1518,
					"offsetEnd": 1524,
					"columnNum": 225
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MEETS GRADE LEVEL IN SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "MEETS_GRADE_LEVEL_IN_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1525,
					"offsetEnd": 1525,
					"columnNum": 226
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL IN SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_IN_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1526,
					"offsetEnd": 1526,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MASTERS GRADE LEVEL IN SOCIAL STUDIES",
				"otherPossibleNames": [],
				"logicalName": "MASTERS_GRADE_LEVEL_IN_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1527,
					"offsetEnd": 1527,
					"columnNum": 228
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
	        {
                "physicalName": "SOCIAL STUDIES EL PERFORMANCE MEASURE",
                "otherPossibleNames": [],
                "logicalName": "SS_EL_PERF_MEASURE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 1528,
                  "offsetEnd": 1528,
                  "columnNum": 229
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
             },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1529,
					"offsetEnd": 1600,
					"columnNum": 230
				},
				"fieldLength": 72,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES ITEM REPORTING CATEGORY NUMBERS",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_ITEM_REPORTING_CATEGORY_NUMBERS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1601,
					"offsetEnd": 1644,
					"columnNum": 231
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1645,
					"offsetEnd": 1652,
					"columnNum": 232
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES ITEM STUDENT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_ITEM_STUDENT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1653,
					"offsetEnd": 1696,
					"columnNum": 233
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1697,
					"offsetEnd": 1704,
					"columnNum": 234
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES ITEM CORRECT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_ITEM_CORRECT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1705,
					"offsetEnd": 1748,
					"columnNum": 235
				},
				"fieldLength": 44,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1749,
					"offsetEnd": 1756,
					"columnNum": 236
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SOCIAL STUDIES PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_STUDIES_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1757,
					"offsetEnd": 1759,
					"columnNum": 237
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1760,
					"offsetEnd": 1900,
					"columnNum": 238
				},
				"fieldLength": 141,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE REPORTING CATEGORY SCORES",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1901,
					"offsetEnd": 1908,
					"columnNum": 239
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE RAW SCORE",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1909,
					"offsetEnd": 1910,
					"columnNum": 240
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE SCALE SCORE",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1911,
					"offsetEnd": 1914,
					"columnNum": 241
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE LANGUAGE VERSION",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1915,
					"offsetEnd": 1915,
					"columnNum": 242
				},
				"fieldLength": 1,
				"expectedValues": ["E", "S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE TEST VERSION",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1916,
					"offsetEnd": 1916,
					"columnNum": 243
				},
				"fieldLength": 1,
				"expectedValues": ["S"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE TEST ADMINISTRATION MODE",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_TEST_ADMINISTRATION_MODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1917,
					"offsetEnd": 1917,
					"columnNum": 244
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1918,
					"offsetEnd": 1924,
					"columnNum": 245
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MEETS GRADE LEVEL IN SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "MEETS_GRADE_LEVEL_IN_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1925,
					"offsetEnd": 1925,
					"columnNum": 246
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "APPROACHES GRADE LEVEL IN SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "APPROACHES_GRADE_LEVEL_IN_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1926,
					"offsetEnd": 1926,
					"columnNum": 247
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MASTERS GRADE LEVEL IN SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "MASTERS_GRADE_LEVEL_IN_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1927,
					"offsetEnd": 1927,
					"columnNum": 248
				},
				"fieldLength": 1,
				"expectedValues": ["1", "0"],
				"dataTypes": "INTEGER",
				"scale": null
			},
		    {
                "physicalName": "SCIENCE EL PERFORMANCE MEASURE",
                "otherPossibleNames": [],
                "logicalName": "SC_EL_PERF_MEASURE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 1928,
                  "offsetEnd": 1928,
                  "columnNum": 249
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1929,
					"offsetEnd": 2000,
					"columnNum": 250
				},
				"fieldLength": 72,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE ITEM REPORTING CATEGORY NUMBERS",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_ITEM_REPORTING_CATEGORY_NUMBERS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2001,
					"offsetEnd": 2042,
					"columnNum": 251
				},
				"fieldLength": 42,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2043,
					"offsetEnd": 2054,
					"columnNum": 252
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE ITEM STUDENT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_ITEM_STUDENT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2055,
					"offsetEnd": 2096,
					"columnNum": 253
				},
				"fieldLength": 42,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2097,
					"offsetEnd": 2108,
					"columnNum": 254
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE ITEM CORRECT RESPONSES",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_ITEM_CORRECT_RESPONSES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2109,
					"offsetEnd": 2150,
					"columnNum": 255
				},
				"fieldLength": 42,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2151,
					"offsetEnd": 2162,
					"columnNum": 256
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCIENCE PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2163,
					"offsetEnd": 2165,
					"columnNum": 257
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2166,
					"offsetEnd": 2250,
					"columnNum": 258
				},
				"fieldLength": 85,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2251,
					"offsetEnd": 2259,
					"columnNum": 259
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2260,
					"offsetEnd": 2260,
					"columnNum": 260
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2261,
					"offsetEnd": 2261,
					"columnNum": 261
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2262,
					"offsetEnd": 2262,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2263,
					"offsetEnd": 2263,
					"columnNum": 263
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2264,
					"offsetEnd": 2264,
					"columnNum": 264
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2265,
					"offsetEnd": 2268,
					"columnNum": 265
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2269,
					"offsetEnd": 2269,
					"columnNum": 266
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2270,
					"offsetEnd": 2270,
					"columnNum": 267
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2271,
					"offsetEnd": 2275,
					"columnNum": 268
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2276,
					"offsetEnd": 2276,
					"columnNum": 269
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2277,
					"offsetEnd": 2279,
					"columnNum": 270
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2280,
					"offsetEnd": 2280,
					"columnNum": 271
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2281,
					"offsetEnd": 2289,
					"columnNum": 272
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2290,
					"offsetEnd": 2290,
					"columnNum": 273
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2291,
					"offsetEnd": 2291,
					"columnNum": 274
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2292,
					"offsetEnd": 2292,
					"columnNum": 275
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2293,
					"offsetEnd": 2293,
					"columnNum": 276
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2294,
					"offsetEnd": 2294,
					"columnNum": 277
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2295,
					"offsetEnd": 2298,
					"columnNum": 278
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2299,
					"offsetEnd": 2299,
					"columnNum": 279
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2300,
					"offsetEnd": 2300,
					"columnNum": 280
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2301,
					"offsetEnd": 2305,
					"columnNum": 281
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2306,
					"offsetEnd": 2306,
					"columnNum": 282
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2307,
					"offsetEnd": 2309,
					"columnNum": 283
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2310,
					"offsetEnd": 2310,
					"columnNum": 284
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2311,
					"offsetEnd": 2319,
					"columnNum": 285
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2320,
					"offsetEnd": 2320,
					"columnNum": 286
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2321,
					"offsetEnd": 2321,
					"columnNum": 287
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2322,
					"offsetEnd": 2322,
					"columnNum": 288
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2323,
					"offsetEnd": 2323,
					"columnNum": 289
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2324,
					"offsetEnd": 2324,
					"columnNum": 290
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2325,
					"offsetEnd": 2328,
					"columnNum": 291
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2329,
					"offsetEnd": 2329,
					"columnNum": 292
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2330,
					"offsetEnd": 2330,
					"columnNum": 293
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2331,
					"offsetEnd": 2331,
					"columnNum": 294
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2332,
					"offsetEnd": 2334,
					"columnNum": 295
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_QUANTILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2335,
					"offsetEnd": 2339,
					"columnNum": 296
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2340,
					"offsetEnd": 2340,
					"columnNum": 297
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2341,
					"offsetEnd": 2349,
					"columnNum": 298
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2350,
					"offsetEnd": 2350,
					"columnNum": 299
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2351,
					"offsetEnd": 2351,
					"columnNum": 300
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2352,
					"offsetEnd": 2352,
					"columnNum": 301
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2353,
					"offsetEnd": 2353,
					"columnNum": 302
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2354,
					"offsetEnd": 2354,
					"columnNum": 303
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2355,
					"offsetEnd": 2358,
					"columnNum": 304
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2359,
					"offsetEnd": 2359,
					"columnNum": 305
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2360,
					"offsetEnd": 2360,
					"columnNum": 306
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Gradle Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_MEETS_GRADLE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2361,
					"offsetEnd": 2361,
					"columnNum": 307
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2362,
					"offsetEnd": 2364,
					"columnNum": 308
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_QUANTILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2365,
					"offsetEnd": 2369,
					"columnNum": 309
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2370,
					"offsetEnd": 2370,
					"columnNum": 310
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2371,
					"offsetEnd": 2379,
					"columnNum": 311
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2380,
					"offsetEnd": 2380,
					"columnNum": 312
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2381,
					"offsetEnd": 2381,
					"columnNum": 313
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2382,
					"offsetEnd": 2382,
					"columnNum": 314
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2383,
					"offsetEnd": 2383,
					"columnNum": 315
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2384,
					"offsetEnd": 2384,
					"columnNum": 316
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2385,
					"offsetEnd": 2388,
					"columnNum": 317
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2389,
					"offsetEnd": 2389,
					"columnNum": 318
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2390,
					"offsetEnd": 2390,
					"columnNum": 319
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SOCIAL_STUDIES_HISTORY_PRIMARY_ADMINISTRATION_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2391,
					"offsetEnd": 2393,
					"columnNum": 320
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
				"physicalName": "Test Information Indicator",
				"otherPossibleNames": [],
				"logicalName": "Test_Information_Indicator_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2394,
					"offsetEnd": 2394,
					"columnNum": 321
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2395,
					"offsetEnd": 2400,
					"columnNum": 322
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2401,
					"offsetEnd": 2409,
					"columnNum": 323
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2410,
					"offsetEnd": 2410,
					"columnNum": 324
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2411,
					"offsetEnd": 2411,
					"columnNum": 325
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2412,
					"offsetEnd": 2412,
					"columnNum": 326
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2413,
					"offsetEnd": 2413,
					"columnNum": 327
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2414,
					"offsetEnd": 2414,
					"columnNum": 328
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2415,
					"offsetEnd": 2418,
					"columnNum": 329
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2419,
					"offsetEnd": 2419,
					"columnNum": 330
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets grade level",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2420,
					"offsetEnd": 2420,
					"columnNum": 331
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percentile",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_SCIENCE_HISTORY_PRIMARY_ADMINISTRATION_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2421,
					"offsetEnd": 2423,
					"columnNum": 332
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Information Indicator",
				"otherPossibleNames": [],
				"logicalName": "Test_Information_Indicator_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2424,
					"offsetEnd": 2424,
					"columnNum": 333
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2425,
					"offsetEnd": 2430,
					"columnNum": 334
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_READING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2431,
					"offsetEnd": 2436,
					"columnNum": 335
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2437,
					"offsetEnd": 2438,
					"columnNum": 336
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2439,
					"offsetEnd": 2440,
					"columnNum": 337
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_READING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2441,
					"offsetEnd": 2446,
					"columnNum": 338
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2447,
					"offsetEnd": 2448,
					"columnNum": 339
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2449,
					"offsetEnd": 2450,
					"columnNum": 340
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mathematics Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_MATHEMATICS_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2451,
					"offsetEnd": 2458,
					"columnNum": 341
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mathematics Raw Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_MATHEMATICS_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2459,
					"offsetEnd": 2460,
					"columnNum": 342
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
                "physicalName": "Mathematics Badge",
                "otherPossibleNames": [],
                "logicalName": "MA_CURYRHIS_MA_BADGE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 2461,
                  "offsetEnd": 2461,
                  "columnNum": 343
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2462,
					"offsetEnd": 2462,
					"columnNum": 344
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mathematics Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_MATHEMATICS_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2463,
					"offsetEnd": 2470,
					"columnNum": 345
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mathematics Raw Score",
				"otherPossibleNames": [],
				"logicalName": "CURRENT_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_MATHEMATICS_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2471,
					"offsetEnd": 2472,
					"columnNum": 346
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Mathematics Badge",
                "otherPossibleNames": [],
                "logicalName": "MA_CURYRHIS_MAYBADGE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 2473,
                  "offsetEnd": 2473,
                  "columnNum": 347
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2474,
					"offsetEnd": 2500,
					"columnNum": 348
				},
				"fieldLength": 27,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2501,
					"offsetEnd": 2509,
					"columnNum": 349
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2510,
					"offsetEnd": 2510,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2511,
					"offsetEnd": 2511,
					"columnNum": 351
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2512,
					"offsetEnd": 2512,
					"columnNum": 352
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2513,
					"offsetEnd": 2513,
					"columnNum": 353
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2514,
					"offsetEnd": 2514,
					"columnNum": 354
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2515,
					"offsetEnd": 2518,
					"columnNum": 355
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2519,
					"offsetEnd": 2520,
					"columnNum": 356
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2521,
					"offsetEnd": 2522,
					"columnNum": 357
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2523,
					"offsetEnd": 2523,
					"columnNum": 358
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2524,
					"offsetEnd": 2524,
					"columnNum": 359
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2525,
					"offsetEnd": 2529,
					"columnNum": 360
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level SPRING ADMINISTRATION",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_PRIMARY_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2530,
					"offsetEnd": 2530,
					"columnNum": 361
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2531,
					"offsetEnd": 2539,
					"columnNum": 362
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2540,
					"offsetEnd": 2540,
					"columnNum": 363
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2541,
					"offsetEnd": 2541,
					"columnNum": 364
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2542,
					"offsetEnd": 2542,
					"columnNum": 365
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2543,
					"offsetEnd": 2543,
					"columnNum": 366
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2544,
					"offsetEnd": 2544,
					"columnNum": 367
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2545,
					"offsetEnd": 2548,
					"columnNum": 368
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2549,
					"offsetEnd": 2550,
					"columnNum": 369
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2551,
					"offsetEnd": 2552,
					"columnNum": 370
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2553,
					"offsetEnd": 2553,
					"columnNum": 371
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2554,
					"offsetEnd": 2554,
					"columnNum": 372
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2555,
					"offsetEnd": 2555,
					"columnNum": 373
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2556,
					"offsetEnd": 2560,
					"columnNum": 374
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2561,
					"offsetEnd": 2569,
					"columnNum": 375
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2570,
					"offsetEnd": 2570,
					"columnNum": 376
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2571,
					"offsetEnd": 2571,
					"columnNum": 377
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2572,
					"offsetEnd": 2572,
					"columnNum": 378
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2573,
					"offsetEnd": 2573,
					"columnNum": 379
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2574,
					"offsetEnd": 2574,
					"columnNum": 380
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2575,
					"offsetEnd": 2578,
					"columnNum": 381
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2579,
					"offsetEnd": 2580,
					"columnNum": 382
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2581,
					"offsetEnd": 2582,
					"columnNum": 383
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2583,
					"offsetEnd": 2583,
					"columnNum": 384
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2584,
					"offsetEnd": 2584,
					"columnNum": 385
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2585,
					"offsetEnd": 2589,
					"columnNum": 386
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level ",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_MAY_RETEST_ADMINISTRATION_MEETS_GRADE_LEVE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2590,
					"offsetEnd": 2590,
					"columnNum": 387
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2591,
					"offsetEnd": 2599,
					"columnNum": 388
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2600,
					"offsetEnd": 2600,
					"columnNum": 389
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2601,
					"offsetEnd": 2601,
					"columnNum": 390
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2602,
					"offsetEnd": 2602,
					"columnNum": 391
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2603,
					"offsetEnd": 2603,
					"columnNum": 392
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2604,
					"offsetEnd": 2604,
					"columnNum": 393
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2605,
					"offsetEnd": 2605,
					"columnNum": 394
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2606,
					"offsetEnd": 2609,
					"columnNum": 395
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2610,
					"offsetEnd": 2611,
					"columnNum": 396
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2612,
					"offsetEnd": 2613,
					"columnNum": 397
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2614,
					"offsetEnd": 2614,
					"columnNum": 398
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2615,
					"offsetEnd": 2615,
					"columnNum": 399
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_JUNE_RETEST_ADMINISTRATION_LEXILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2616,
					"offsetEnd": 2620,
					"columnNum": 400
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2621,
					"offsetEnd": 2629,
					"columnNum": 401
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2630,
					"offsetEnd": 2630,
					"columnNum": 402
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2631,
					"offsetEnd": 2631,
					"columnNum": 403
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2632,
					"offsetEnd": 2632,
					"columnNum": 404
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2633,
					"offsetEnd": 2633,
					"columnNum": 405
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2634,
					"offsetEnd": 2634,
					"columnNum": 406
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2635,
					"offsetEnd": 2638,
					"columnNum": 407
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2639,
					"offsetEnd": 2640,
					"columnNum": 408
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2641,
					"offsetEnd": 2642,
					"columnNum": 409
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2643,
					"offsetEnd": 2643,
					"columnNum": 410
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2644,
					"offsetEnd": 2644,
					"columnNum": 411
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_PRIMARY_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2645,
					"offsetEnd": 2645,
					"columnNum": 412
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": ["Quantile Measure"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2646,
					"offsetEnd": 2650,
					"columnNum": 413
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2651,
					"offsetEnd": 2659,
					"columnNum": 414
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2660,
					"offsetEnd": 2660,
					"columnNum": 415
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2661,
					"offsetEnd": 2661,
					"columnNum": 416
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2662,
					"offsetEnd": 2662,
					"columnNum": 417
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2663,
					"offsetEnd": 2663,
					"columnNum": 418
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2664,
					"offsetEnd": 2664,
					"columnNum": 419
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2665,
					"offsetEnd": 2668,
					"columnNum": 420
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2669,
					"offsetEnd": 2670,
					"columnNum": 421
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2671,
					"offsetEnd": 2672,
					"columnNum": 422
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2673,
					"offsetEnd": 2673,
					"columnNum": 423
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2674,
					"offsetEnd": 2674,
					"columnNum": 424
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2675,
					"offsetEnd": 2675,
					"columnNum": 425
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SPRING_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2676,
					"offsetEnd": 2676,
					"columnNum": 426
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": ["Quantile Measure"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2677,
					"offsetEnd": 2680,
					"columnNum": 427
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2681,
					"offsetEnd": 2689,
					"columnNum": 428
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2690,
					"offsetEnd": 2690,
					"columnNum": 429
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2691,
					"offsetEnd": 2691,
					"columnNum": 430
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2692,
					"offsetEnd": 2692,
					"columnNum": 431
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2693,
					"offsetEnd": 2693,
					"columnNum": 432
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2694,
					"offsetEnd": 2694,
					"columnNum": 433
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2695,
					"offsetEnd": 2698,
					"columnNum": 434
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2699,
					"offsetEnd": 2700,
					"columnNum": 435
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2701,
					"offsetEnd": 2702,
					"columnNum": 436
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2703,
					"offsetEnd": 2703,
					"columnNum": 437
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2704,
					"offsetEnd": 2704,
					"columnNum": 438
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_MAY_RETEST_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2705,
					"offsetEnd": 2705,
					"columnNum": 439
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2706,
					"offsetEnd": 2710,
					"columnNum": 440
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2711,
					"offsetEnd": 2719,
					"columnNum": 441
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2720,
					"offsetEnd": 2720,
					"columnNum": 442
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2721,
					"offsetEnd": 2721,
					"columnNum": 443
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2722,
					"offsetEnd": 2722,
					"columnNum": 444
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2723,
					"offsetEnd": 2723,
					"columnNum": 445
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2724,
					"offsetEnd": 2724,
					"columnNum": 446
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2725,
					"offsetEnd": 2725,
					"columnNum": 447
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2726,
					"offsetEnd": 2729,
					"columnNum": 448
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2730,
					"offsetEnd": 2731,
					"columnNum": 449
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2732,
					"offsetEnd": 2733,
					"columnNum": 450
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STAAR Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_STAAR_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2734,
					"offsetEnd": 2734,
					"columnNum": 451
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_JUNE_RETEST_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2735,
					"offsetEnd": 2735,
					"columnNum": 452
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLANK",
				"otherPossibleNames": ["Quantile Measure"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2736,
					"offsetEnd": 2740,
					"columnNum": 453
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2741,
					"offsetEnd": 2749,
					"columnNum": 454
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2750,
					"offsetEnd": 2750,
					"columnNum": 455
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2751,
					"offsetEnd": 2751,
					"columnNum": 456
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2752,
					"offsetEnd": 2752,
					"columnNum": 457
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2753,
					"offsetEnd": 2753,
					"columnNum": 458
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2754,
					"offsetEnd": 2754,
					"columnNum": 459
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2755,
					"offsetEnd": 2758,
					"columnNum": 460
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2759,
					"offsetEnd": 2760,
					"columnNum": 461
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2761,
					"offsetEnd": 2762,
					"columnNum": 462
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2763,
					"offsetEnd": 2763,
					"columnNum": 463
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SPRING_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2764,
					"offsetEnd": 2764,
					"columnNum": 464
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2765,
					"offsetEnd": 2770,
					"columnNum": 465
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2771,
					"offsetEnd": 2779,
					"columnNum": 466
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2780,
					"offsetEnd": 2780,
					"columnNum": 467
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2781,
					"offsetEnd": 2781,
					"columnNum": 468
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2782,
					"offsetEnd": 2782,
					"columnNum": 469
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2783,
					"offsetEnd": 2783,
					"columnNum": 470
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2784,
					"offsetEnd": 2784,
					"columnNum": 471
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2785,
					"offsetEnd": 2788,
					"columnNum": 472
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2789,
					"offsetEnd": 2790,
					"columnNum": 473
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2791,
					"offsetEnd": 2792,
					"columnNum": 474
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2793,
					"offsetEnd": 2793,
					"columnNum": 475
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": ["EL Performance Measure"],
				"logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SPRING_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2794,
					"offsetEnd": 2794,
					"columnNum": 476
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2795,
					"offsetEnd": 2800,
					"columnNum": 477
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County-District-Campus Number",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2801,
					"offsetEnd": 2809,
					"columnNum": 478
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_LANGUAGE_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2810,
					"offsetEnd": 2810,
					"columnNum": 479
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Version",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_TEST_VERSION",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2811,
					"offsetEnd": 2811,
					"columnNum": 480
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Code",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2812,
					"offsetEnd": 2812,
					"columnNum": 481
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Approaches Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_APPROACHES_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2813,
					"offsetEnd": 2813,
					"columnNum": 482
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Masters Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_MASTERS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2814,
					"offsetEnd": 2814,
					"columnNum": 483
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2815,
					"offsetEnd": 2818,
					"columnNum": 484
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_TESTED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2819,
					"offsetEnd": 2820,
					"columnNum": 485
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrolled Grade",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_ENROLLED_GRADE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2821,
					"offsetEnd": 2822,
					"columnNum": 486
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2823,
					"offsetEnd": 2823,
					"columnNum": 487
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELL Progress Measure",
				"otherPossibleNames": ["EL Performance Measure"],
				"logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_ELL_PROGRESS_MEASURE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2824,
					"offsetEnd": 2824,
					"columnNum": 488
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2825,
					"offsetEnd": 2839,
					"columnNum": 489
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Meets Grade Level",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_YEAR_READING_HISTORY_SPRING_ADMINISTRATION_MEETS_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2840,
					"offsetEnd": 2840,
					"columnNum": 490
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "EL Performance Measure",
                "otherPossibleNames": [],
                "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SPRING_ADMINISTRATION_ELL_PROGRESS_MEASURE",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                  "offsetStart": 2841,
                  "offsetEnd": 2841,
                  "columnNum": 491
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
			{
				"physicalName": "BLANK",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2842,
					"offsetEnd": 2900,
					"columnNum": 492
				},
				"fieldLength": 59,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 3",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_3",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2901,
					"offsetEnd": 2905,
					"columnNum": 493
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 4",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_4",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2906,
					"offsetEnd": 2910,
					"columnNum": 494
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 5",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_5",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2911,
					"offsetEnd": 2915,
					"columnNum": 495
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 6",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_6",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2916,
					"offsetEnd": 2920,
					"columnNum": 496
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 7",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_7",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2921,
					"offsetEnd": 2925,
					"columnNum": 497
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Lexile Measure Grade 8",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_MEASURE_GRADE_8",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2926,
					"offsetEnd": 2930,
					"columnNum": 498
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2931,
					"offsetEnd": 2955,
					"columnNum": 499
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 3",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_3",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2956,
					"offsetEnd": 2960,
					"columnNum": 500
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 4",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_4",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2961,
					"offsetEnd": 2965,
					"columnNum": 501
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 5",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_5",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2966,
					"offsetEnd": 2970,
					"columnNum": 502
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 6",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_6",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2971,
					"offsetEnd": 2975,
					"columnNum": 503
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 7",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_7",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2976,
					"offsetEnd": 2980,
					"columnNum": 504
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Quantile Measure Grade 8",
				"otherPossibleNames": [],
				"logicalName": "QUANTILE_MEASURE_GRADE_8",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2981,
					"offsetEnd": 2985,
					"columnNum": 505
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
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2986,
					"offsetEnd": 3010,
					"columnNum": 506
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
       {
        "physicalName": "TX-Unique-Staff-ID – Reading",
        "otherPossibleNames": [],
        "logicalName": "TX_UNIQUE_STAF_ID_READING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3011,
          "offsetEnd": 3020,
          "columnNum": 507
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TX-Unique-Staff-ID – Mathematics",
        "otherPossibleNames": [],
        "logicalName": "TX_UNIQUE_STAF_ID_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3021,
          "offsetEnd": 3030,
          "columnNum": 508
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TX-Unique-Staff-ID – Science",
        "otherPossibleNames": [],
        "logicalName": "TX_UNIQUE_STAF_ID_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3031,
          "offsetEnd": 3040,
          "columnNum": 509
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TX-Unique-Staff-ID - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TX_UNIQUE_STAF_ID_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3041,
          "offsetEnd": 3050,
          "columnNum": 510
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TX-Unique-Staff-ID – Writing",
        "otherPossibleNames": [],
        "logicalName": "TX_UNIQUE_STAF_ID_WRITING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3051,
          "offsetEnd": 3060,
          "columnNum": 511
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames" : [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3061,
          "offsetEnd": 3074,
          "columnNum": 512
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL PERFORMANCE MEASURE (ELPM) PLAN",
        "otherPossibleNames": [],
        "logicalName": "EL_PERF_MEASURE_PLN",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3075,
          "offsetEnd": 3075,
          "columnNum": 513
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "YEAR ELPM PLAN DETERMINED",
        "otherPossibleNames": [],
        "logicalName": "ELPM_PLAN_DET",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3076,
          "offsetEnd": 3079,
          "columnNum": 514
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PLAN-YEAR TELPAS COMPOSITE RATING",
        "otherPossibleNames": [],
        "logicalName": "TELPAS_COMP_RTG_PLN_YR",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3080,
          "offsetEnd": 3080,
          "columnNum": 515
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CURRENT YEAR TELPAS YEARS IN U.S. SCHOOLS (GRADES 1-12)",
        "otherPossibleNames": [],
        "logicalName": "CURYR_TELPAS_YRS_US_SCH",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3081,
          "offsetEnd": 3081,
          "columnNum": 516
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CURRENT YEAR TELPAS PARENTAL DENIAL",
        "otherPossibleNames": [],
        "logicalName": "CURYR_TELPAS_PRNT_DEN",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3082,
          "offsetEnd": 3082,
          "columnNum": 517
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CURRENT YEAR TELPAS UNSCHOOLED ASYLEE/REFUGEE",
        "otherPossibleNames": [],
        "logicalName": "CURYR_TELPAS_UNSCH_ASYL_REFU",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3083,
          "offsetEnd": 3083,
          "columnNum": 518
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CURRENT YEAR TELPAS STUDENTS WITH INTERRUPTED FORMAL EDUCATION (SIFE)",
        "otherPossibleNames": [],
        "logicalName": "CURYR_TELPAS_SIFE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3084,
          "offsetEnd": 3084,
          "columnNum": 519
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3085,
          "offsetEnd": 3099,
          "columnNum": 520
        },
        "fieldLength": 15,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE CODE",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE_INFORMATION_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3100,
          "offsetEnd": 3100,
          "columnNum": 521
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TEST VERSION",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3101,
          "offsetEnd": 3101,
          "columnNum": 522
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": ["S"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "REPORTING CATEGORY SCORES",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_REPORTING_CATEGORY_SCORES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3102,
          "offsetEnd": 3111,
          "columnNum": 523
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3112,
          "offsetEnd": 3113,
          "columnNum": 524
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RAW SCORE",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3114,
          "offsetEnd": 3115,
          "columnNum": 525
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3116,
          "offsetEnd": 3119,
          "columnNum": 526
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "APPROACHES GRADE LEVEL",
        "otherPossibleNames": [],
        "logicalName": "APPROACHES_GRADE_LEVEL_IN_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3120,
          "offsetEnd": 3120,
          "columnNum": 527
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MEETS GRADE LEVEL",
        "otherPossibleNames": [],
        "logicalName": "MEETS_GRADE_LEVEL_IN_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3121,
          "offsetEnd": 3121,
          "columnNum": 528
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MASTERS GRADE LEVEL",
        "otherPossibleNames": [],
        "logicalName": "MASTERS_GRADE_LEVEL_IN_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3122,
          "offsetEnd": 3122,
          "columnNum": 529
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STAAR PROGRESS MEASURE",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_STAAR_PROGRESS_MEASURE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3123,
          "offsetEnd": 3123,
          "columnNum": 530
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PERCENTILE",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3124,
          "offsetEnd": 3126,
          "columnNum": 531
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "QUANTILE MEASURE",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_QUANTILE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3127,
          "offsetEnd": 3131,
          "columnNum": 532
        },
        "fieldLength": 5,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TEST INFORMATION INDICATOR",
        "otherPossibleNames": [],
        "logicalName": "ALG1_7_8GRD_TST_INFO_IND",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3132,
          "offsetEnd": 3132,
          "columnNum": 533
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3133,
          "offsetEnd": 3999,
          "columnNum": 534
        },
        "fieldLength": 867,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
	  {
				"physicalName": "PERIOD",
				"otherPossibleNames": [],
				"logicalName": "PERIOD",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4000,
					"offsetEnd": 4000,
					"columnNum": 535
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