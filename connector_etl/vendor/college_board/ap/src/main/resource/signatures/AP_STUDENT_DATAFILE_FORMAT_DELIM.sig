{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "AP_STUDENT_DATAFILE_FORMAT_DELIM",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["AP_NUMBER", "EDUCATION_LEVEL", "DATE_OF_THIS_REPORT", "DATE_OF_LAST_STUDENT_UPDATE"],
		"fields": [{
				"physicalName": "AP Number / AP ID",
				"otherPossibleNames": ["AP Number"],
				"logicalName": "AP_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "First Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Street Address 1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STREET_ADDRESS_1",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Street Address 2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STREET_ADDRESS_2",
				"formatMask": "",
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
				"scale": null
			},
			{
				"physicalName": "Student Street Address 3",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student State",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Zip Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ZIP_CODE",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Province",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_PROVINCE",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 32,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student International Postal Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_POSTAL_CODE",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Country Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_COUNTRY_CODE",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": ["Sex"],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "U"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Social Security Number",
				"otherPossibleNames": ["Filler","Filler2"],
				"logicalName": "SOCIAL_SECURITY_NUMBER",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School ID",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_LOCAL_ID",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Level",
				"otherPossibleNames": ["Education Level"],
				"logicalName": "EDUCATION_LEVEL",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": ["3", "4", "5", "6", "7", "8", "11"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": ["EXPECTED COLLEGE ENTRANCE", "expected college entrance","Filler3","Field18"],
				"logicalName": "FILLER",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethnic Group 2015 and Prior",
				"otherPossibleNames": ["ETHNIC GROUP", "Ethnic Group"],
				"logicalName": "ETHNIC_GROUP_2015_AND_PRIOR",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 2,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "9", "10"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Search Indicator",
				"otherPossibleNames": ["Filler","Field20"],
				"logicalName": "STUDENT_SEARCH_INDICATOR",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Best Language",
				"otherPossibleNames": [],
				"logicalName": "BEST_LANGUAGE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": ["1", "3", "4", "0"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Previous AI Year 1",
				"otherPossibleNames": [],
				"logicalName": "PREVIOUS_AI_YEAR_1",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
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
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
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
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
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
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Type 1",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_1",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Year 1",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_1",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Type 2",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_2",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Year 2",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_2",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Type 3",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_3",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Year 3",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_3",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Type 4",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_4",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Year 4",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_4",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Type 5",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_5",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Year 5",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_5",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Type 6",
				"otherPossibleNames": [],
				"logicalName": "AWARD_TYPE_6",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Award Year 6",
				"otherPossibleNames": [],
				"logicalName": "AWARD_YEAR_6",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Code",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Institution Name",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Street Address 1",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STREET_ADDRESS_1",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Street Address 2",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STREET_ADDRESS_2",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Street Address 3",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STREET_ADDRESS_3",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI State",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_STATE_CODE",
				"formatMask": "",
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
				"scale": null
			},
			{
				"physicalName": "AI Zip Code",
				"otherPossibleNames": [],
				"logicalName": "HIGH_SCHOOL_ZIP_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Province",
				"otherPossibleNames": [],
				"logicalName": "AI_PROVINCE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 32,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI International Postal Code",
				"otherPossibleNames": [],
				"logicalName": "AI_INTERNATIONAL_POSTAL_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI Country Code",
				"otherPossibleNames": [],
				"logicalName": "AI_COUNTRY_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "College Code",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Contact Name",
				"otherPossibleNames": [],
				"logicalName": "CONTACT_NAME",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Institution Name",
				"otherPossibleNames": [],
				"logicalName": "DI_INSTITUTION_NAME",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Street Address 1",
				"otherPossibleNames": [],
				"logicalName": "DI_STREET_ADDRESS_1",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Street Address 2",
				"otherPossibleNames": [],
				"logicalName": "DI_STREET_ADDRESS_2",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Street Address 3",
				"otherPossibleNames": [],
				"logicalName": "DI_STREET_ADDRESS_3",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI State",
				"otherPossibleNames": [],
				"logicalName": "DI_STATE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Zip Code",
				"otherPossibleNames": [],
				"logicalName": "DI_ZIP_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Province",
				"otherPossibleNames": [],
				"logicalName": "DI_PROVINCE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 32,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI International Postal Code",
				"otherPossibleNames": [],
				"logicalName": "DI_INTERNATIONAL_POSTAL_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DI Country Code",
				"otherPossibleNames": [],
				"logicalName": "DI_COUNTRY_CODE",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 01",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_01",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
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
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 01",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_01",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 01",
				"otherPossibleNames": ["Irregularity Code .1 01"],
				"logicalName": "IRREGULARITY_CODE_#1_01",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 01",
				"otherPossibleNames": ["Irregularity Code .2 01"],
				"logicalName": "IRREGULARITY_CODE_#2_01",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 01",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_01",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 02",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_02",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 02",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_02",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 02",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_02",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 02",
				"otherPossibleNames": ["Irregularity Code .1 02"],
				"logicalName": "IRREGULARITY_CODE_#1_02",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 02",
				"otherPossibleNames": ["Irregularity Code .2 02"],
				"logicalName": "IRREGULARITY_CODE_#2_02",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 02",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_02",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 03",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_03",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 03",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_03",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 03",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_03",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 03",
				"otherPossibleNames": ["Irregularity Code .1 03"],
				"logicalName": "IRREGULARITY_CODE_#1_03",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 03",
				"otherPossibleNames": ["Irregularity Code .2 03"],
				"logicalName": "IRREGULARITY_CODE_#2_03",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 03",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_03",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 04",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_04",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 04",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_04",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 04",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_04",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 04",
				"otherPossibleNames": ["Irregularity Code .1 04"],
				"logicalName": "IRREGULARITY_CODE_#1_04",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 04",
				"otherPossibleNames": ["Irregularity Code .2 04"],
				"logicalName": "IRREGULARITY_CODE_#2_04",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 04",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_04",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 05",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_05",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 05",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_05",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 05",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_05",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 05",
				"otherPossibleNames": ["Irregularity Code .1 05"],
				"logicalName": "IRREGULARITY_CODE_#1_05",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 05",
				"otherPossibleNames": ["Irregularity Code .2 05"],
				"logicalName": "IRREGULARITY_CODE_#2_05",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 05",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_05",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 06",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_06",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 06",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_06",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 06",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_06",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 06",
				"otherPossibleNames": ["Irregularity Code .1 06"],
				"logicalName": "IRREGULARITY_CODE_#1_06",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 06",
				"otherPossibleNames": ["Irregularity Code .2 06"],
				"logicalName": "IRREGULARITY_CODE_#2_06",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "07", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 06",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_06",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 07",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_07",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 07",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_07",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 07",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_07",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 07",
				"otherPossibleNames": ["Irregularity Code .1 07"],
				"logicalName": "IRREGULARITY_CODE_#1_07",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 07",
				"otherPossibleNames": ["Irregularity Code .2 07"],
				"logicalName": "IRREGULARITY_CODE_#2_07",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 07",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_07",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 08",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_08",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1010
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 08",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_08",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 08",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_08",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 08",
				"otherPossibleNames": ["Irregularity Code .1 08"],
				"logicalName": "IRREGULARITY_CODE_#1_08",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 08",
				"otherPossibleNames": ["Irregularity Code .2 08"],
				"logicalName": "IRREGULARITY_CODE_#2_08",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 08",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_08",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 09",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_09",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 09",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_09",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 09",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_09",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 09",
				"otherPossibleNames": ["Irregularity Code .1 09"],
				"logicalName": "IRREGULARITY_CODE_#1_09",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 09",
				"otherPossibleNames": ["Irregularity Code .2 09"],
				"logicalName": "IRREGULARITY_CODE_#2_09",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 09",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_09",
				"formatMask": "",
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
				"scale": null
			},
			{
				"physicalName": "Admin Year 10",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_10",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 10",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_10",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 10",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_10",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 10",
				"otherPossibleNames": ["Irregularity Code .1 10"],
				"logicalName": "IRREGULARITY_CODE_#1_10",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 10",
				"otherPossibleNames": ["Irregularity Code .2 10"],
				"logicalName": "IRREGULARITY_CODE_#2_10",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 10",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_10",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 11",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_11",
				"formatMask": "",
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
				"scale": null
			},
			{
				"physicalName": "Exam Code 11",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_11",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 11",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_11",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 11",
				"otherPossibleNames": ["Irregularity Code .1 11"],
				"logicalName": "IRREGULARITY_CODE_#1_11",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 11",
				"otherPossibleNames": ["Irregularity Code .2 11"],
				"logicalName": "IRREGULARITY_CODE_#2_11",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 11",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_11",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 12",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_12",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 12",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_12",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 12",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_12",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 12",
				"otherPossibleNames": ["Irregularity Code .1 12"],
				"logicalName": "IRREGULARITY_CODE_#1_12",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 12",
				"otherPossibleNames": ["Irregularity Code .2 12"],
				"logicalName": "IRREGULARITY_CODE_#2_12",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 12",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_12",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 13",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_13",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 13",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_13",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 13",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_13",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 13",
				"otherPossibleNames": ["Irregularity Code .1 13"],
				"logicalName": "IRREGULARITY_CODE_#1_13",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 13",
				"otherPossibleNames": ["Irregularity Code .2 13"],
				"logicalName": "IRREGULARITY_CODE_#2_13",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 13",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_13",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 14",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_14",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 14",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_14",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 14",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_14",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 14",
				"otherPossibleNames": ["Irregularity Code .1 14"],
				"logicalName": "IRREGULARITY_CODE_#1_14",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 14",
				"otherPossibleNames": ["Irregularity Code .2 14"],
				"logicalName": "IRREGULARITY_CODE_#2_14",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 14",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_14",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 15",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_15",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 15",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_15",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 15",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_15",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 15",
				"otherPossibleNames": ["Irregularity Code .1 15"],
				"logicalName": "IRREGULARITY_CODE_#1_15",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 15",
				"otherPossibleNames": ["Irregularity Code .2 15"],
				"logicalName": "IRREGULARITY_CODE_#2_15",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 15",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_15",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 16",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_16",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 16",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_16",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 16",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_16",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 16",
				"otherPossibleNames": ["Irregularity Code .1 16"],
				"logicalName": "IRREGULARITY_CODE_#1_16",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 16",
				"otherPossibleNames": ["Irregularity Code .2 16"],
				"logicalName": "IRREGULARITY_CODE_#2_16",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 16",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_16",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 17",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_17",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 17",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_17",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 17",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_17",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 17",
				"otherPossibleNames": ["Irregularity Code .1 17"],
				"logicalName": "IRREGULARITY_CODE_#1_17",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 17",
				"otherPossibleNames": ["Irregularity Code .2 17"],
				"logicalName": "IRREGULARITY_CODE_#2_17",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 17",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_17",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 18",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_18",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 18",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_18",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 162
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 18",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_18",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 163
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 18",
				"otherPossibleNames": ["Irregularity Code .1 18"],
				"logicalName": "IRREGULARITY_CODE_#1_18",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 164
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 18",
				"otherPossibleNames": ["Irregularity Code .2 18"],
				"logicalName": "IRREGULARITY_CODE_#2_18",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 165
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 18",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_18",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 166
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 19",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_19",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 167
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 19",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_19",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 168
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 19",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_19",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 19",
				"otherPossibleNames": ["Irregularity Code .1 19"],
				"logicalName": "IRREGULARITY_CODE_#1_19",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 170
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 19",
				"otherPossibleNames": ["Irregularity Code .2 19"],
				"logicalName": "IRREGULARITY_CODE_#2_19",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 171
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 19",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_19",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 20",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_20",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 173
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 20",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_20",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 174
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 20",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_20",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 20",
				"otherPossibleNames": ["Irregularity Code .1 20"],
				"logicalName": "IRREGULARITY_CODE_#1_20",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 176
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 20",
				"otherPossibleNames": ["Irregularity Code .2 20"],
				"logicalName": "IRREGULARITY_CODE_#2_20",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 177
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 20",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_20",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 21",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_21",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 179
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 21",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_21",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 180
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 21",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_21",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 21",
				"otherPossibleNames": ["Irregularity Code .1 21"],
				"logicalName": "IRREGULARITY_CODE_#1_21",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 182
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 21",
				"otherPossibleNames": ["Irregularity Code .2 21"],
				"logicalName": "IRREGULARITY_CODE_#2_21",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 183
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 21",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_21",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 184
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 22",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_22",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 185
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 22",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_22",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 186
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 22",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_22",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 187
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 22",
				"otherPossibleNames": ["Irregularity Code .1 22"],
				"logicalName": "IRREGULARITY_CODE_#1_22",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 188
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 22",
				"otherPossibleNames": ["Irregularity Code .2 22"],
				"logicalName": "IRREGULARITY_CODE_#2_22",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 189
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 22",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_22",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 190
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 23",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_23",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 191
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 23",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_23",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 192
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 23",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_23",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 193
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 23",
				"otherPossibleNames": ["Irregularity Code .1 23"],
				"logicalName": "IRREGULARITY_CODE_#1_23",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 194
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 23",
				"otherPossibleNames": ["Irregularity Code .2 23"],
				"logicalName": "IRREGULARITY_CODE_#2_23",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 195
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 23",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_23",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 196
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 24",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_24",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 197
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 24",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_24",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 198
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 24",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_24",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 24",
				"otherPossibleNames": ["Irregularity Code .1 24"],
				"logicalName": "IRREGULARITY_CODE_#1_24",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 200
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 24",
				"otherPossibleNames": ["Irregularity Code .2 24"],
				"logicalName": "IRREGULARITY_CODE_#2_24",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 201
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 24",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_24",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 25",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_25",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 203
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 25",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_25",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 204
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 25",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_25",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 25",
				"otherPossibleNames": ["Irregularity Code .1 25"],
				"logicalName": "IRREGULARITY_CODE_#1_25",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 206
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 25",
				"otherPossibleNames": ["Irregularity Code .2 25"],
				"logicalName": "IRREGULARITY_CODE_#2_25",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 207
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 25",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_25",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 208
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 26",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_26",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 209
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 26",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_26",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 210
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 26",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_26",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 211
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 26",
				"otherPossibleNames": ["Irregularity Code .1 26"],
				"logicalName": "IRREGULARITY_CODE_#1_26",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 212
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 26",
				"otherPossibleNames": ["Irregularity Code .2 26"],
				"logicalName": "IRREGULARITY_CODE_#2_26",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 213
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "07", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 26",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_26",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 214
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 27",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_27",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 215
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 27",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_27",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 216
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 27",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_27",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 217
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 27",
				"otherPossibleNames": ["Irregularity Code .1 27"],
				"logicalName": "IRREGULARITY_CODE_#1_27",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 218
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 27",
				"otherPossibleNames": ["Irregularity Code .2 27"],
				"logicalName": "IRREGULARITY_CODE_#2_27",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 219
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 27",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_27",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 220
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 28",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_28",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 221
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 28",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_28",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 222
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 28",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_28",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 28",
				"otherPossibleNames": ["Irregularity Code .1 28"],
				"logicalName": "IRREGULARITY_CODE_#1_28",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 224
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 28",
				"otherPossibleNames": ["Irregularity Code .2 28"],
				"logicalName": "IRREGULARITY_CODE_#2_28",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 225
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 28",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_28",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 226
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 29",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_29",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 227
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 29",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_29",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 228
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 29",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_29",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 229
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 29",
				"otherPossibleNames": ["Irregularity Code .1 29"],
				"logicalName": "IRREGULARITY_CODE_#1_29",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 230
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 29",
				"otherPossibleNames": ["Irregularity Code .2 29"],
				"logicalName": "IRREGULARITY_CODE_#2_29",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 231
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 29",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_29",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 232
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin Year 30",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_YEAR_30",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 233
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Code 30",
				"otherPossibleNames": [],
				"logicalName": "EXAM_CODE_30",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 234
				},
				"fieldLength": 2,
				"expectedValues": ["7", "13", "14", "15", "16", "20", "22", "23", "25", "28", "31", "33", "34", "35", "36", "37", "40", "43", "48", "51", "53", "55", "57", "58", "60", "61", "62", "64", "66", "68", "69", "75", "76", "77", "78", "80", "82", "83", "84", "85", "87", "89", "90", "93"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exam Grade 30",
				"otherPossibleNames": [],
				"logicalName": "EXAM_GRADE_30",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 235
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #1 30",
				"otherPossibleNames": ["Irregularity Code .1 30"],
				"logicalName": "IRREGULARITY_CODE_#1_30",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 236
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Irregularity Code #2 30",
				"otherPossibleNames": ["Irregularity Code .2 30"],
				"logicalName": "IRREGULARITY_CODE_#2_30",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 237
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "16", "17", "18", "19", "20", "22", "24", "27", "29", "30", "34", "37", "38", "39", "40", "41", "42", "43", "44", "49", "51", "56", "57", "58", "60", "61", "63", "66", "67", "68", "70", "74", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Class Section Code 30",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_CODE_30",
				"formatMask": "",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 238
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date Grades Released to College",
				"otherPossibleNames": [],
				"logicalName": "DATE_GRADES_RELEASED_TO_COLLEGE",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 239
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Date of Last Student Update",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_LAST_STUDENT_UPDATE",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 240
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Date of this report",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_THIS_REPORT",
				"formatMask": "MMddyy",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 241
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Student Identifier",
				"otherPossibleNames": ["StudentLocalID"],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 242
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Race Ethnicity Student Response 2016 and Forward",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETHNICITY_STUDENT_RESPONSE_2016_AND_FORWARD",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 243
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Derived Aggregate Race Ethnicity 2016 and Forward",
				"otherPossibleNames": [],
				"logicalName": "DERIVED_AGGREGATE_RACE_ETHNICITY_2016_AND_FORWARD",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 244
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "NAME_LAST",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 245
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student First Name",
				"otherPossibleNames": [],
				"logicalName": "NAME_FIRST",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 246
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Level Grade",
				"otherPossibleNames": [],
				"logicalName": "LEVEL_GRADE",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 247
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student ID",
				"otherPossibleNames": [""],
				"logicalName": "ID_STUDENT",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 248
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
            },
            {
				"physicalName": "Student Texas Unique ID",
				"otherPossibleNames": [""],
				"logicalName": "STUDENT_TEXAS",
				"formatMask": "",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 249
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv"]
}