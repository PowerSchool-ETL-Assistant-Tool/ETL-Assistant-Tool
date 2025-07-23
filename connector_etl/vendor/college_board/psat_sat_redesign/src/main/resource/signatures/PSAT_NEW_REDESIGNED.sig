{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".csv"
    ],
    "format": {
        "@type": "Delimited",
        "formatName": "PSAT_NEW_REDESIGNED",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "recordLength": "",
        "hasHeader": true,
        "naturalKey": [],
        "fields": [
            {
                "physicalName": "School",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_NAME",
                "formatMask": "null",
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
				"physicalName": "NAME_LAST",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 3
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 4
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
                "physicalName": "SEX",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_GENDER_CODE",
                "formatMask": "null",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 5
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": ["M", "F", "A", "U"],
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
					"columnNum": 6
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "BIRTH_DATE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
				{
				"physicalName": "SECONDARY_ID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
        "physicalName": "Student Id",
        "logicalName": "STATE_STUDENT_ID",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
				"physicalName": "LATEST_PSAT_DATE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
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
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 12
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 14
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 15
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 17
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 19
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
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
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			   {
                "physicalName": "State Report Id",
                "otherPossibleNames": [],
                "logicalName": "STATE_REPORT_ID",
                "formatMask": "null",
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
            }
        ]
    }
}