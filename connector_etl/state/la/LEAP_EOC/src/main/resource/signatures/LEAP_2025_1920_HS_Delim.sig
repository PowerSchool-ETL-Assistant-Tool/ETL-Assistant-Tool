{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "LEAP_2025_1920_HS_Delim",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR"],
		"fields": [{
			"physicalName": "AdministrationYear",
			"otherPossibleNames": [],
			"logicalName": "TEST_DATE_YEAR",
			"formatMask": "YYYY",
			"isFieldRequired": "Y",
			"canBeNull": "N",
			"fieldOffset": {
				"offsetStart": 0,
				"offsetEnd": 0,
				"columnNum": 1
			},
			"fieldLength": 500,
			"expectedValues": [],
			"dataTypes": "INTEGER",
			"scale": null
		},
			{
				"physicalName": "AdministrationMonth",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 500,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SchoolSystem",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
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
				"physicalName": "SchoolSystemName",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
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
				"physicalName": "SchoolCode",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 500,
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
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "LastName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 500,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 500,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DOB",
				"otherPossibleNames": [],
				"logicalName": "DOB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Grade",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 500,
				"expectedValues": ["06", "07", "08", "09", "9", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 500,
				"expectedValues": ["F", "M"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EthnicityRace",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY_RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EducationClassification",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_EDUCATION_CLASSIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 500,
				"expectedValues": ["", "Regular", "Special"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ExceptionalityCode",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EconomicallyDisadvantaged",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICALLY_DISADVANTAGED_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 500,
				"expectedValues": ["", "0", "1"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "EL",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_LEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Section504",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_SECTION_504_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Migrant",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CareerDiplomaPathwayTrack",
				"otherPossibleNames": [],
				"logicalName": "CAREER_DIPLOMA_PATHWAY/TRACK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HomelessFlag",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_HOMELESS_(MCKINNEY-VENTO)_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CharterSchoolType",
				"otherPossibleNames": [],
				"logicalName": "CHARTER_SCHOOL_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 500,
				"expectedValues": ["", "1", "2", "3", "4", "5", "6"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "MilitaryAffiliated",
				"otherPossibleNames": [],
				"logicalName": "MILITARY_AFFILIATED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FosterCare",
				"otherPossibleNames": [],
				"logicalName": "FOSTER_CARE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALLEAP2025Test",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALAdministrativeError",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALCourseName",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALClassSection",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTeacherLastName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTeacherFirstName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALTestingStatus",
				"otherPossibleNames": [],
				"logicalName": "STATUS_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ALAchievementLevel",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 500,
				"expectedValues": ["Approaching Basic", "Basic", "Mastery", "Unsatisfactory", "Advanced", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALMajorContentRating",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALInterpretingFunctionsRating",
				"otherPossibleNames": [],
				"logicalName": "INTERPRETING_FUNCTIONS_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALSolvingAlgebraicallyRating",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_ALGEBRAICALLY_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALSolvingGraphicallyRateofChangeRating",
				"otherPossibleNames": [],
				"logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALAdditionalAndSupportingContentRating",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALExpressingMathematicalReasoningRating",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ALModelingAndApplicationRating",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RATING_ALG1_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER1",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER2",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2LEAP2025Test",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2AdministrativeError",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2CourseName",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2ClassSection",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2TeacherLastName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2TeacherFirstName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2TestingStatus",
				"otherPossibleNames": [],
				"logicalName": "STATUS_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2VoidFlag",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2RawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E2ScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2AchievementLevel",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 500,
				"expectedValues": ["Approaching Basic", "Basic", "Mastery", "Unsatisfactory", "Advanced", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2ReadingPerformanceRating",
				"otherPossibleNames": [],
				"logicalName": "READING_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2ReadingLiteraryTextRating",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2ReadingInformationalTextRating",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2ReadingVocabularyTextRating",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2WritingPerformanceRating",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2WrittenExpressionRating",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E2WrittenKnowledgeAndUseofLanguageConventionsRating",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGII_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER3",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER4",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMLEAP2025Test",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMAdministrativeError",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMCourseName",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMClassSection",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMTeacherLastName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMTeacherFirstName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMTestingStatus",
				"otherPossibleNames": [],
				"logicalName": "STATUS_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "GMScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "GMAchievementLevel",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 500,
				"expectedValues": ["Approaching Basic", "Basic", "Mastery", "Unsatisfactory", "Advanced", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMMajorContentRating",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CONTENT_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMCongruenceTransformationsSimilarityRating",
				"otherPossibleNames": [],
				"logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMSimilarityInTrigonometryModelingAndApplyingRating",
				"otherPossibleNames": [],
				"logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMAdditionalAndSupportingContentRating",
				"otherPossibleNames": [],
				"logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMExpressingMathematicalReasoningRating",
				"otherPossibleNames": [],
				"logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GMModelingAndApplicationRating",
				"otherPossibleNames": [],
				"logicalName": "MODELING_&_APPLICATION_RATING_GEOM_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER5",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER6",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1LEAP2025Test",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1AdministrativeError",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1CourseName",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1ClassSection",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1TeacherLastName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1TeacherFirstName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1TestingStatus",
				"otherPossibleNames": [],
				"logicalName": "STATUS_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1VoidFlag",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1RawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E1ScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E1AchievementLevel",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 500,
				"expectedValues": ["Approaching Basic", "Basic", "Mastery", "Unsatisfactory", "Advanced", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1ReadingPerformanceRating",
				"otherPossibleNames": [],
				"logicalName": "READING_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1ReadingLiteraryTextRating",
				"otherPossibleNames": [],
				"logicalName": "READING_LITERARY_TEXT_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1ReadingInformationalTextRating",
				"otherPossibleNames": [],
				"logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1ReadingVocabularyTextRating",
				"otherPossibleNames": [],
				"logicalName": "READING_VOCABULARY_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1WritingPerformanceRating",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1WrittenExpressionRating",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_EXPRESSION_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E1WrittenKnowledgeAndUseofLanguageConventionsRating",
				"otherPossibleNames": [],
				"logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGI_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER7",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER8",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USLEAP2025Test",
				"otherPossibleNames": [],
				"logicalName": "CONTENT_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USAdministrativeError",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USCourseName",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USClassSection",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USTeacherLastName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USTeacherFirstName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USTestingStatus",
				"otherPossibleNames": [],
				"logicalName": "STATUS_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "USScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "USAchievementLevel",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 500,
				"expectedValues": ["Approaching Basic", "Basic", "Mastery", "Unsatisfactory", "Advanced", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USWesternExpansionToProgressivismStandard2Rating",
				"otherPossibleNames": [],
				"logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RATING_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USIsolationismThroughGreatWarStandard3Rating",
				"otherPossibleNames": [],
				"logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RATING_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USBecomingWorldPowerThroughWorldWarIIStandard4Rating",
				"otherPossibleNames": [],
				"logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RATING_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USColdWarEraAndTheModernAgeStandard5and6Rating",
				"otherPossibleNames": [],
				"logicalName": "COLD_WAR_ERA_AND_THE_MODERN_AGE_-_STANDARD_5_AND_6_-_RATING_SCORE_USHIST_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER9",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLLEAP2025Test",
				"otherPossibleNames": [],
				"logicalName": "TEST_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLAdministrativeError",
				"otherPossibleNames": [],
				"logicalName": "ADMIN_ERROR_ADMINISTRATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLCourseName",
				"otherPossibleNames": [],
				"logicalName": "COURSE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLClassSection",
				"otherPossibleNames": [],
				"logicalName": "CLASS_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLTeacherLastName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLTeacherFirstName",
				"otherPossibleNames": [],
				"logicalName": "TEACHER_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLTestingStatus",
				"otherPossibleNames": [],
				"logicalName": "STATUS_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLVoidFlag",
				"otherPossibleNames": [],
				"logicalName": "VOID_FLAG_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 500,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLRawScore",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "BLAchievementLevel",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 500,
				"expectedValues": ["Approaching Basic", "Basic", "Mastery", "Unsatisfactory", "Advanced", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLInvestigateRating",
				"otherPossibleNames": [],
				"logicalName": "INVESTIGATE_RATING_SCORE_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLEvaluateRating",
				"otherPossibleNames": [],
				"logicalName": "EVALUATE_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BLReasonScientificallyRating",
				"otherPossibleNames": [],
				"logicalName": "REASON_SCIENTIFICALLY_RATING_BIO_2025",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 500,
				"expectedValues": ["", "Weak", "Moderate", "Strong"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SchoolYear",
				"otherPossibleNames": [],
				"logicalName": "SCHOOLYEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv"]
}