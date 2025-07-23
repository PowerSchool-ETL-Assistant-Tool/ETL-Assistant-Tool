{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "LEAP_3_8_Fixed",
		"recordLength": 664,
    "naturalKey": ["LASID", "TEST_MODE_ELA", "TEST_MODE_MA", "TEST_MODE_SS", "TEST_MODE_SCI","DRC_UNIQUE_STUDENT_ID"],
		"fields": [{
				"physicalName": "SchoolSystemNbr",
				"otherPossibleNames": [],
				"logicalName": "SCHOOLSYSTEMNBR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 8,
					"offsetEnd": 10,
					"columnNum": 1
			},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SchoolSystemName",
				"otherPossibleNames": [],
				"logicalName": "SCHOOLSYSTEMNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 14,
					"offsetEnd": 53,
					"columnNum": 2
			},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SchoolNbr",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 11,
					"offsetEnd": 13,
					"columnNum": 3
			},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SchoolName",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 54,
					"offsetEnd": 93,
					"columnNum": 4
			},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Barcode/Student Precode Number",
				"otherPossibleNames": [],
				"logicalName": "BARCODE/STUDENT_PRECODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 102,
					"columnNum": 5
			},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "DRC Unique Student ID",
				"otherPossibleNames": [],
				"logicalName": "DRC_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 103,
					"offsetEnd": 108,
					"columnNum": 6
			},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": 0.0
			},
			{
				"physicalName": "Precoded Tester",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_TESTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 109,
					"offsetEnd": 109,
					"columnNum": 7
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LastName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 110,
					"offsetEnd": 121,
					"columnNum": 8
			},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FirstName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 122,
					"offsetEnd": 129,
					"columnNum": 9
			},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MiddleInitial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 130,
					"offsetEnd": 130,
					"columnNum": 10
			},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LASID",
				"otherPossibleNames": [],
				"logicalName": "LASID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 131,
					"offsetEnd": 140,
					"columnNum": 11
			},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DOB",
				"otherPossibleNames": [],
				"logicalName": "DOB",
				"formatMask": "MMddyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 145,
					"offsetEnd": 152,
					"columnNum": 12
			},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Grade",
				"otherPossibleNames": [],
				"logicalName": "GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 142,
					"columnNum": 13
			},
				"fieldLength": 2,
				"expectedValues": ["03", "04", "05", "06", "07", "08"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 153,
					"offsetEnd": 153,
					"columnNum": 14
			},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "I"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EthnicityRace",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITYRACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 155,
					"columnNum": 15
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "I"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Migrant",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 156,
					"offsetEnd": 156,
					"columnNum": 16
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP Economically Disadvantaged",
				"otherPossibleNames": [],
				"logicalName": "LAP_ECONOMICALLY_DISADVANTAGED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 158,
					"offsetEnd": 158,
					"columnNum": 17
			},
				"fieldLength": 1,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "McKinney Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "MCKINNEY_VENTO_ACT_HOMELESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 159,
					"offsetEnd": 159,
					"columnNum": 18
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EducationClassificationSummary",
				"otherPossibleNames": [],
				"logicalName": "EDUCATIONCLASSIFICATIONSUMMARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 675,
					"offsetEnd": 675,
					"columnNum": 19
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "English Learner",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LEARNER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 698,
					"offsetEnd": 698,
					"columnNum": 20
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Section504",
				"otherPossibleNames": [],
				"logicalName": "SECTION504",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 706,
					"offsetEnd": 706,
					"columnNum": 21
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Military Affiliation",
				"otherPossibleNames": [],
				"logicalName": "MILITARY_AFFILIATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 172,
					"offsetEnd": 172,
					"columnNum": 22
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Foster Care",
				"otherPossibleNames": [],
				"logicalName": "FOSTER_CARE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 175,
					"offsetEnd": 175,
					"columnNum": 23
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemediationNeeded",
				"otherPossibleNames": [],
				"logicalName": "REMEDIATIONNEEDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1538,
					"offsetEnd": 1538,
					"columnNum": 24
			},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELA Test Mode",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1274,
					"offsetEnd": 1274,
					"columnNum": 25
			},
				"fieldLength": 1,
				"expectedValues": ["P", "O", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELA Litho",
				"otherPossibleNames": [],
				"logicalName": "ELA_LITHO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1350,
					"offsetEnd": 1361,
					"columnNum": 26
			},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ELARawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 734,
					"offsetEnd": 738,
					"columnNum": 27
			},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ELAScaledScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 739,
					"offsetEnd": 741,
					"columnNum": 28
			},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ELAVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "ELAVOIDFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1206,
					"offsetEnd": 1206,
					"columnNum": 29
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "4", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ELAAchievement",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 742,
					"offsetEnd": 744,
					"columnNum": 30
			},
				"fieldLength": 3,
				"expectedValues": ["ADV", "MAS", "BAS", "APP", "UNS", "INC", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELA Reading Performance",
				"otherPossibleNames": [],
				"logicalName": "ELA_READING_PERFORMANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 809,
					"offsetEnd": 809,
					"columnNum": 31
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ELA Writing Performance",
				"otherPossibleNames": [],
				"logicalName": "ELA_WRITING_PERFORMANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 817,
					"offsetEnd": 817,
					"columnNum": 32
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Informational Text",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 757,
					"columnNum": 33
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Literary Text",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 749,
					"offsetEnd": 749,
					"columnNum": 34
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Vocabulary",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 765,
					"offsetEnd": 765,
					"columnNum": 35
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Expression",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 773,
					"offsetEnd": 773,
					"columnNum": 36
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Knowledge & Use of Language Conventions",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 781,
					"columnNum": 37
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Math Test Mode",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1275,
					"offsetEnd": 1275,
					"columnNum": 38
			},
				"fieldLength": 1,
				"expectedValues": ["P", "O", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Math Litho",
				"otherPossibleNames": [],
				"logicalName": "MATH_LITHO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1394,
					"offsetEnd": 1405,
					"columnNum": 39
			},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MathRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 857,
					"offsetEnd": 861,
					"columnNum": 40
			},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MathScaledScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 862,
					"offsetEnd": 864,
					"columnNum": 41
			},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MathVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "MATHVOIDFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1207,
					"offsetEnd": 1207,
					"columnNum": 42
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "4", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MathAchievement",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 865,
					"offsetEnd": 867,
					"columnNum": 43
			},
				"fieldLength": 3,
				"expectedValues": ["ADV", "MAS", "BAS", "APP", "UNS", "INC", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Major Content",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 872,
					"offsetEnd": 872,
					"columnNum": 44
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Products & Quotients_SolveMultiplication & Division Problems",
				"otherPossibleNames": [],
				"logicalName": "PRODUCTS_&_QUOTIENTS_SOLVEMULTIPLICATION_&_DIVISION_PROBLEMS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 45
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solve Problems with Any Operation",
				"otherPossibleNames": [],
				"logicalName": "SOLVE_PROBLEMS_WITH_ANY_OPERATION_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 46
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Fractions as Numbers & Equivalence",
				"otherPossibleNames": [],
				"logicalName": "FRACTIONS_AS_NUMBERS_&_EQUIVALENCE_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 47
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solve Time Area Measurement & Estimation Problems",
				"otherPossibleNames": [],
				"logicalName": "SOLVE_TIME_AREA_MEASUREMENT_&_ESTIMATION_PROBLEMS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 920,
					"offsetEnd": 920,
					"columnNum": 48
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Compare & Solve Problems with Fractions",
				"otherPossibleNames": [],
				"logicalName": "COMPARE_&_SOLVE_PROBLEMS_WITH_FRACTIONS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 49
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solve Multistep Problems",
				"otherPossibleNames": [],
				"logicalName": "SOLVE_MULTISTEP_PROBLEMS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 50
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Multiplicative Comparison & Place Value",
				"otherPossibleNames": [],
				"logicalName": "MULTIPLICATIVE_COMPARISON_&_PLACE_VALUE_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 51
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Operations with Decimals_Read Write Compare & Decimals",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONS_WITH_DECIMALS_READ_WRITE_COMPARE_&_DECIMALS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 52
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solve Fraction Problems",
				"otherPossibleNames": [],
				"logicalName": "SOLVE_FRACTION_PROBLEMS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 53
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Interpret Fractions Place Value & Scaling",
				"otherPossibleNames": [],
				"logicalName": "INTERPRET_FRACTIONS_PLACE_VALUE_&_SCALING_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 54
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Recognize Represent & Determine Volume_Multiply & Divide Whole Numbers",
				"otherPossibleNames": [],
				"logicalName": "RECOGNIZE_REPRESENT_&_DETERMINE_VOLUME_MULTIPLY_&_DIVIDE_WHOLE_NUMBERS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 920,
					"offsetEnd": 920,
					"columnNum": 55
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Rational Numbers_Multiply & Divide Fractions",
				"otherPossibleNames": [],
				"logicalName": "RATIONAL_NUMBERS_MULTIPLY_&_DIVIDE_FRACTIONS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 56
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Ratio & Rate",
				"otherPossibleNames": [],
				"logicalName": "RATIO_&_RATE_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 57
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expressions Inequalities & Equations",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSIONS_INEQUALITIES_&_EQUATIONS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 58
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Analyze Proportional Relationships & Solve Problems",
				"otherPossibleNames": [],
				"logicalName": "ANALYZE_PROPORTIONAL_RELATIONSHIPS_&_SOLVE_PROBLEMS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 59
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Operations with Rational Numbers",
				"otherPossibleNames": [],
				"logicalName": "OPERATIONS_WITH_RATIONAL_NUMBERS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 60
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Radicals Integer Exponents & Scientific Notation",
				"otherPossibleNames": [],
				"logicalName": "RADICALS_INTEGER_EXPONENTS_&_SCIENTIFIC_NOTATION_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 61
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Proportional Relationships Linear Equations & Functions",
				"otherPossibleNames": [],
				"logicalName": "PROPORTIONAL_RELATIONSHIPS_LINEAR_EQUATIONS_&_FUNCTIONS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 62
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Solving Linear Equations_SystemsLinear Equations of Linear Equations",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_LINEAR_EQUATIONS_SYSTEMSLINEAR_EQUATIONS_OF_LINEAR_EQUATIONS_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 63
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Congruence & Similarity_Pythagorean Theorem",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_&_SIMILARITY_PYTHAGOREAN_THEOREM_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 920,
					"offsetEnd": 920,
					"columnNum": 64
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Additional & Supporting Content",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 880,
					"offsetEnd": 880,
					"columnNum": 65
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expressing Mathematical Reasoning",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 888,
					"offsetEnd": 888,
					"columnNum": 66
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Modeling & Application",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RATING_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 896,
					"offsetEnd": 896,
					"columnNum": 67
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Social Test Mode",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1277,
					"offsetEnd": 1277,
					"columnNum": 68
			},
				"fieldLength": 1,
				"expectedValues": ["P", "O", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Social Litho",
				"otherPossibleNames": [],
				"logicalName": "SOCIAL_LITHO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1482,
					"offsetEnd": 1493,
					"columnNum": 69
			},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SocialRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1057,
					"offsetEnd": 1061,
					"columnNum": 70
			},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SocialScaledScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1062,
					"offsetEnd": 1064,
					"columnNum": 71
			},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SocialVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "SOCIALVOIDFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1209,
					"offsetEnd": 1209,
					"columnNum": 72
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "4", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SocialAchievement",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1065,
					"offsetEnd": 1067,
					"columnNum": 73
			},
				"fieldLength": 3,
				"expectedValues": ["ADV", "MAS", "BAS", "APP", "UNS", "INC", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "History",
				"otherPossibleNames": [],
				"logicalName": "HISTORY_RATING_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1075,
					"offsetEnd": 1075,
					"columnNum": 74
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Geography",
				"otherPossibleNames": [],
				"logicalName": "GEOGRAPHY_RATING_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1083,
					"offsetEnd": 1083,
					"columnNum": 75
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Civics",
				"otherPossibleNames": [],
				"logicalName": "CIVICS_RATING_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1091,
					"offsetEnd": 1091,
					"columnNum": 76
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Economics",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICS_RATING_SS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1099,
					"offsetEnd": 1099,
					"columnNum": 77
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science Test Mode",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1276,
					"offsetEnd": 1276,
					"columnNum": 78
			},
				"fieldLength": 1,
				"expectedValues": ["P", "O", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Science Litho",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_LITHO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1438,
					"offsetEnd": 1449,
					"columnNum": 79
			},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ScienceRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 936,
					"offsetEnd": 940,
					"columnNum": 80
			},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ScienceScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 941,
					"offsetEnd": 943,
					"columnNum": 81
			},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ScienceVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "SCIENCEVOIDFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1208,
					"offsetEnd": 1208,
					"columnNum": 82
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "4", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ScienceAchievement",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 944,
					"offsetEnd": 946,
					"columnNum": 83
			},
				"fieldLength": 3,
				"expectedValues": ["ADV", "MAS", "BAS", "APP", "UNS", "INC", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Investigate",
				"otherPossibleNames": [],
				"logicalName": "INVESTIGATE_RATING_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 954,
					"offsetEnd": 954,
					"columnNum": 84
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Evaluate",
				"otherPossibleNames": [],
				"logicalName": "EVALUATE_RATING_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 962,
					"offsetEnd": 962,
					"columnNum": 85
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ReasonScientifically",
				"otherPossibleNames": [],
				"logicalName": "REASONSCIENTIFICALLY_RATING_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 970,
					"offsetEnd": 970,
					"columnNum": 86
			},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ELAOptionalLocalUse",
				"otherPossibleNames": [],
				"logicalName": "ELAOPTIONALLOCALUSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 186,
					"offsetEnd": 195,
					"columnNum": 87
			},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MathOptionalLocalUse",
				"otherPossibleNames": [],
				"logicalName": "MATHOPTIONALLOCALUSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 302,
					"offsetEnd": 311,
					"columnNum": 88
			},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ScienceOptionalLocalUse",
				"otherPossibleNames": [],
				"logicalName": "SCIENCEOPTIONALLOCALUSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 424,
					"offsetEnd": 433,
					"columnNum": 89
			},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SocialOptionalLocalUse",
				"otherPossibleNames": [],
				"logicalName": "SOCIALOPTIONALLOCALUSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 549,
					"offsetEnd": 558,
					"columnNum": 90
			},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "AdministrationDate",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATIONDATE",
				"formatMask": "MMyyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 559,
					"offsetEnd": 664,
					"columnNum": 91
			},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}