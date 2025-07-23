{
	"encoding": "UTF-8",
	"fileExtensions": [
		".csv"
	],
	"format": {
		"@type": "Delimited",
		"formatName": "PSAT89_REDESIGN_DELIMITED",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"recordLength": "",
		"hasHeader": true,
		"naturalKey": ["STUDENT_VENDOR_ID"],
		"fields": [{
				"physicalName": "AI_CODE",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AI_NAME",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OPTIONAL_CODE",
				"otherPossibleNames": ["FILLER_75"],
				"logicalName": "OPTIONAL_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "COHORT_YEAR",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DISTRICT_NAME",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NAME_LAST",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NAME_FIRST",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NAME_MI",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SEX",
				"otherPossibleNames": ["GENDER"],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["M", "F", "A", "U"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_CUBAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_CUBAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_MEXICAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_MEXICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_PUERTORICAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_PUERTORICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_HISP_LAT",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_HISP_LAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_NON_HISP_LAT",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_NON_HISP_LAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_INDIAN_ALASKAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_INDIAN_ALASKAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_ASIAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_AFRICANAMERICAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_AFRICANAMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_HAWAIIAN_PI",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_HAWAIIAN_PI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_WHITE",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RACE_ETH_OTHER",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_1",
				"otherPossibleNames": [],
				"logicalName": "FILLER_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DERIVED_AGGREGATE_RACE_ETH",
				"otherPossibleNames": [],
				"logicalName": "DERIVED_AGGREGATE_RACE_ETH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BIRTH_DATE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_2",
				"otherPossibleNames": [],
				"logicalName": "FILLER_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CB_ID",
				"otherPossibleNames": [],
				"logicalName": "CB_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SECONDARY_ID",
				"otherPossibleNames": ["State_StudentNumber","Student_Number"],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_LINE1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_LINE2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_CITY",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_STATE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_ZIP",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_ZIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_3",
				"otherPossibleNames": [],
				"logicalName": "FILLER_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_COUNTRY",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_COUNTRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADDRESS_PROVINCE",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_PROVINCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FOREIGN_ADDRESS",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_ADDRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DISTRICT_STUDENT_ID",
				"otherPossibleNames": ["FILLER_36"],
				"logicalName": "DISTRICT_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STATE_STUDENT_ID",
				"otherPossibleNames": ["FILLER_37"],
				"logicalName": "STATE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_4",
				"otherPossibleNames": [],
				"logicalName": "FILLER_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_5",
				"otherPossibleNames": [],
				"logicalName": "FILLER_5",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HOMESCHOOL",
				"otherPossibleNames": [],
				"logicalName": "HOMESCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_6",
				"otherPossibleNames": [],
				"logicalName": "FILLER_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_7",
				"otherPossibleNames": [],
				"logicalName": "FILLER_7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SAA",
				"otherPossibleNames": ["GPO"],
				"logicalName": "SAA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_ACCESS_CD",
				"otherPossibleNames": ["LATEST_REG_NUMBER"],
				"logicalName": "LATEST_ACCESS_CD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_8",
				"otherPossibleNames": [],
				"logicalName": "FILLER_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_DATE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_GRADE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_READING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LATEST_PSAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_9",
				"otherPossibleNames": [],
				"logicalName": "FILLER_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FORM_CODE",
				"otherPossibleNames": [],
				"logicalName": "FORM_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_STATE_TOTAL",
				"otherPossibleNames": ["FILLER_10"],
				"logicalName": "PERCENTILE_STATE_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_STATE_RW",
				"otherPossibleNames": ["FILLER_11"],
				"logicalName": "PERCENTILE_STATE_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_STATE_MATH",
				"otherPossibleNames": ["FILLER_12"],
				"logicalName": "PERCENTILE_STATE_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_COUNTRY_TOTAL",
				"otherPossibleNames": ["FILLER_13"],
				"logicalName": "PERCENTILE_COUNTRY_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_COUNTRY_RW",
				"otherPossibleNames": ["FILLER_14"],
				"logicalName": "PERCENTILE_COUNTRY_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_COUNTRY_MATH",
				"otherPossibleNames": ["FILLER_15"],
				"logicalName": "PERCENTILE_COUNTRY_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_16",
				"otherPossibleNames": [],
				"logicalName": "FILLER_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_17",
				"otherPossibleNames": [],
				"logicalName": "FILLER_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_18",
				"otherPossibleNames": [],
				"logicalName": "FILLER_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_19",
				"otherPossibleNames": [],
				"logicalName": "FILLER_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_20",
				"otherPossibleNames": [],
				"logicalName": "FILLER_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_21",
				"otherPossibleNames": [],
				"logicalName": "FILLER_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_22",
				"otherPossibleNames": [],
				"logicalName": "FILLER_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EBRW_CCR_BENCHMARK",
				"otherPossibleNames": [],
				"logicalName": "EBRW_CCR_BENCHMARK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CCR_BENCHMARK",
				"otherPossibleNames": [],
				"logicalName": "MATH_CCR_BENCHMARK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_23",
				"otherPossibleNames": [],
				"logicalName": "FILLER_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_24",
				"otherPossibleNames": [],
				"logicalName": "FILLER_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_25",
				"otherPossibleNames": [],
				"logicalName": "FILLER_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_26",
				"otherPossibleNames": [],
				"logicalName": "FILLER_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_27",
				"otherPossibleNames": [],
				"logicalName": "FILLER_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_28",
				"otherPossibleNames": [],
				"logicalName": "FILLER_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NUM_READING_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_READING_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS16",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS17",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS18",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS19",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS20",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS21",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS22",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS23",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS24",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS25",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS26",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS27",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS28",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS29",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS30",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS31",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS32",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS33",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS34",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS35",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS36",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS37",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS38",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS39",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS40",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS41",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS41",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_ANS42",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS42",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "READING_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_29",
				"otherPossibleNames": [],
				"logicalName": "FILLER_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NUM_WRITLANG_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_WRITLANG_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 162
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 163
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 164
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 165
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 166
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 167
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 168
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 169
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 170
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 171
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 172
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 173
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 174
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 175
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS16",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 176
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS17",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 177
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS18",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 178
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS19",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 179
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS20",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 180
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS21",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 181
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS22",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 182
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS23",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 183
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS24",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 184
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS25",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 185
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS26",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 186
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS27",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 187
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS28",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 188
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS29",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 189
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS30",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 190
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS31",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 191
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS32",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 192
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS33",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 193
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS34",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 194
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS35",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 195
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS36",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 196
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS37",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 197
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS38",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 198
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS39",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 199
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_ANS40",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 200
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 201
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 202
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WRITLANG_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 203
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_30",
				"otherPossibleNames": [],
				"logicalName": "FILLER_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 204
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NUM_MATH_NCMC_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_NCMC_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 205
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NUM_MATH_NCPR_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_NCPR_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 206
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 207
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 208
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 209
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 210
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 211
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 212
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 213
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 214
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 215
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 216
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 217
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 218
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 219
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NC_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_NC_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 220
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NC_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_NC_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 221
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_NC_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "MATH_NC_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 222
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_31",
				"otherPossibleNames": [],
				"logicalName": "FILLER_31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 223
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NUM_MATH_CMC_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_CMC_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 224
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NUM_MATH_CPR_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_CPR_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 225
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 226
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 227
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 228
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 229
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 230
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 231
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 232
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 233
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 234
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 235
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 236
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 237
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 238
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 239
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 240
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS16",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 241
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS17",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 242
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS18",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 243
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS19",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 244
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS20",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 245
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS21",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 246
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 247
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 248
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 249
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 250
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_C_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_C_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 251
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_C_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_C_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 252
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MATH_C_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "MATH_C_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 253
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_32",
				"otherPossibleNames": [],
				"logicalName": "FILLER_32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 254
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AP_EURHIST",
				"otherPossibleNames": [],
				"logicalName": "AP_EURHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 255
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AP_WRLDHIST",
				"otherPossibleNames": [],
				"logicalName": "AP_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 256
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AP_ARTHIS",
				"otherPossibleNames": ["FILLER_33"],
				"logicalName": "AP_ARTHIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 257
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AP_COMPSCIPRIN",
				"otherPossibleNames": ["FILLER_34"],
				"logicalName": "AP_COMPSCIPRIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 258
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AP_HUMGEO",
				"otherPossibleNames": ["FILLER_35"],
				"logicalName": "AP_HUMGEO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 259
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AP_SEMINAR",
				"otherPossibleNames": ["FILLER_36"],
				"logicalName": "AP_SEMINAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 260
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_37",
				"otherPossibleNames": [],
				"logicalName": "FILLER_37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 261
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_38",
				"otherPossibleNames": [],
				"logicalName": "FILLER_38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 262
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_39",
				"otherPossibleNames": [],
				"logicalName": "FILLER_39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 263
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_40",
				"otherPossibleNames": [],
				"logicalName": "FILLER_40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 264
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_41",
				"otherPossibleNames": [],
				"logicalName": "FILLER_41",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 265
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_42",
				"otherPossibleNames": [],
				"logicalName": "FILLER_42",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 266
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_43",
				"otherPossibleNames": [],
				"logicalName": "FILLER_43",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 267
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_44",
				"otherPossibleNames": [],
				"logicalName": "FILLER_44",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 268
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_45",
				"otherPossibleNames": [],
				"logicalName": "FILLER_45",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 269
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_46",
				"otherPossibleNames": [],
				"logicalName": "FILLER_46",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 270
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_47",
				"otherPossibleNames": [],
				"logicalName": "FILLER_47",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 271
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_48",
				"otherPossibleNames": [],
				"logicalName": "FILLER_48",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 272
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_49",
				"otherPossibleNames": [],
				"logicalName": "FILLER_49",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 273
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_50",
				"otherPossibleNames": [],
				"logicalName": "FILLER_50",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 274
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_51",
				"otherPossibleNames": [],
				"logicalName": "FILLER_51",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 275
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_52",
				"otherPossibleNames": [],
				"logicalName": "FILLER_52",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 276
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_53",
				"otherPossibleNames": [],
				"logicalName": "FILLER_53",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 277
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SDQ_DATE",
				"otherPossibleNames": [],
				"logicalName": "SELF_ASSMT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 278
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "SDQ_GPA",
				"otherPossibleNames": [],
				"logicalName": "GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 279
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_54",
				"otherPossibleNames": [],
				"logicalName": "FILLER_54",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 280
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER_55",
				"otherPossibleNames": [],
				"logicalName": "FILLER_55",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 281
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_PREALGEBRA",
				"otherPossibleNames": ["FILLER_57"],
				"logicalName": "STUDY_DURATION_PREALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 282
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_ALGEBRA",
				"otherPossibleNames": ["FILLER_58"],
				"logicalName": "STUDY_DURATION_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 283
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_ALGEBRAII",
				"otherPossibleNames": ["FILLER_59"],
				"logicalName": "STUDY_DURATION_ALGEBRAII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 284
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_GEOMETRY",
				"otherPossibleNames": ["FILLER_60"],
				"logicalName": "STUDY_DURATION_GEOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 285
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_INT_MATH",
				"otherPossibleNames": ["FILLER_61"],
				"logicalName": "STUDY_DURATION_INT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 286
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_OTH_MATH",
				"otherPossibleNames": ["FILLER_62"],
				"logicalName": "STUDY_DURATION_OTH_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 287
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_LIT",
				"otherPossibleNames": ["FILLER_63"],
				"logicalName": "STUDY_DURATION_LIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 288
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_ENGLANGARTS",
				"otherPossibleNames": ["FILLER_64"],
				"logicalName": "STUDY_DURATION_ENGLANGARTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 289
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_ENG_SECLANG",
				"otherPossibleNames": ["FILLER_65"],
				"logicalName": "STUDY_DURATION_ENG_SECLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 290
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_OTH_ENG",
				"otherPossibleNames": ["FILLER_66"],
				"logicalName": "STUDY_DURATION_OTH_ENG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 291
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_BIOLOGY",
				"otherPossibleNames": ["FILLER_67"],
				"logicalName": "STUDY_DURATION_BIOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 292
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_CHEMISTRY",
				"otherPossibleNames": ["FILLER_68"],
				"logicalName": "STUDY_DURATION_CHEMISTRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 293
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_EARTHSCI",
				"otherPossibleNames": ["FILLER_69"],
				"logicalName": "STUDY_DURATION_EARTHSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 294
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_PHYSICS",
				"otherPossibleNames": ["FILLER_70"],
				"logicalName": "STUDY_DURATION_PHYSICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 295
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_OTHSCI",
				"otherPossibleNames": ["FILLER_71"],
				"logicalName": "STUDY_DURATION_OTHSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 296
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_USHIST",
				"otherPossibleNames": ["FILLER_72"],
				"logicalName": "STUDY_DURATION_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 297
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_WORLDHIS",
				"otherPossibleNames": ["FILLER_73"],
				"logicalName": "STUDY_DURATION_WORLDHIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 298
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDY_DURATION_OTHSOCSTD",
				"otherPossibleNames": ["FILLER_74"],
				"logicalName": "STUDY_DURATION_OTHSOCSTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 299
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "REPORT_DATE",
				"otherPossibleNames": [],
				"logicalName": "REPORT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 300
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "FILLER_56",
				"otherPossibleNames": [],
				"logicalName": "FILLER_56",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 301
				},
				"fieldLength": 500,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	}
}