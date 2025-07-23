{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "MCA_ON_DEMAND",
		"quoteDelim": "\"",
		"fieldDelim": "\t",
		"hasHeader": true,
		"naturalKey": ["ADMINISTRATION", "MARSS_SSID_NUMBER", "LOCAL_USE_ID", "TEST_DATE", "SUBJECT"],
		"fields": [{
				"physicalName": "Admin",
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
				"physicalName": "District Code",
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
				"physicalName": "District Name",
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
				"physicalName": "School Code",
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
				"physicalName": "School Name",
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
				"physicalName": "Test Name",
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
				"physicalName": "Test Date",
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
				"physicalName": "Subject",
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
				"physicalName": "Grade",
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
				"physicalName": "MARSS ID",
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
				"physicalName": "Local Use ID",
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
				"physicalName": "Last Name",
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
				"physicalName": "First Name",
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
				"physicalName": "Date of Birth",
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
				"physicalName": "Scale Score",
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
				"physicalName": "Achievement Level",
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
				"physicalName": "Learning Locator",
				"otherPossibleNames": [],
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
				"physicalName": "Lexile/Quantile",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_QUANTILE",
				"formatMask": null,
				"isFieldRequired": "N",
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
				"physicalName": "Reporting Strand 1 Scale Score",
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
				"physicalName": "Reporting Strand 1 Performance Level",
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
				"physicalName": "Reporting Strand 2 Scale Score",
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
				"physicalName": "Reporting Strand 2 Performance Level",
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
				"physicalName": "Reporting Strand 3 Scale Score",
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
				"physicalName": "Reporting Strand 3 Performance Level",
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
				"physicalName": "Reporting Strand 4 Scale Score",
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
				"physicalName": "Reporting Strand 4 Performance Level",
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
				"physicalName": "Science Strand 5 Scale Score",
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
				"physicalName": "Science Strand 5 Performance Level",
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
				"physicalName": "Science Strand 6 Scale Score",
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
				"physicalName": "Science Strand 6 Performance Level",
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
				"physicalName": "Science Strand 7 Scale Score",
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
				"physicalName": "Science Strand 7 Performance Level",
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
				"physicalName": "Science Strand 8 Scale Score",
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
				"physicalName": "Science Strand 8 Performance Level",
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
				"physicalName": "Science Strand 9 Scale Score",
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
				"physicalName": "Science Strand 9 Performance Level",
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
	"fileExtensions": [".tab"]
}