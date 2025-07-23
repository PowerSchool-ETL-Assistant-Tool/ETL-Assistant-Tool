{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "TELPAS_2017",
		"recordLength": "1200",
		"hasHeader": false,
		"naturalKey": [
			"ADMINISTRATION_DATE",
			"STUDENT_ID",
			"LOCAL_STUDENT_ID"
		],
		"fields": [{
				"physicalName": "Administration Date",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION_DATE",
				"formatMask": "MMyy",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 4,
					"columnNum": 1
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": ["0118","0218","0318","0418","0518","0618","0718","0818","0918","1018","1118","1218"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Level Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ESC Region Number",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "County District Campus Number",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "District Name",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Campus Name",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Last Name",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "First Name",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Middle Initial",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"offsetStart": 74,
					"offsetEnd": 82,
					"columnNum": 10
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sex Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 84,
					"offsetEnd": 91,
					"columnNum": 12
				},
				"fieldLength": 8,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 92,
					"offsetEnd": 92,
					"columnNum": 13
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Hispanic Latino Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "American Indian Alaska Native Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Asian Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Black African American Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Hawaiian Pacific Islander Code",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_PACIFIC_ISLANDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 97,
					"offsetEnd": 97,
					"columnNum": 18
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "White Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethnicity Race Reporting Category",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Economic Disadvantage Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Title I Part A Indicator Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Migrant Indicator Code",
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 103,
					"offsetEnd": 106,
					"columnNum": 24
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEP Indicator Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Bilingual Indicator Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ESL Indicator Code",
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 110,
					"offsetEnd": 110,
					"columnNum": 28
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Special Ed Indicator Code",
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 112,
					"offsetEnd": 116,
					"columnNum": 30
				},
				"fieldLength": 5,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gifted Talented Indicator Code",
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
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "At Risk Indicator Code",
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 119,
					"offsetEnd": 121,
					"columnNum": 33
				},
				"fieldLength": 3,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CAREER-AND-TECHNICAL-ED-INDICATOR-CODE",
				"otherPossibleNames": [],
				"logicalName": "CAREER_AND_TECHNICAL_ED_INDICATOR_CODE ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 122,
					"offsetEnd": 122,
					"columnNum": 34
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LOCAL USE",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 123,
					"offsetEnd": 126,
					"columnNum": 35
				},
				"fieldLength": 4,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 127,
					"offsetEnd": 130,
					"columnNum": 36
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},

			{
				"physicalName": "Unschooled Aslyee Refugee",
				"otherPossibleNames": [],
				"logicalName": "UNSCHOOLED_ASLYEE_REFUGEE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 131,
					"offsetEnd": 131,
					"columnNum": 37
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Students with Interrupted Formal Education",
				"otherPossibleNames": [],
				"logicalName": "STUDENTS_WITH_INTERRUPTED_FORMAL_EDUCATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 132,
					"offsetEnd": 132,
					"columnNum": 38
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE A",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_A",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 133,
					"offsetEnd": 133,
					"columnNum": 39
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE B",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_B",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 134,
					"offsetEnd": 134,
					"columnNum": 40
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE C",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_C",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 135,
					"offsetEnd": 135,
					"columnNum": 41
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE D",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_D",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 136,
					"offsetEnd": 136,
					"columnNum": 42
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AGENCY USE E",
				"otherPossibleNames": [],
				"logicalName": "AGENCY_USE_E",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 137,
					"offsetEnd": 137,
					"columnNum": 43
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
				"logicalName": "AGENCY USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 138,
					"offsetEnd": 140,
					"columnNum": 44
				},
				"fieldLength": 3,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Years in US Schools",
				"otherPossibleNames": [],
				"logicalName": "YEARS_IN_US_SCHOOLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 141,
					"columnNum": 45
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 142,
					"offsetEnd": 143,
					"columnNum": 46
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Parental Denial",
				"otherPossibleNames": [],
				"logicalName": "PARENTAL_DENIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 144,
					"offsetEnd": 144,
					"columnNum": 47
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Local Student ID",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 145,
					"offsetEnd": 153,
					"columnNum": 48
				},
				"fieldLength": 9,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 154,
					"offsetEnd": 154,
					"columnNum": 49
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Fall 2017 Peims County District Campus Number",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_TSDS_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 163,
					"columnNum": 50
				},
				"fieldLength": 9,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 164,
					"offsetEnd": 173,
					"columnNum": 51
				},
				"fieldLength": 10,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Fall 2017 Peims Crisis Code",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_TSDS_PEIMS_CRISIS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 174,
					"offsetEnd": 175,
					"columnNum": 52
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Fall 2017 Peims Student Attribution Code",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_TSDS_PEIMS_STUDENT_ATTRIBUTION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 176,
					"offsetEnd": 177,
					"columnNum": 53
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Fall 2017 Peims Military Connected Student Code",
				"otherPossibleNames": [],
				"logicalName": "FALL_2017_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 178,
					"offsetEnd": 178,
					"columnNum": 54
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 179,
					"offsetEnd": 184,
					"columnNum": 55
				},
				"fieldLength": 6,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Portal Unique Access Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_PORTAL_UNIQUE_ACCESS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 185,
					"offsetEnd": 190,
					"columnNum": 56
				},
				"fieldLength": 6,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Texas Student Data System Unique Student ID",
				"otherPossibleNames": ["TX- UNIQUE-STUDENT-ID"],
				"logicalName": "TEXAS_STUDENT_DATA_SYSTEM_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 200,
					"columnNum": 57
				},
				"fieldLength": 10,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rater Info A",
				"otherPossibleNames": [],
				"logicalName": "RATER_INFO_A",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 201,
					"columnNum": 58
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 202,
					"offsetEnd": 210,
					"columnNum": 59
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rater Info B",
				"otherPossibleNames": [],
				"logicalName": "RATER_INFO_B",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 211,
					"columnNum": 60
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 212,
					"offsetEnd": 220,
					"columnNum": 61
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening and Speaking Accommodations Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_AND_SPEAKING_ACCOMMODATIONS_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 221,
					"offsetEnd": 221,
					"columnNum": 62
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening and Speaking Accommodations Extra Day",
				"otherPossibleNames": ["Extra Day"],
				"logicalName": "LISTENING_AND_SPEAKING_ACCOMMODATIONS_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 222,
					"offsetEnd": 222,
					"columnNum": 63
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 223,
					"offsetEnd": 240,
					"columnNum": 64
				},
				"fieldLength": 18,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Accommodations Designated Supports",
				"otherPossibleNames": [],
				"logicalName": "READING_ACCOMMODATIONS_DESIGNATED_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 241,
					"offsetEnd": 241,
					"columnNum": 65
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Accommodations Large Print",
				"otherPossibleNames": ["Large Print"],
				"logicalName": "READING_ACCOMMODATIONS_LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 242,
					"offsetEnd": 242,
					"columnNum": 66
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Accommodations Extra Day",
				"otherPossibleNames": ["Extra Day"],
				"logicalName": "READING_ACCOMMODATIONS_EXTRA_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 243,
					"offsetEnd": 243,
					"columnNum": 67
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 244,
					"offsetEnd": 260,
					"columnNum": 68
				},
				"fieldLength": 17,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Score Code",
				"otherPossibleNames": ["SCORE CODE"],
				"logicalName": "LISTENING_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 261,
					"offsetEnd": 261,
					"columnNum": 69
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 262,
					"offsetEnd": 262,
					"columnNum": 70
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 263,
					"offsetEnd": 263,
					"columnNum": 71
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 264,
					"offsetEnd": 270,
					"columnNum": 72
				},
				"fieldLength": 7,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Score Code",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 271,
					"offsetEnd": 271,
					"columnNum": 73
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 272,
					"offsetEnd": 272,
					"columnNum": 74
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 273,
					"offsetEnd": 273,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 274,
					"offsetEnd": 280,
					"columnNum": 76
				},
				"fieldLength": 7,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Score Code",
				"otherPossibleNames": [],
				"logicalName": "READING_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 281,
					"offsetEnd": 281,
					"columnNum": 77
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 282,
					"offsetEnd": 282,
					"columnNum": 78
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "READING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 283,
					"offsetEnd": 283,
					"columnNum": 79
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 284,
					"offsetEnd": 290,
					"columnNum": 80
				},
				"fieldLength": 7,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing Score Code",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SCORE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 291,
					"offsetEnd": 291,
					"columnNum": 81
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 292,
					"offsetEnd": 292,
					"columnNum": 82
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 293,
					"offsetEnd": 293,
					"columnNum": 83
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 294,
					"offsetEnd": 300,
					"columnNum": 84
				},
				"fieldLength": 7,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 301,
					"offsetEnd": 306,
					"columnNum": 85
				},
				"fieldLength": 6,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Raw Score",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 307,
					"offsetEnd": 308,
					"columnNum": 86
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Scale Score",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 309,
					"offsetEnd": 312,
					"columnNum": 87
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Holistic Rating Test Administration",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_HOLISTIC_RATING_TEST_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 313,
					"offsetEnd": 313,
					"columnNum": 88
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 314,
					"offsetEnd": 330,
					"columnNum": 89
				},
				"fieldLength": 17,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Reporting Category Numbers By Item",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_REPORTING_CATEGORY_NUMBERS_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 331,
					"offsetEnd": 360,
					"columnNum": 90
				},
				"fieldLength": 30,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Points Possible By Item",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_POINTS_POSSIBLE_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 361,
					"offsetEnd": 390,
					"columnNum": 91
				},
				"fieldLength": 30,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Points Achieved By Item",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_POINTS_ACHIEVED_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 391,
					"offsetEnd": 420,
					"columnNum": 92
				},
				"fieldLength": 30,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 421,
					"offsetEnd": 500,
					"columnNum": 93
				},
				"fieldLength": 80,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 504,
					"columnNum": 94
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Raw Score",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 505,
					"offsetEnd": 506,
					"columnNum": 95
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 507,
					"offsetEnd": 510,
					"columnNum": 96
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Holistic Rating Test Administration",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_HOLISTIC_RATING_TEST_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 511,
					"offsetEnd": 511,
					"columnNum": 97
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 512,
					"offsetEnd": 530,
					"columnNum": 98
				},
				"fieldLength": 19,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Reporting Category Numbers By Item",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_REPORTING_CATEGORY_NUMBERS_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 531,
					"offsetEnd": 570,
					"columnNum": 99
				},
				"fieldLength": 40,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Possible Points By Item",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_POSSIBLE_POINTS_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 571,
					"offsetEnd": 610,
					"columnNum": 100
				},
				"fieldLength": 40,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Speaking Points Achieved By Item",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_POINTS_ACHIEVED_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 611,
					"offsetEnd": 650,
					"columnNum": 101
				},
				"fieldLength": 40,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 651,
					"offsetEnd": 700,
					"columnNum": 102
				},
				"fieldLength": 50,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Reporting Category Scores",
				"otherPossibleNames": [],
				"logicalName": "READING_REPORTING_CATEGORY_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 701,
					"offsetEnd": 706,
					"columnNum": 103
				},
				"fieldLength": 6,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 707,
					"offsetEnd": 708,
					"columnNum": 104
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Scale Score",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 709,
					"offsetEnd": 712,
					"columnNum": 105
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING PAPER TEST ADMINISTRATION",
				"otherPossibleNames": [],
				"logicalName": "READING_PAPER_TEST_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 713,
					"offsetEnd": 713,
					"columnNum": 106
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 714,
					"offsetEnd": 730,
					"columnNum": 107
				},
				"fieldLength": 17,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING REPORTING CATEGORY NUMBERS BY ITEM",
				"otherPossibleNames": [],
				"logicalName": "READING_REPORTING_CATEGORY_NUMBERS_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 731,
					"offsetEnd": 770,
					"columnNum": 108
				},
				"fieldLength": 40,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 771,
					"offsetEnd": 810,
					"columnNum": 109
				},
				"fieldLength": 40,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING STUDENT RESPONSE BY ITEM",
				"otherPossibleNames": [],
				"logicalName": "READING_STUDENT_RESPONSE_BY_ITEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 811,
					"offsetEnd": 850,
					"columnNum": 110
				},
				"fieldLength": 40,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 851,
					"offsetEnd": 901,
					"columnNum": 111
				},
				"fieldLength": 51,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TELPAS Comprehension Score",
				"otherPossibleNames": ["BLANK"],
				"logicalName": "TELPAS_COMPREHENSION_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 904,
					"columnNum": 112
				},
				"fieldLength": 3,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TELPAS Composite Score",
				"otherPossibleNames": ["TELPAS ALTERNATE COMPOSITE SCORE"],
				"logicalName": "TELPAS_COMPOSITE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 905,
					"offsetEnd": 907,
					"columnNum": 113
				},
				"fieldLength": 3,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TELPAS Composite Rating",
				"otherPossibleNames": ["TELPAS ALTERNATE COMPOSITE RATING"],
				"logicalName": "TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 114
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 909,
					"offsetEnd": 1000,
					"columnNum": 115
				},
				"fieldLength": 92,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2013 Administration Grade",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2013_ADMINISTRATION_GRADE_LEVEL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1001,
					"offsetEnd": 1002,
					"columnNum": 116
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2013 Administration County District Campus Number",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2013_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1003,
					"offsetEnd": 1011,
					"columnNum": 117
				},
				"fieldLength": 9,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1012,
					"offsetEnd": 1026,
					"columnNum": 118
				},
				"fieldLength": 15,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2013 ADMINISTRATION READING SCORE CODE",
				"otherPossibleNames": ["SPRING_2013_ADMINISTRATION_READING_SCORE_CODE"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1027,
					"offsetEnd": 1027,
					"columnNum": 119
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2013 ADMINISTRATION TELPAS Reading Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2013_ADMINISTRATION_READING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1028,
					"offsetEnd": 1028,
					"columnNum": 120
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2013 Administration TELPAS Reading Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2013_ADMINISTRATION_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1029,
					"offsetEnd": 1032,
					"columnNum": 121
				},
				"fieldLength": 4,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1033,
					"offsetEnd": 1034,
					"columnNum": 122
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2013 ADMINISTRATION COMPOSITE RATING",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2013_TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1035,
					"offsetEnd": 1035,
					"columnNum": 123
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2014 Administration Grade",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2014_ADMINISTRATION_GRADE_LEVEL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1036,
					"offsetEnd": 1037,
					"columnNum": 124
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2014 Administration County District Campus Number",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2014_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1038,
					"offsetEnd": 1046,
					"columnNum": 125
				},
				"fieldLength": 9,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1047,
					"offsetEnd": 1061,
					"columnNum": 126
				},
				"fieldLength": 15,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2014 ADMINISTRATION READING SCORE CODE",
				"otherPossibleNames": ["SPRING_2014_ADMINISTRATION_READING_SCORE_CODE"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1062,
					"offsetEnd": 1062,
					"columnNum": 127
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2014 ADMINISTRATION TELPAS Reading Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2014_ADMINISTRATION_READING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1063,
					"offsetEnd": 1063,
					"columnNum": 128
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2014 Administration TELPAS Reading Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2014_ADMINISTRATION_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1064,
					"offsetEnd": 1067,
					"columnNum": 129
				},
				"fieldLength": 4,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1068,
					"offsetEnd": 1069,
					"columnNum": 130
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2014 ADMINISTRATION COMPOSITE RATING",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2014_TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1070,
					"offsetEnd": 1070,
					"columnNum": 131
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2015 Administration Grade",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2015_ADMINISTRATION_GRADE_LEVEL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1071,
					"offsetEnd": 1072,
					"columnNum": 132
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2015 Administration County District Campus Number",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2015_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1073,
					"offsetEnd": 1081,
					"columnNum": 133
				},
				"fieldLength": 9,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1082,
					"offsetEnd": 1096,
					"columnNum": 134
				},
				"fieldLength": 15,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2015 ADMINISTRATION READING SCORE CODE",
				"otherPossibleNames": ["SPRING_2015_ADMINISTRATION_READING_SCORE_CODE"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1097,
					"offsetEnd": 1097,
					"columnNum": 135
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2015 ADMINISTRATION TELPAS Reading Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2015_ADMINISTRATION_READING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1098,
					"offsetEnd": 1098,
					"columnNum": 136
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2015 Administration TELPAS Reading Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2015_ADMINISTRATION_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1099,
					"offsetEnd": 1102,
					"columnNum": 137
				},
				"fieldLength": 4,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1103,
					"offsetEnd": 1104,
					"columnNum": 138
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2015 ADMINISTRATION COMPOSITE RATING",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2015_TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1105,
					"offsetEnd": 1105,
					"columnNum": 139
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2016 Administration Grade",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2016_ADMINISTRATION_GRADE_LEVEL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1106,
					"offsetEnd": 1107,
					"columnNum": 140
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2016 Administration County District Campus Number",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2016_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1108,
					"offsetEnd": 1116,
					"columnNum": 141
				},
				"fieldLength": 9,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1117,
					"offsetEnd": 1131,
					"columnNum": 142
				},
				"fieldLength": 15,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2016 ADMINISTRATION READING SCORE CODE",
				"otherPossibleNames": ["SPRING_2016_ADMINISTRATION_READING_SCORE_CODE"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1132,
					"offsetEnd": 1132,
					"columnNum": 143
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2016 ADMINISTRATION TELPAS Reading Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2016_ADMINISTRATION_READING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1133,
					"offsetEnd": 1133,
					"columnNum": 144
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2016 Administration TELPAS Reading Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2016_ADMINISTRATION_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1134,
					"offsetEnd": 1137,
					"columnNum": 145
				},
				"fieldLength": 4,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1138,
					"offsetEnd": 1139,
					"columnNum": 146
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2016 ADMINISTRATION COMPOSITE RATING",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2016_TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1140,
					"offsetEnd": 1140,
					"columnNum": 147
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2017 Administration Grade",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2017_ADMINISTRATION_GRADE_LEVEL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1141,
					"offsetEnd": 1142,
					"columnNum": 148
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2017 Administration County District Campus Number",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2017_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1143,
					"offsetEnd": 1151,
					"columnNum": 149
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2017 Administration Year in U.S Schools",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2017_ADMINISTRATION_YEAR_IN_US_SCHOOLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1152,
					"offsetEnd": 1152,
					"columnNum": 150
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1153,
					"offsetEnd": 1166,
					"columnNum": 151
				},
				"fieldLength": 14,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2017 ADMINISTRATION READING SCORE CODE",
				"otherPossibleNames": ["SPRING_2017_ADMINISTRATION_READING_SCORE_CODE"],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1167,
					"offsetEnd": 1167,
					"columnNum": 152
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2017 ADMINISTRATION TELPAS Reading Proficiency Rating",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2017_ADMINISTRATION_READING_PROFICIENCY_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1168,
					"offsetEnd": 1168,
					"columnNum": 153
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Spring 2017 Administration TELPAS Reading Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2017_ADMINISTRATION_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1169,
					"offsetEnd": 1172,
					"columnNum": 154
				},
				"fieldLength": 4,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1173,
					"offsetEnd": 1174,
					"columnNum": 155
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPRING 2017 ADMINISTRATION COMPOSITE RATING",
				"otherPossibleNames": [],
				"logicalName": "SPRING_2017_TELPAS_COMPOSITE_RATING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1175,
					"offsetEnd": 1175,
					"columnNum": 156
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1176,
					"offsetEnd": 1199,
					"columnNum": 157
				},
				"fieldLength": 24,
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1200,
					"offsetEnd": 1200,
					"columnNum": 158
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}