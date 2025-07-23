{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "PARCC_LOWERCASE",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "hasHeader": true,
		"naturalKey": ["STATE_STUDENT_IDENTIFIER", "RECORD_TYPE", "TEST_CODE"],
		"fields": [{
				"physicalName": "recordType",
				"otherPossibleNames": [],
				"logicalName": "RECORD_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "multipleRecordFlag",
				"otherPossibleNames": [],
				"logicalName": "MULTIPLE_RECORD_FLAG",
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
				"physicalName": "reportedSummativeScoreFlag",
				"otherPossibleNames": [],
				"logicalName": "REPORTED_SUMMATIVE_SCORE_FLAG_(ONLY_FOR_RECORD_TYPE_01)",
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
				"physicalName": "reportedRosterFlag",
				"otherPossibleNames": [],
				"logicalName": "REPORTED_ROSTER_FLAG_(ONLY_FOR_RECORD_TYPE_02_OR_03)",
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
				"physicalName": "reportSuppressionCode",
				"otherPossibleNames": [],
				"logicalName": "REPORT_SUPPRESSION_CODE_(ONLY_FOR_RECORD_TYPE_01)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "reportSuppressionAction",
				"otherPossibleNames": [],
				"logicalName": "REPORT_SUPPRESSION_ACTION_(ONLY_FOR_RECORD_TYPE_01)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "assessmentYear",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 9,
				"expectedValues": ["2014-2015"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pba03Category",
				"otherPossibleNames": [],
				"logicalName": "PBA_TYPE_03_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoy03Category",
				"otherPossibleNames": [],
				"logicalName": "EOY_TYPE_03_CATEGORY",
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
				"physicalName": "stateAbbreviation",
				"otherPossibleNames": [],
				"logicalName": "STATE_ABBREVIATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 2,
				"expectedValues": ["CO"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "responsibleDistrictIdentifier",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLE_DISTRICT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "responsibleDistrictName",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLE_DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "responsibleSchoolInstitutionIdentifier",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLE_SCHOOL/INSTITUTION_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "responsibleSchoolInstitutionName",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLE_SCHOOL/INSTITUTION_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTestingDistrictIdentifier",
				"otherPossibleNames": [],
				"logicalName": "PBA_TESTING_DISTRICT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTestingDistrictName",
				"otherPossibleNames": [],
				"logicalName": "PBA_TESTING_DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTestingSchoolInstitutionIdentifier",
				"otherPossibleNames": [],
				"logicalName": "PBA_TESTING_SCHOOL/INSTITUTION_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTestingSchoolInstitutionName",
				"otherPossibleNames": [],
				"logicalName": "PBA_TESTING_SCHOOL/INSTITUTION_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTestingDistrictIdentifier",
				"otherPossibleNames": [],
				"logicalName": "EOY_TESTING_DISTRICT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTestingDistrictName",
				"otherPossibleNames": [],
				"logicalName": "EOY_TESTING_DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTestingSchoolInstitutionIdentifier",
				"otherPossibleNames": [],
				"logicalName": "EOY_TESTING_SCHOOL/INSTITUTION_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTestingSchoolInstitutionName",
				"otherPossibleNames": [],
				"logicalName": "EOY_TESTING_SCHOOL/INSTITUTION_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "parccStudentIdentifier",
				"otherPossibleNames": [],
				"logicalName": "PARCC_STUDENT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "stateStudentIdentifier",
				"otherPossibleNames": [],
				"logicalName": "STATE_STUDENT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "localStudentIdentifier",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STUDENT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "firstName",
				"otherPossibleNames": [],
				"logicalName": "FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "middleName",
				"otherPossibleNames": [],
				"logicalName": "MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "lastName",
				"otherPossibleNames": [],
				"logicalName": "LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "sex",
				"otherPossibleNames": [],
				"logicalName": "SEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "birthdate",
				"otherPossibleNames": [],
				"logicalName": "BIRTHDATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData1",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "gradeLevelWhenAssessed",
				"otherPossibleNames": [],
				"logicalName": "GRADE_LEVEL_WHEN_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "hispanicOrLatinoEthnicity",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC_OR_LATINO_ETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "americanIndianOrAlaskaNative",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "blackOrAfricanAmerican",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "nativeHawaiianOrOtherPacificIslander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "white",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "twoOrMoreRaces",
				"otherPossibleNames": [],
				"logicalName": "TWO_OR_MORE_RACES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "fillerRaceField",
				"otherPossibleNames": [],
				"logicalName": "FILLER_RACE_FIELD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "federalRaceEthnicity",
				"otherPossibleNames": [],
				"logicalName": "FEDERAL_RACE/ETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "englishLearner",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LEARNER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "titleIIILimitedEnglishProficientParticipationStatus",
				"otherPossibleNames": [],
				"logicalName": "TITLE_III_LIMITED_ENGLISH_PROFICIENT_PARTICIPATION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "giftedAndTalented",
				"otherPossibleNames": [],
				"logicalName": "GIFTED_AND_TALENTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "migrantStatus",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "economicDisadvantageStatus",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "studentWithDisabilities",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_WITH_DISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "primaryDisabilityType",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "staffMemberIdentifier",
				"otherPossibleNames": [],
				"logicalName": "STAFF_MEMBER_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "assessmentAccommodationEnglishLearner",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACCOMMODATION:_ENGLISH_LEARNER_(EL)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "assessmentAccommodation504",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACCOMMODATION:_504",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "assessmentAccommodationIndividualizedEducationalPlan",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACCOMMODATION:_INDIVIDUALIZED_EDUCATIONAL_PLAN_(IEP)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "frequentBreaks",
				"otherPossibleNames": [],
				"logicalName": "FREQUENT_BREAKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "separateAlternateLocation",
				"otherPossibleNames": [],
				"logicalName": "SEPARATE/ALTERNATE_LOCATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "smallTestingGroup",
				"otherPossibleNames": [],
				"logicalName": "SMALL_TESTING_GROUP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "specializedEquipmentOrFurniture",
				"otherPossibleNames": [],
				"logicalName": "SPECIALIZED_EQUIPMENT_OR_FURNITURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "specifiedAreaOrSetting",
				"otherPossibleNames": [],
				"logicalName": "SPECIFIED_AREA_OR_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "timeOfDay",
				"otherPossibleNames": [],
				"logicalName": "TIME_OF_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "answerMasking",
				"otherPossibleNames": [],
				"logicalName": "ANSWER_MASKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "colorContrast",
				"otherPossibleNames": [],
				"logicalName": "COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "textToSpeechForMathematics",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH_FOR_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "humanReaderOrHumanSignerForMathematics",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READER_OR_HUMAN_SIGNER_FOR_MATHEMATICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "aslVideo",
				"otherPossibleNames": [],
				"logicalName": "ASL_VIDEO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "screenReaderOrOtherAssistiveTechnologyApplication",
				"otherPossibleNames": [],
				"logicalName": "SCREEN_READER_OR_OTHER_ASSISTIVE_TECHNOLOGY_(AT)_APPLICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "closedCaptioningForElal",
				"otherPossibleNames": [],
				"logicalName": "CLOSED_CAPTIONING_FOR_ELA/L",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "humanReaderOrHumanSignerForElal",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READER_OR_HUMAN_SIGNER_FOR_ELA/L",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "refreshableBrailleDisplayForElal",
				"otherPossibleNames": [],
				"logicalName": "REFRESHABLE_BRAILLE_DISPLAY_FOR_ELA/L",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "tactileGraphics",
				"otherPossibleNames": [],
				"logicalName": "TACTILE_GRAPHICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "textToSpeechForElal",
				"otherPossibleNames": [],
				"logicalName": "TEXT-TO-SPEECH_FOR_ELA/L",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "answersRecordedInTestBook",
				"otherPossibleNames": [],
				"logicalName": "ANSWERS_RECORDED_IN_TEST_BOOK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "brailleResponse",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "calculationDeviceAndMathematicsTools",
				"otherPossibleNames": [],
				"logicalName": "CALCULATION_DEVICE_AND_MATHEMATICS_TOOLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "elalConstructedResponse",
				"otherPossibleNames": [],
				"logicalName": "ELA/L_CONSTRUCTED_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "elalSelectedResponseOrTechnologyEnhancedItems",
				"otherPossibleNames": [],
				"logicalName": "ELA/L_SELECTED_RESPONSE_OR_TECHNOLOGY_ENHANCED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "mathematicsResponse",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "monitorTestResponse",
				"otherPossibleNames": [],
				"logicalName": "MONITOR_TEST_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "wordPrediction",
				"otherPossibleNames": [],
				"logicalName": "WORD_PREDICTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "administrationDirectionsClarifiedInStudentsNativeLanguage",
				"otherPossibleNames": [],
				"logicalName": "GENERAL_ADMINISTRATION_DIRECTIONS_CLARIFIED_IN_STUDENT’S_NATIVE_LANGUAGE_(BY_TEST_ADMINISTRATOR)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "administrationDirectionsReadAloudInStudentsNativeLanguage",
				"otherPossibleNames": [],
				"logicalName": "GENERAL_ADMINISTRATION_DIRECTIONS_READ_ALOUD_AND_REPEATED_AS_NEEDED_IN_STUDENT’S_NATIVE_LANGUAGE_(BY_TEST_ADMINISTRATOR)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "mathematicsResponseEl",
				"otherPossibleNames": [],
				"logicalName": "MATHEMATICS_RESPONSE_–_EL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "translationOfTheMathematicsAssessmentInTextToSpeech",
				"otherPossibleNames": [],
				"logicalName": "TRANSLATION_OF_THE_MATHEMATICS_ASSESSMENT_IN_TEXT-TO-SPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 3,
				"expectedValues": ["SPA", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "translationOfTheMathematicsAssessmentOnline",
				"otherPossibleNames": [],
				"logicalName": "TRANSLATION_OF_THE_MATHEMATICS_ASSESSMENT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 3,
				"expectedValues": ["SPA", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "wordToWordDictionary",
				"otherPossibleNames": [],
				"logicalName": "WORD_TO_WORD_DICTIONARY_(ENGLISH/NATIVE_LANGUAGE)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "extendedTime",
				"otherPossibleNames": [],
				"logicalName": "EXTENDED_TIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "alternateRepresentationPaperTest",
				"otherPossibleNames": [],
				"logicalName": "ALTERNATE_REPRESENTATION_–_PAPER_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "translationOfTheMathematicsAssessmentInPaper",
				"otherPossibleNames": [],
				"logicalName": "TRANSLATION_OF_THE_MATHEMATICS_ASSESSMENT_IN_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 3,
				"expectedValues": ["SPA", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "humanReaderOrHumanSigner",
				"otherPossibleNames": [],
				"logicalName": "HUMAN_READER_OR_HUMAN_SIGNER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "largePrint",
				"otherPossibleNames": [],
				"logicalName": "LARGE_PRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "brailleWithTactileGraphics",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE_WITH_TACTILE_GRAPHICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData2",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData3",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData4",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData5",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData6",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData7",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "optionalStateData8",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_STATE_DATA_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "testCode",
				"otherPossibleNames": [],
				"logicalName": "TEST_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "assessmentGrade",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subject",
				"otherPossibleNames": [],
				"logicalName": "SUBJECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaFormId",
				"otherPossibleNames": [],
				"logicalName": "PBA_FORM_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyFormId",
				"otherPossibleNames": [],
				"logicalName": "EOY_FORM_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaStudentTestUuid",
				"otherPossibleNames": [],
				"logicalName": "PBA_STUDENT_TEST_UUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyStudentTestUuid",
				"otherPossibleNames": [],
				"logicalName": "EOY_STUDENT_TEST_UUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeScoreRecordUuid",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_SCORE_RECORD_UUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTotalTestItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_TOTAL_TEST_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTestAttemptednessFlag",
				"otherPossibleNames": [],
				"logicalName": "PBA_TEST_ATTEMPTEDNESS_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTotalTestItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_TOTAL_TEST_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTestAttemptednessFlag",
				"otherPossibleNames": [],
				"logicalName": "EOY_TEST_ATTEMPTEDNESS_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaTotalTestItemsAttempted",
				"otherPossibleNames": [],
				"logicalName": "PBA_TOTAL_TEST_ITEMS_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit1TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_1_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit1NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_1_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit2TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_2_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit2NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_2_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit3TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_3_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit3NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_3_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit4TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_4_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit4NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT__4_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit5TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT_5_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaUnit5NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "PBA_UNIT__5_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyTotalTestItemsAttempted",
				"otherPossibleNames": [],
				"logicalName": "EOY_TOTAL_TEST_ITEMS_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit1TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_1_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit1NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_1_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit2TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_2_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit2NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_2_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit3TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_3_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit3NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_3_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit4TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_4_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit4NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT__4_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit5TotalNumberOfItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT_5_TOTAL_NUMBER_OF_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyUnit5NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "EOY_UNIT__5_NUMBER_OF_ATTEMPTED_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaNotTestedReason",
				"otherPossibleNames": [],
				"logicalName": "PBA_NOT_TESTED_REASON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyNotTestedReason",
				"otherPossibleNames": [],
				"logicalName": "EOY_NOT_TESTED_REASON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "pbaVoidPbaEoyScoreReason",
				"otherPossibleNames": [],
				"logicalName": "PBA_VOID_PBA/EOY_SCORE_REASON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "eoyVoidPbaEoyScoreReason",
				"otherPossibleNames": [],
				"logicalName": "EOY_VOID_PBA/EOY_SCORE_REASON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeCsem",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_CSEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativePerformanceLevel",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeReadingScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeReadingCsem",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_READING_CSEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeWritingScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_WRITING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "summativeWritingCsem",
				"otherPossibleNames": [],
				"logicalName": "SUMMATIVE_WRITING_CSEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subclaim1Category",
				"otherPossibleNames": [],
				"logicalName": "SUBCLAIM_1_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subclaim2Category",
				"otherPossibleNames": [],
				"logicalName": "SUBCLAIM_2_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subclaim3Category",
				"otherPossibleNames": [],
				"logicalName": "SUBCLAIM_3_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subclaim4Category",
				"otherPossibleNames": [],
				"logicalName": "SUBCLAIM_4_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subclaim5Category",
				"otherPossibleNames": [],
				"logicalName": "SUBCLAIM_5_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "subclaim6Category",
				"otherPossibleNames": [],
				"logicalName": "SUBCLAIM_6_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": ["csv"]
}