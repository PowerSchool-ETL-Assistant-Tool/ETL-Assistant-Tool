{
    "encoding": "UTF-8",
    "format": {
        "@type": "Fixed Length",
        "formatName": "ACT_STUDENT_RECORD_1314",
        "recordLength": 783,
		"naturalKey": ["TEST_DATE", "TEST_LOCATION", "STUDENT_FIRST_NAME", "STUDENT_MIDDLE_INITIAL", "STUDENT_LAST_NAME", "STUDENT_BIRTHDATE_STR"],
		"fields": [{
				"logicalName": "REPORTING_YEAR_IDENTIFIER",
				"otherPossibleNames": [],
				"physicalName": "Reporting Year Identifier",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 2,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": ["13"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"logicalName": "STUDENT_LAST_NAME",
				"otherPossibleNames": [],
				"physicalName": "Last Name",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 27,
					"columnNum": 2
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_FIRST_NAME",
				"otherPossibleNames": [],
				"physicalName": "First Name",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 28,
					"offsetEnd": 43,
					"columnNum": 3
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"otherPossibleNames": [],
				"physicalName": "Middle Initial",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 44,
					"offsetEnd": 44,
					"columnNum": 4
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_ADDRESS",
				"otherPossibleNames": [],
				"physicalName": "Address",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 45,
					"offsetEnd": 84,
					"columnNum": 5
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "COUNTRY_CODE",
				"otherPossibleNames": [],
				"physicalName": "Country Code",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 85,
					"offsetEnd": 86,
					"columnNum": 6
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_GENDER_NUMERIC",
				"otherPossibleNames": [],
				"physicalName": "Gender (Numeric)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 87,
					"offsetEnd": 87,
					"columnNum": 7
				},
				"fieldLength": 1,
				"expectedValues": ["4", "6", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_GENDER_CODE",
				"otherPossibleNames": [],
				"physicalName": "Gender (Alpha)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 88,
					"offsetEnd": 88,
					"columnNum": 8
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "GRADE_LEVEL",
				"otherPossibleNames": [],
				"physicalName": "Grade Level",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 89,
					"offsetEnd": 90,
					"columnNum": 9
				},
				"fieldLength": 2,
				"expectedValues": ["07", "08", "09", "10", "11", "12", "13", "14", "15"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_VENDOR_ID",
				"otherPossibleNames": [],
				"physicalName": "ACT ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 91,
					"offsetEnd": 99,
					"columnNum": 10
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "PHONE_TYPE",
				"otherPossibleNames": [],
				"physicalName": "Phone Type",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 100,
					"offsetEnd": 100,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"logicalName": "STUDENT_BIRTHDATE_STR",
				"otherPossibleNames": [],
				"physicalName": "Date of Birth",
				"formatMask": "MMDDYY",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 101,
					"offsetEnd": 106,
					"columnNum": 12
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"logicalName": "PHONE_NUMBER",
				"otherPossibleNames": [],
				"physicalName": "Phone Number",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 107,
					"offsetEnd": 116,
					"columnNum": 13
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_CITY",
				"otherPossibleNames": [],
				"physicalName": "City",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 141,
					"columnNum": 14
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_STATE_NUMERIC",
				"otherPossibleNames": [],
				"physicalName": "State (Numeric)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 142,
					"offsetEnd": 143,
					"columnNum": 15
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_STATE",
				"otherPossibleNames": [],
				"physicalName": "State (Alpha)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 144,
					"offsetEnd": 145,
					"columnNum": 16
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_ZIP_CODE",
				"otherPossibleNames": [],
				"physicalName": "ZIP Code",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 146,
					"offsetEnd": 154,
					"columnNum": 17
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_EXPANDED_BIRTHDATE_STR",
				"otherPossibleNames": [],
				"physicalName": "Expanded Date of Birth",
				"formatMask": "YYYYMMDD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 162,
					"columnNum": 18
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"logicalName": "COMBINED_ENGLISH_WRITING_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Combined English/Writing (EW) Score",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 163,
					"offsetEnd": 164,
					"columnNum": 19
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "WRITING_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Writing Subscore (WR)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 165,
					"offsetEnd": 166,
					"columnNum": 20
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "WRITING_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "National Norms for ACT Writing (EW &WR) (Cumulative Percent)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 167,
					"offsetEnd": 170,
					"columnNum": 21
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "COMMENTS_ON_ESSAY",
				"otherPossibleNames": [],
				"physicalName": "Comments on Essay",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 171,
					"offsetEnd": 178,
					"columnNum": 22
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 179,
					"offsetEnd": 204,
					"columnNum": 23
				},
				"fieldLength": 26,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "ACT_SCHOOL_CODE",
				"otherPossibleNames": [],
				"physicalName": "High School Code",
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
				"logicalName": "ENGLISH_HS_GRADES",
				"otherPossibleNames": [],
				"physicalName": "English High School Grades",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 212,
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "MATH_HS_GRADES",
				"otherPossibleNames": [],
				"physicalName": "Mathematics High School Grades",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 213,
					"offsetEnd": 214,
					"columnNum": 26
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SS_HS_GRADES",
				"otherPossibleNames": [],
				"physicalName": "Social Studies High School Grades",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 215,
					"offsetEnd": 216,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SCI_HS_GRADES",
				"otherPossibleNames": [],
				"physicalName": "Natural Sciences High School Grades",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 217,
					"offsetEnd": 218,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 219,
					"offsetEnd": 219,
					"columnNum": 29
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "AVERAGE_HS_GRADES",
				"otherPossibleNames": [],
				"physicalName": "High School Average",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 220,
					"offsetEnd": 222,
					"columnNum": 30
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "YEAR_OF_HS_GRADUATION",
				"otherPossibleNames": [],
				"physicalName": "Year of HS Graduation",
				"formatMask": "YYYY",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 223,
					"offsetEnd": 226,
					"columnNum": 31
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"logicalName": "EXPANDED_TEST_DATE",
				"otherPossibleNames": [],
				"physicalName": "Expanded Test Date",
				"formatMask": "YYYYMM",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 227,
					"offsetEnd": 232,
					"columnNum": 32
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"logicalName": "TEST_DATE",
				"otherPossibleNames": [],
				"physicalName": "Test Date",
				"formatMask": "MMYY",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 233,
					"offsetEnd": 236,
					"columnNum": 33
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "English State Ranks (Cumulative % - Scale Scores)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 237,
					"offsetEnd": 248,
					"columnNum": 34
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "TEST_LOCATION",
				"otherPossibleNames": [],
				"physicalName": "Test Location",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 249,
					"offsetEnd": 249,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": ["S", "D", "F", "Z", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "CANADIAN_PROVINCE",
				"otherPossibleNames": [],
				"physicalName": "Canadian Province",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 250,
					"offsetEnd": 251,
					"columnNum": 36
				},
				"fieldLength": 2,
				"expectedValues": ["  ", "AB", "BC", "MB", "NB", "NL", "NT", "NS", "NU", "ON", "PE", "QC", "SK", "YT"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 252,
					"offsetEnd": 252,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "CANADIAN_POSTAL_CODE",
				"otherPossibleNames": [],
				"physicalName": "Canadian Postal Code",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 253,
					"offsetEnd": 259,
					"columnNum": 38
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "CORRECTED_REPORT_INDICATOR",
				"otherPossibleNames": [],
				"physicalName": "Corrected Report Indicator",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 260,
					"offsetEnd": 260,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": [" ", "R"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "ENGLISH_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "English Scale Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 261,
					"offsetEnd": 262,
					"columnNum": 40
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "MATH_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Mathematics Scale Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 263,
					"offsetEnd": 264,
					"columnNum": 41
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "READING_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Reading Scale Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 265,
					"offsetEnd": 266,
					"columnNum": 42
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SCIENCE_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Science Scale Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 267,
					"offsetEnd": 268,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "COMPOSITE_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Composite Scale Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 269,
					"offsetEnd": 270,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 271,
					"offsetEnd": 271,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUM_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Sum of Scale Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 272,
					"offsetEnd": 274,
					"columnNum": 46
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 275,
					"offsetEnd": 278,
					"columnNum": 47
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 279,
					"offsetEnd": 280,
					"columnNum": 48
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_SCIENCE_&_TECHNOLOGY",
				"otherPossibleNames": [],
				"physicalName": "Science & Technology Interest Inventory Standard Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 281,
					"offsetEnd": 282,
					"columnNum": 49
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 283,
					"offsetEnd": 284,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_ARTS",
				"otherPossibleNames": [],
				"physicalName": "Arts Interest Inventory Standard Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 285,
					"offsetEnd": 286,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 287,
					"offsetEnd": 288,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_SOCIAL_SERVICE",
				"otherPossibleNames": [],
				"physicalName": "Social Service Interest Inventory Standard Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 289,
					"offsetEnd": 290,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 291,
					"offsetEnd": 292,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES _ADMINISTRATION_&_SALES",
				"otherPossibleNames": [],
				"physicalName": "Administration & Sales Interest Inventory Standard Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 293,
					"offsetEnd": 294,
					"columnNum": 55
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 295,
					"offsetEnd": 296,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_BUSINESS_OPERATIONS",
				"otherPossibleNames": [],
				"physicalName": "Business Operations Interest Inventory Standard Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 297,
					"offsetEnd": 298,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 299,
					"offsetEnd": 300,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_STANDARD_SCORES_TECHNICAL",
				"otherPossibleNames": [],
				"physicalName": "Technical  Interest Inventory Standard Scores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 301,
					"offsetEnd": 302,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": ["--", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "WORLD_OF_WORK_MAP_REGIONS",
				"otherPossibleNames": [],
				"physicalName": "World-of-Work Map Regions",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 303,
					"offsetEnd": 308,
					"columnNum": 60
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 309,
					"offsetEnd": 319,
					"columnNum": 61
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_ENGLISH_USAGE_MECH_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Usage/Mechanics Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 320,
					"offsetEnd": 321,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_ENGLISH_RHETORICAL_SKILLS_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Rhetorical Skills Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 322,
					"offsetEnd": 323,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_MATH_ELEM_ALGEBRA_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Elementary Algebra Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 324,
					"offsetEnd": 325,
					"columnNum": 64
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_MATH_ALGEBRA_CORD_GEOMETRY_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Algebra/Coord Geom Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 326,
					"offsetEnd": 327,
					"columnNum": 65
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_MATH_PLANE_GEOMETRY_TRIG_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Plane Geom/Trig Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 328,
					"offsetEnd": 329,
					"columnNum": 66
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_READING_SOCIAL_STUDIES_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Soc Studies/Science Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 330,
					"offsetEnd": 331,
					"columnNum": 67
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_READING_ARTS_LIT_SCALED_SCORE",
				"otherPossibleNames": [],
				"physicalName": "Arts/Literature Scale Subscores",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 332,
					"offsetEnd": 333,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_ENGLISH_USAGE_MECH_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Usage/Mechanics",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 334,
					"offsetEnd": 335,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_ENGLISH_RHETORICAL_SKILLS_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Rhetorical Skills",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 336,
					"offsetEnd": 337,
					"columnNum": 70
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_MATH_ELEM_ALGEBRA_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Elementary Algebra",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 338,
					"offsetEnd": 339,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_MATH_ALGEBRA_CORD_GEOMETRY_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Algebra/Coord Geom",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 340,
					"offsetEnd": 341,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_MATH_PLANE_GEOMETRY_TRIG_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Plane Geom/Trig",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 342,
					"offsetEnd": 343,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SUBSCORE_READING_SOCIAL_STUDIES_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Soc Studies/Science",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 344,
					"offsetEnd": 345,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "READING_ARTS_LIT_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  test events before 9/2016- Arts/Literature",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 346,
					"offsetEnd": 347,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 348,
					"offsetEnd": 368,
					"columnNum": 76
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_SCIENCE_&_TECHNOLOGY_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "Science & Technology Interest Inventory - US Ranks (Cumulative %)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 369,
					"offsetEnd": 370,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_ARTS_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "Arts Interest Inventory - US Ranks (Cumulative %)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 372,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_SOCIAL_SERVICE_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "Social Service Interest Inventory - US Ranks (Cumulative %)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 373,
					"offsetEnd": 374,
					"columnNum": 79
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_ADMINISTRATION_&_SALES_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "Administration & Sales Interest Inventory - US Ranks (Cumulative %)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 375,
					"offsetEnd": 376,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_BUSINESS_OPERATIONS_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "Business Operations Interest Inventory - US Ranks (Cumulative %)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 377,
					"offsetEnd": 378,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "INTEREST_INVENTORY_TECHNICAL_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "Technical Interest Inventory - US Ranks (Cumulative %)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 379,
					"offsetEnd": 380,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "LOCAL_ID_NUMBER",
				"otherPossibleNames": [],
				"physicalName": "Local ID Number",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 381,
					"offsetEnd": 390,
					"columnNum": 83
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 391,
					"offsetEnd": 400,
					"columnNum": 84
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STUDENT_PROFILE_SECTION",
				"otherPossibleNames": [],
				"physicalName": "Student Profile Section (SPS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 401,
					"offsetEnd": 550,
					"columnNum": 85
				},
				"fieldLength": 150,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 551,
					"offsetEnd": 604,
					"columnNum": 86
				},
				"fieldLength": 54,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "EOS_RELEASE",
				"otherPossibleNames": [],
				"physicalName": "EOS Release",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 605,
					"offsetEnd": 605,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "RELIGIOUS_AFFILIATION",
				"otherPossibleNames": [],
				"physicalName": "Religious Affiliation",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 606,
					"offsetEnd": 607,
					"columnNum": 88
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 608,
					"offsetEnd": 630,
					"columnNum": 89
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "COURSES_TAKEN_OR_PLANNED",
				"otherPossibleNames": [],
				"physicalName": "Courses Taken or Planned",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 631,
					"offsetEnd": 660,
					"columnNum": 90
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "GRADES_EARNED",
				"otherPossibleNames": [],
				"physicalName": "Grades Earned",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 661,
					"offsetEnd": 690,
					"columnNum": 91
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "STATE_STUDENT_ID_VERSION_2",
				"otherPossibleNames": [],
				"physicalName": "State-Assigned Student ID Number (10-characters)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 700,
					"columnNum": 92
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "COLLEGE_CHOICES",
				"otherPossibleNames": [],
				"physicalName": "College Choices",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 701,
					"offsetEnd": 724,
					"columnNum": 93
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "BLANK",
				"otherPossibleNames": [],
				"physicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 725,
					"offsetEnd": 772,
					"columnNum": 94
				},
				"fieldLength": 48,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "ENGLISH_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  Scale Scores - English",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 773,
					"offsetEnd": 774,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "MATH_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  Scale Scores - Mathematics",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 776,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "READING_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  Scale Scores - Reading",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 778,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "SCIENCE_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  Scale Scores - Science ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 779,
					"offsetEnd": 780,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "COMPOSITE_NATIONAL_NORM",
				"otherPossibleNames": [],
				"physicalName": "US Ranks (Cumulative %)  Scale Scores - Composite",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 782,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"logicalName": "NORMS_TYPE",
				"otherPossibleNames": [],
				"physicalName": "Norms Type",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 783,
					"offsetEnd": 783,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": ["0"],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}