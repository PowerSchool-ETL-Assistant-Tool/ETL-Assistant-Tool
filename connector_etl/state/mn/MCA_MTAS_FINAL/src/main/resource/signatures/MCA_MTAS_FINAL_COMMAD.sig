{
	"encoding": "UTF-8",
	"format": {
        "@type": "Delimited",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "hasHeader": true,
        "formatName": "MCA_MTAS_FINAL_COMMAD",
		"naturalKey": ["MARSS_STATE_REPORTING_NUMBER", "TEST_DATE", "TEST_SUBJECT", "LOCAL_STUDENT_ID"],
		"fields": [{
				"physicalName": "TESTNAME",
				"otherPossibleNames": [],
				"logicalName": "TEST_NAME",
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
				"physicalName": "TESTDATE",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": "yyyyMMdd",
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
				"physicalName": "TESTSUBJECT",
				"otherPossibleNames": [],
				"logicalName": "TEST_SUBJECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 500,
				"expectedValues": ["M", "R", "S", "C"],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 4
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TESTFORM",
				"otherPossibleNames": [],
				"logicalName": "TEST_FORM",
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
				"physicalName": "FORMNUMBER",
				"otherPossibleNames": [],
				"logicalName": "FORM_NUMBER",
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
				"physicalName": "TESTINGDISTRICTNUMBER",
				"otherPossibleNames": [],
				"logicalName": "TESTING_DISTRICT_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TESTINGDISTRICTTYPE",
				"otherPossibleNames": [],
				"logicalName": "TESTING_DISTRICT_TYPE",
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
				"physicalName": "TESTINGSCHOOLNUMBER",
				"otherPossibleNames": [],
				"logicalName": "TESTING_SCHOOL_NUMBER",
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
				"physicalName": "FILLERA",
				"otherPossibleNames": [],
				"logicalName": "FILLER_A",
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
				"physicalName": "MARSSSTATEREPORTINGNUMBER",
				"otherPossibleNames": [],
				"logicalName": "MARSS_STATE_REPORTING_NUMBER",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LOCALSTUDENTID",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENTLASTNAME",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STUDENTFIRSTNAME",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
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
				"physicalName": "STUDENTMIDDLENAME",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DATEOFBIRTH",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "yyyyMMdd",
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
				"physicalName": "GENDER",
				"otherPossibleNames": [],
				"logicalName": "GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLERB",
				"otherPossibleNames": [],
				"logicalName": "FILLER_B",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ENGLISHLEARNERFLAG",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LEARNER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPECIALEDUCATIONFLAG",
				"otherPossibleNames": [],
				"logicalName": "SPECIAL_EDUCATION_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FRPELIGIBLEFLAG",
				"otherPossibleNames": [],
				"logicalName": "FRP_ELIGIBLE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OCTOBER1SCHOOLFLAG",
				"otherPossibleNames": [],
				"logicalName": "OCTOBER_1_SCHOOL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OCTOBER1DISTRICTFLAG",
				"otherPossibleNames": [],
				"logicalName": "OCTOBER_1_DISTRICT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MIGRANTFLAG",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PRIORELACCOUNTABILITYFLAG",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_EL_ACCOUNTABILITY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PRIORSPEACCOUNTABILITYFLAG",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_SPE_ACCOUNTABILITY_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SLIFEFLAG",
				"otherPossibleNames": [],
				"logicalName": "S_LIFE_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HOMELESSFLAG",
				"otherPossibleNames": [],
				"logicalName": "HOMELESS_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FOREIGNEXCHANGESTUDENTFLAG",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_EXCHANGE_STUDENT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RECENTLYARRIVEDENGLISHLEARNERFLAG",
				"otherPossibleNames": [],
				"logicalName": "RECENTLY_ARRIVED_ENGLISH_LEARNER_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ACTIVEDUTYPARENTFLAG",
				"otherPossibleNames": [],
				"logicalName": "ACTIVE_DUTY_PARENT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 500,
				"expectedValues": ["", "Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "F14",
				"otherPossibleNames": [],
				"logicalName": "F14",
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
				"physicalName": "F15",
				"otherPossibleNames": [],
				"logicalName": "F15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "F16",
				"otherPossibleNames": [],
				"logicalName": "F16",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ETHNICCODE",
				"otherPossibleNames": [],
				"logicalName": "ETHNIC_CODE",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PRIMARYDISABILITYCODE",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LANGUAGECODE",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ADM97",
				"otherPossibleNames": [],
				"logicalName": "ADM97",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 1.0
			},
			{
				"physicalName": "C5",
				"otherPossibleNames": [],
				"logicalName": "C5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C6",
				"otherPossibleNames": [],
				"logicalName": "C6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C7",
				"otherPossibleNames": [],
				"logicalName": "C7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C8",
				"otherPossibleNames": [],
				"logicalName": "C8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C9",
				"otherPossibleNames": [],
				"logicalName": "C9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C10",
				"otherPossibleNames": [],
				"logicalName": "C10",
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
				"physicalName": "PRIORYEARASSESSMENTANDGRADE",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_YEAR_ASSESSMENT_AND_GRADE",
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
				"physicalName": "PRIORYEARSCOREORTESTCODE",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_YEAR_SCORE_OR_TEST_CODE",
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
				"physicalName": "PRIORYEARACHIEVEMENTLEVEL",
				"otherPossibleNames": [],
				"logicalName": "PRIOR_YEAR_ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DOCUMENTCODES",
				"otherPossibleNames": [],
				"logicalName": "DOCUMENT_CODES",
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
				"physicalName": "ACCOMMODATIONLINGUISTICSUPPORTCODES",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATION_LINGUISTIC_SUPPORT_CODES",
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
				"physicalName": "FILLERD",
				"otherPossibleNames": [],
				"logicalName": "FILLER_D",
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
				"physicalName": "TESTCODE",
				"otherPossibleNames": [],
				"logicalName": "TEST_CODE",
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
				"physicalName": "ACHIEVEMENTLEVEL",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL",
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
				"physicalName": "SCORE1LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_1_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE1",
				"otherPossibleNames": [],
				"logicalName": "SCORE_1",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE1CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_1_CHARACTERISTIC",
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
				"physicalName": "SCORE1RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_1_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE2LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_2_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE2",
				"otherPossibleNames": [],
				"logicalName": "SCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE2CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_2_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE2RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_2_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE3LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_3_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE3",
				"otherPossibleNames": [],
				"logicalName": "SCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE3CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_3_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE3RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_3_RANGE",
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
				"physicalName": "SCORE4LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_4_LABEL",
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
				"physicalName": "SCORE4",
				"otherPossibleNames": [],
				"logicalName": "SCORE_4",
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
				"physicalName": "SCORE4CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_4_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE4RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_4_RANGE",
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
				"physicalName": "SCORE5LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_5_LABEL",
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
				"physicalName": "SCORE5",
				"otherPossibleNames": [],
				"logicalName": "SCORE_5",
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
				"physicalName": "SCORE5CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_5_CHARACTERISTIC",
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
				"physicalName": "SCORE5RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_5_RANGE",
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
				"physicalName": "SCORE6LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_6_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE6",
				"otherPossibleNames": [],
				"logicalName": "SCORE_6",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE6CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_6_CHARACHTERISTIC",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE6RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_6_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE7LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_7_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE7",
				"otherPossibleNames": [],
				"logicalName": "SCORE_7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE7CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_7_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE7RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_7_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE8LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_8_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE8",
				"otherPossibleNames": [],
				"logicalName": "SCORE_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE8CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_8_CHARACTERISTIC",
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
				"physicalName": "SCORE8RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_8_RANGE",
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
				"physicalName": "SCORE9LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_9_LABEL",
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
				"physicalName": "SCORE9",
				"otherPossibleNames": [],
				"logicalName": "SCORE_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE9CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_9_CHARACTERISTIC",
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
				"physicalName": "SCORE9RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_9_RANGE",
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
				"physicalName": "SCORE10LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_10_LABEL",
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
				"physicalName": "SCORE10",
				"otherPossibleNames": [],
				"logicalName": "SCORE_10",
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
				"physicalName": "SCORE10CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_10_CHARACTERISTIC",
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
				"physicalName": "SCORE10RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_10_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE11LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_11_LABEL",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE11",
				"otherPossibleNames": [],
				"logicalName": "SCORE_11",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE11CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_11_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE11RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_11_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE12LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_12_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE12",
				"otherPossibleNames": [],
				"logicalName": "SCORE_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE12CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_12_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE12RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_12_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE13LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_13_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE13",
				"otherPossibleNames": [],
				"logicalName": "SCORE_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE13CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_13_CHARACTERISTIC",
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
				"physicalName": "SCORE13RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_13_RANGE",
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
				"physicalName": "SCORE14LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_14_LABEL",
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
				"physicalName": "SCORE14",
				"otherPossibleNames": [],
				"logicalName": "SCORE_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE14CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_14_CHARACTERISTIC",
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
				"physicalName": "SCORE14RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_14_RANGE",
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
				"physicalName": "SCORE15LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_15_LABEL",
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
				"physicalName": "SCORE15",
				"otherPossibleNames": [],
				"logicalName": "SCORE_15",
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
				"physicalName": "SCORE15CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_15_CHARACTERISTIC",
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
				"physicalName": "SCORE15RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_15_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE16LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_16_LABEL",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE16",
				"otherPossibleNames": [],
				"logicalName": "SCORE_16",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE16CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_16_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE16RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_16_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE17LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_17_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE17",
				"otherPossibleNames": [],
				"logicalName": "SCORE_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE17CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_17_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE17RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_17_RANGE",
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
				"physicalName": "SCORE18LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_18_LABEL",
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
				"physicalName": "SCORE18",
				"otherPossibleNames": [],
				"logicalName": "SCORE_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE18CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_18_CHARACTERISTIC",
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
				"physicalName": "SCORE18RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_18_RANGE",
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
				"physicalName": "SCORE19LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_19_LABEL",
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
				"physicalName": "SCORE19",
				"otherPossibleNames": [],
				"logicalName": "SCORE_19",
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
				"physicalName": "SCORE19CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_19_CHARACTERISTIC",
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
				"physicalName": "SCORE19RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_19_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE20LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_20_LABEL",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE20",
				"otherPossibleNames": [],
				"logicalName": "SCORE_20",
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
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE20CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_20_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE20RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_20_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE21LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_21_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE21",
				"otherPossibleNames": [],
				"logicalName": "SCORE_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE21CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_21_CHARACTERISTIC",
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
			},
			{
				"physicalName": "SCORE21RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_21_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE22LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_22_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE22",
				"otherPossibleNames": [],
				"logicalName": "SCORE_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE22CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_22_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE22RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_22_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE23LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_23_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE23",
				"otherPossibleNames": [],
				"logicalName": "SCORE_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE23CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_23_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE23RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_23_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE24LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_24_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE24",
				"otherPossibleNames": [],
				"logicalName": "SCORE_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE24CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_24_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE24RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_24_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE25LABEL",
				"otherPossibleNames": [],
				"logicalName": "SCORE_25_LABEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE25",
				"otherPossibleNames": [],
				"logicalName": "SCORE_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE25CHARACTERISTIC",
				"otherPossibleNames": [],
				"logicalName": "SCORE_25_CHARACTERISTIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SCORE25RANGE",
				"otherPossibleNames": [],
				"logicalName": "SCORE_25_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MTASPASSAGEACCESSALL",
				"otherPossibleNames": [],
				"logicalName": "MTAS_PASSAGE_ACCESS_ALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MTASOPERATIONALPASSAGE1",
				"otherPossibleNames": [],
				"logicalName": "MTAS_OPERATIONAL_PASSAGE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 500,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MTASOPERATIONALPASSAGE2",
				"otherPossibleNames": [],
				"logicalName": "MTAS_OPERATIONAL_PASSAGE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 500,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MTASOPERATIONALPASSAGE3",
				"otherPossibleNames": [],
				"logicalName": "MTAS_OPERATIONAL_PASSAGE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 500,
				"expectedValues": ["", "1", "2", "3"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEXILEQUANTILESCORE",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_QUANTILE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEXILEQUANTILESCORERANGE",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_QUANTILE_SCORE_RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEARNINGLOCATOR",
				"otherPossibleNames": [],
				"logicalName": "LEARNING_LOCATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UIN",
				"otherPossibleNames": [],
				"logicalName": "UIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
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