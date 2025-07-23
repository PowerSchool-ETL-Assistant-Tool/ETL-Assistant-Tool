{
	"encoding": "UTF-8",
	"fileExtensions": [
        ".csv"
    ],
	"format": {
		"@type": "Delimited",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"recordLength": "",
        "hasHeader": true,
		"formatName": "ACT_CSV_SHORT_14",
		"naturalKey": ["TEST_DATE", "STUDENT_FIRST_NAME", "STUDENT_MIDDLE_INITIAL", "STUDENT_LAST_NAME", "STUDENT_BIRTHDATE_STR"],
		"fields": [{
				"physicalName": "ACT ID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Last Name",
				"otherPossibleNames": ["LastName"],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "First Name",
				"otherPossibleNames": ["FirstName "],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MI",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Date",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": "MMMM yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DOB",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_BIRTHDATE_STR",
				"formatMask": "MM/DD/YYYY",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Composite Score",
				"otherPossibleNames": [],
				"logicalName": "COMPOSITE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Math Score",
				"otherPossibleNames": [],
				"logicalName": "MATH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science Score",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "English Score",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Score",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
                "physicalName": "STEM",
                "otherPossibleNames": [],
                "logicalName": "STEM_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 12
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Writing",
                "otherPossibleNames": [],
                "logicalName": "WRITING_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 13
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ELA",
                "otherPossibleNames": [],
                "logicalName": "ELA_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 14
                },
                "fieldLength": 6,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            }
		]
	}
}