{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "MCA_ON_DEMAND_UPPER",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["ADMINISTRATION", "MARSS_SSID_NUMBER", "LOCAL_USE_ID", "TEST_DATE", "SUBJECT"],
		"fields": [{
				"physicalName": "ADMINISTRATION",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DIST_CODE",
				"otherPossibleNames": [],
				"logicalName": "DIST_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DISTRICT",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SCH_CODE",
				"otherPossibleNames": [],
				"logicalName": "SCH_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SCHOOL",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TEST_NAME",
				"otherPossibleNames": [],
				"logicalName": "TEST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 200,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TEST_DATE",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": "yyyyMMdd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJECT",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 30,
				"expectedValues": ["READ", "MATH", "SCIENCE"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "GRADE",
				"otherPossibleNames": [],
				"logicalName": "GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MARSS_SSID_NUMBER",
				"otherPossibleNames": [],
				"logicalName": "MARSS_SSID_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LOCAL_USE_ID",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_USE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LAST_NAME",
				"otherPossibleNames": [],
				"logicalName": "LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FIRST_NAME",
				"otherPossibleNames": [],
				"logicalName": "FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DATE_OF_BIRTH",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "yyyyMMdd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SCALE_SCORE",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACHIEVEMENT_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Does Not Meet", "Partially Meets", "Meets", "Exceeds"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LEARNING_LOCATOR",
				"otherPossibleNames": ["FILLER"],
				"logicalName": "LEARNING_LOCATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LEXILE_QUANTILE",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_QUANTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS1",
				"otherPossibleNames": [],
				"logicalName": "RS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS1_PL",
				"otherPossibleNames": [],
				"logicalName": "RS1_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS2",
				"otherPossibleNames": [],
				"logicalName": "RS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS2_PL",
				"otherPossibleNames": [],
				"logicalName": "RS2_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS3",
				"otherPossibleNames": [],
				"logicalName": "RS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS3_PL",
				"otherPossibleNames": [],
				"logicalName": "RS3_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS4",
				"otherPossibleNames": [],
				"logicalName": "RS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RS4_PL",
				"otherPossibleNames": [],
				"logicalName": "RS4_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC5",
				"otherPossibleNames": [],
				"logicalName": "SC5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC5_PL",
				"otherPossibleNames": [],
				"logicalName": "SC5_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC6",
				"otherPossibleNames": [],
				"logicalName": "SC6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC6_PL",
				"otherPossibleNames": [],
				"logicalName": "SC6_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC7",
				"otherPossibleNames": [],
				"logicalName": "SC7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC7_PL",
				"otherPossibleNames": [],
				"logicalName": "SC7_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC8",
				"otherPossibleNames": [],
				"logicalName": "SC8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC8_PL",
				"otherPossibleNames": [],
				"logicalName": "SC8_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC9",
				"otherPossibleNames": [],
				"logicalName": "SC9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 2,
				"expectedValues": ["", "NA", "NC", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SC9_PL",
				"otherPossibleNames": [],
				"logicalName": "SC9_PL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 50,
				"expectedValues": ["", "NA", "NC", "Below Expectations", "At or Near Expectations", "Above Expectations"],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": [".csv"]
}