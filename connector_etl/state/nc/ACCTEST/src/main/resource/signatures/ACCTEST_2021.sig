{
	"encoding": "UTF-8",
    	"format": {
        "@type": "Delimited",
        "quoteDelim": "\"",
        "fieldDelim": "\t",
        "hasHeader": false,
        "formatName": "ACCTEST_2021",
		"naturalKey": ["STUDENT_FIRST_NAME", "STUDENT_LAST_NAME", "TEST_CODE",
		"EXEMPTION_CODE", "SCHOOL_NUMBER", "STUDENT_ID", "TEST_DATE"],
		"fields": [{
				"physicalName": "reporting_year",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_YEAR",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "collection_code",
				"otherPossibleNames": [],
				"logicalName": "COLLECTION_CODE",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "school_code",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "student_id",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "test_date",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": "yyyyMMdd",
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "test_id",
				"otherPossibleNames": [],
				"logicalName": "TEST_CODE",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "test_school",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NUMBER",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "exemption_code",
				"otherPossibleNames": [],
				"logicalName": "EXEMPTION_CODE",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "score",
				"otherPossibleNames": [],
				"logicalName": "SCORE",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "achievement_level",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "percentile",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "grade",
				"otherPossibleNames": [],
				"logicalName": "GRADE",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "accom_list",
				"otherPossibleNames": [],
				"logicalName": "ACCOM_LIST",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 55,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "last_name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "first_name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "y",
				"canBeNull": "y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [
		"txt"
	]
}