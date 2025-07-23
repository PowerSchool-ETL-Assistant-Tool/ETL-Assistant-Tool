{
    "encoding": "UTF-8",
    "format": {
        "@type": "Fixed Length",
        "formatName": "ACT_GRADUATING_CLASS_1415",
        "recordLength": 757,
		"naturalKey": ["TEST_DATE", "TEST_LOCATION", "STUDENT_FIRST_NAME", "STUDENT_MIDDLE_INITIAL", "STUDENT_LAST_NAME", "STUDENT_BIRTHDATE_STR"],
		"fields": [{
				"physicalName": "Graduation Year Identifier",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_YEAR_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 2,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": ["15"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Student Name (see also 155-180)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 30,
					"columnNum": 2
				},
				"fieldLength": 28,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 31,
					"offsetEnd": 32,
					"columnNum": 3
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Street Address",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 33,
					"offsetEnd": 51,
					"columnNum": 4
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 52,
					"offsetEnd": 58,
					"columnNum": 5
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "City",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 59,
					"offsetEnd": 72,
					"columnNum": 6
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 73,
					"offsetEnd": 74,
					"columnNum": 7
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State of Residence",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 77,
					"offsetEnd": 78,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 79,
					"offsetEnd": 80,
					"columnNum": 9
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ZIP Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ZIP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 81,
					"offsetEnd": 85,
					"columnNum": 10
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 86,
					"offsetEnd": 86,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender (Numeric)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_NUMERIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 87,
					"offsetEnd": 87,
					"columnNum": 12
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "4", "6", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 88,
					"offsetEnd": 88,
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "4", "6", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Level (numeric or blank)",
				"otherPossibleNames": [],
				"logicalName": "GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 89,
					"offsetEnd": 90,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": ["07", "08", "09", "10", "11", "12", "13", "14", "15"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 91,
					"offsetEnd": 99,
					"columnNum": 15
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Telephone Type",
				"otherPossibleNames": [],
				"logicalName": "PHONE_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 100,
					"offsetEnd": 100,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_BIRTHDATE_STR",
				"formatMask": "MMDDYY",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 101,
					"offsetEnd": 106,
					"columnNum": 17
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Telephone Number",
				"otherPossibleNames": [],
				"logicalName": "PHONE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 107,
					"offsetEnd": 116,
					"columnNum": 18
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 154,
					"columnNum": 19
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Name (Last)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 170,
					"columnNum": 20
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Name (First)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 171,
					"offsetEnd": 179,
					"columnNum": 21
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Name (Middle)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 180,
					"offsetEnd": 180,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 181,
					"offsetEnd": 204,
					"columnNum": 23
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "H.S. Code",
				"otherPossibleNames": [],
				"logicalName": "ACT_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 205,
					"offsetEnd": 210,
					"columnNum": 24
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 222,
					"columnNum": 25
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Year of H.S. Graduation",
				"otherPossibleNames": [],
				"logicalName": "YEAR_OF_HS_GRADUATION",
				"formatMask": "YYYY",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 223,
					"offsetEnd": 226,
					"columnNum": 26
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Test Date (Month and Year)",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": "MMYY",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 233,
					"offsetEnd": 236,
					"columnNum": 27
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 237,
					"offsetEnd": 248,
					"columnNum": 28
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Location",
				"otherPossibleNames": [],
				"logicalName": "TEST_LOCATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 249,
					"offsetEnd": 249,
					"columnNum": 29
				},
				"fieldLength": 1,
				"expectedValues": ["S", "D", "F", "Z", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English Scale Scores",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 261,
					"offsetEnd": 262,
					"columnNum": 30
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mathematics Scale Scores",
				"otherPossibleNames": [],
				"logicalName": "MATH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 263,
					"offsetEnd": 264,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reading Scale Scores",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 265,
					"offsetEnd": 266,
					"columnNum": 32
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Science Scale Scores",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 267,
					"offsetEnd": 268,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Composite Scale Scores",
				"otherPossibleNames": [],
				"logicalName": "COMPOSITE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 269,
					"offsetEnd": 270,
					"columnNum": 34
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Combined English/Writing Score (EW)",
				"otherPossibleNames": [],
				"logicalName": "COMBINED_ENGLISH_WRITING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 271,
					"offsetEnd": 272,
					"columnNum": 35
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing Subscore (WR)",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 273,
					"offsetEnd": 274,
					"columnNum": 36
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Science & Technology Interest Inventory Standard Scores",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_SCIENCE_&_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 279,
					"offsetEnd": 280,
					"columnNum": 37
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
					"offsetStart": 281,
					"offsetEnd": 282,
					"columnNum": 38
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Arts Interest Inventory Standard Scores",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_ARTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 283,
					"offsetEnd": 284,
					"columnNum": 39
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
					"offsetStart": 285,
					"offsetEnd": 286,
					"columnNum": 40
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Social Service Interest Inventory Standard Scores",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_SOCIAL_SERVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 287,
					"offsetEnd": 288,
					"columnNum": 41
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
					"offsetStart": 289,
					"offsetEnd": 290,
					"columnNum": 42
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration & Sales Interest Inventory Standard Scores",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES _ADMINISTRATION_&_SALES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 291,
					"offsetEnd": 292,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
					"offsetStart": 293,
					"offsetEnd": 294,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Business Operations Interest Inventory Standard Scores",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_BUSINESS_OPERATIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 295,
					"offsetEnd": 296,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
					"offsetStart": 297,
					"offsetEnd": 298,
					"columnNum": 46
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Technical  Interest Inventory Standard Scores",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_TECHNICAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 299,
					"offsetEnd": 300,
					"columnNum": 47
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
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
					"offsetStart": 301,
					"offsetEnd": 302,
					"columnNum": 48
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Map Regions-World of Work",
				"otherPossibleNames": [],
				"logicalName": "WORLD_OF_WORK_MAP_REGIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 303,
					"offsetEnd": 308,
					"columnNum": 49
				},
				"fieldLength": 6,
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
					"offsetEnd": 319,
					"columnNum": 50
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Usage/Mechanics Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_ENGLISH_USAGE_MECH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 320,
					"offsetEnd": 321,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rhetorical Skills Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_ENGLISH_RHETORICAL_SKILLS_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 322,
					"offsetEnd": 323,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Elementary Algebra Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_MATH_ELEM_ALGEBRA_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 324,
					"offsetEnd": 325,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Algebra/Coord Geom Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_MATH_ALGEBRA_CORD_GEOMETRY_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 326,
					"offsetEnd": 327,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plane Geom/Trig Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_MATH_PLANE_GEOMETRY_TRIG_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 328,
					"offsetEnd": 329,
					"columnNum": 55
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Soc Studies/Science Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_READING_SOCIAL_STUDIES_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 330,
					"offsetEnd": 331,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Arts/Literature Scale Subscores",
				"otherPossibleNames": [],
				"logicalName": "SUBSCORE_READING_ARTS_LIT_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 332,
					"offsetEnd": 333,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
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
					"offsetStart": 334,
					"offsetEnd": 368,
					"columnNum": 58
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Science & Technology Interest Inventory - US Ranks (Cumulative %)",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_SCIENCE_&_TECHNOLOGY_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 369,
					"offsetEnd": 370,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Arts Interest Inventory - US Ranks (Cumulative %)",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_ARTS_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 372,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Social Service Interest Inventory - US Ranks (Cumulative %)",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_SOCIAL_SERVICE_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 373,
					"offsetEnd": 374,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Administration & Sales Interest Inventory - US Ranks (Cumulative %)",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_ADMINISTRATION_&_SALES_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 375,
					"offsetEnd": 376,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Business Operations Interest Inventory - US Ranks (Cumulative %)",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_BUSINESS_OPERATIONS_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 377,
					"offsetEnd": 378,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Technical Interest Inventory - US Ranks (Cumulative %)",
				"otherPossibleNames": [],
				"logicalName": "INTEREST_INVENTORY_TECHNICAL_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 379,
					"offsetEnd": 380,
					"columnNum": 64
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
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
					"offsetStart": 381,
					"offsetEnd": 384,
					"columnNum": 65
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Core Indicator",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 385,
					"offsetEnd": 385,
					"columnNum": 66
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
					"offsetStart": 386,
					"offsetEnd": 400,
					"columnNum": 67
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Profile Section (SPS) (items 1-135)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_PROFILE_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 401,
					"offsetEnd": 550,
					"columnNum": 68
				},
				"fieldLength": 150,
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
					"offsetStart": 551,
					"offsetEnd": 604,
					"columnNum": 69
				},
				"fieldLength": 54,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EOS Release",
				"otherPossibleNames": [],
				"logicalName": "EOS_RELEASE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 605,
					"offsetEnd": 605,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Religious Affiliation",
				"otherPossibleNames": [],
				"logicalName": "RELIGIOUS_AFFILIATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 606,
					"offsetEnd": 607,
					"columnNum": 71
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
					"offsetStart": 608,
					"offsetEnd": 615,
					"columnNum": 72
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English High School Grades",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_HS_GRADES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 616,
					"offsetEnd": 617,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mathematics High School Grades",
				"otherPossibleNames": [],
				"logicalName": "MATH_HS_GRADES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 618,
					"offsetEnd": 619,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Social Studies High School Grades",
				"otherPossibleNames": [],
				"logicalName": "SS_HS_GRADES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 620,
					"offsetEnd": 621,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Natural Sciences High School Grades",
				"otherPossibleNames": [],
				"logicalName": "SCI_HS_GRADES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 622,
					"offsetEnd": 623,
					"columnNum": 76
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
					"offsetStart": 624,
					"offsetEnd": 627,
					"columnNum": 77
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "H.S. Overall Average",
				"otherPossibleNames": [],
				"logicalName": "AVERAGE_HS_GRADES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 628,
					"offsetEnd": 630,
					"columnNum": 78
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "H.S. Courses Taken or Planned",
				"otherPossibleNames": [],
				"logicalName": "COURSES_TAKEN_OR_PLANNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 631,
					"offsetEnd": 660,
					"columnNum": 79
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "High School Grades Earned",
				"otherPossibleNames": [],
				"logicalName": "GRADES_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 661,
					"offsetEnd": 690,
					"columnNum": 80
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
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 702,
					"columnNum": 81
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "College Choices",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CHOICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 703,
					"offsetEnd": 738,
					"columnNum": 82
				},
				"fieldLength": 36,
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
					"offsetStart": 739,
					"offsetEnd": 757,
					"columnNum": 83
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}