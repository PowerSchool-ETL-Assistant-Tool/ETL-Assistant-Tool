{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "CMAS_MA_ELA_COMMA_2021",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["ATTEMPT_CREATE_DATE", "STUDENT_TEST_UUID", "STATE_STUDENT_IDENTIFIER", "SUBJECT"],
		"fields": [{
				"physicalName": "StateAbbreviation",
				"otherPossibleNames": [],
				"logicalName": "STATEABBREVIATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": ["CO"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestingDistrictCode",
				"otherPossibleNames": [],
				"logicalName": "TESTINGDISTRICTCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestingSchoolCode",
				"otherPossibleNames": [],
				"logicalName": "TESTINGSCHOOLCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ResponsibleDistrictCode",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLEDISTRICTCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ResponsibleSchoolCode",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLESCHOOLCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StateStudentIdentifier",
				"otherPossibleNames": [],
				"logicalName": "STATE_STUDENT_IDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LocalStudentIdentifier",
				"otherPossibleNames": [],
				"logicalName": "LOCALSTUDENTIDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PearsonStudentIdentifier",
				"otherPossibleNames": [],
				"logicalName": "PEARSONSTUDENTIDENTIFIER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LastOrSurname",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 35,
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
					"columnNum": 10
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MiddleName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Birthdate",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_BIRTHDATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Sex",
				"otherPossibleNames": [],
				"logicalName": "SEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": ["F", "M"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DateFirstEnrolledInUSSchool",
				"otherPossibleNames": [],
				"logicalName": "DATEFIRSTENROLLEDINUSSCHOOL",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "GradeLevelWhenAssessed",
				"otherPossibleNames": [],
				"logicalName": "GRADE_LEVEL_WHEN_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 2,
				"expectedValues": ["03", "04", "05", "06", "07", "08"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "HispanicOrLatinoEthnicity",
				"otherPossibleNames": [],
				"logicalName": "HISPANICORLATINOETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AmericanIndianOrAlaskaNative",
				"otherPossibleNames": [],
				"logicalName": "AMERICANINDIANORALASKANATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BlackOrAfricanAmerican",
				"otherPossibleNames": [],
				"logicalName": "BLACKORAFRICANAMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NativeHawaiianOrOtherPacificIslander",
				"otherPossibleNames": [],
				"logicalName": "NATIVEHAWAIIANOROTHERPACIFICISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "RECEIVEPAPERREPORT",
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
				"scale": null
			},
			{
				"physicalName": "GiftedandTalented",
				"otherPossibleNames": [],
				"logicalName": "GIFTEDANDTALENTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MigrantStatus",
				"otherPossibleNames": [],
				"logicalName": "MIGRANTSTATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EconomicDisadvantageStatus",
				"otherPossibleNames": [],
				"logicalName": "ECONOMICDISADVANTAGESTATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentwithDisabilities",
				"otherPossibleNames": [],
				"logicalName": "STUDENTWITHDISABILITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 3,
				"expectedValues": ["IEP", "504", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PrimaryDisabilityType",
				"otherPossibleNames": [],
				"logicalName": "PRIMARYDISABILITYTYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 3,
				"expectedValues": ["AUT", "DB", "DD", "EMN", "HI", "ID", "MD", "NC", "OI", "OHI", "SLD", "SLI", "TBI", "VI", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Homeless",
				"otherPossibleNames": [],
				"logicalName": "HOMELESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 20,
				"expectedValues": ["0", "3", "4", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "LanguageBackground",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGEBACKGROUND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LanguageProficiency",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGEPROFICIENCY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 20,
				"expectedValues": ["0", "1", "2", "4", "5", "6", "7", "8", "9", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LanguageInstructionProgram",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGEINSTRUCTIONPROGRAM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 20,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "97", "98", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Title1",
				"otherPossibleNames": [],
				"logicalName": "TITLE1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 20,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ContinuousInDistrict",
				"otherPossibleNames": [],
				"logicalName": "CONTINUOUSINDISTRICT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 20,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ContinuousInSchool",
				"otherPossibleNames": [],
				"logicalName": "CONTINUOUSINSCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 20,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Expelled",
				"otherPossibleNames": [],
				"logicalName": "EXPELLED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 20,
				"expectedValues": ["0", "1", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "AccommodationType",
				"otherPossibleNames": [],
				"logicalName": "ACCOMODATIONTYPE",
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
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 20,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 500,
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
				"physicalName": "SessionName",
				"otherPossibleNames": [],
				"logicalName": "SESSION NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ClassName",
				"otherPossibleNames": [],
				"logicalName": "CLASSNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 45,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCode",
				"otherPossibleNames": [],
				"logicalName": "TESTCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 5,
				"expectedValues": ["MAT03", "MAT04", "MAT05", "MAT06", "MAT07", "MAT08", "ALG01", "GEO01", "MAT1I", "MAT2I", "ELA03", "ELA04", "ELA05", "ELA06", "ELA07", "ELA08", "SLA03", "SLA04"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FREQUENTBREAKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ColorContrast",
				"otherPossibleNames": [],
				"logicalName": "COLORCONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "EnlargedPointer",
				"otherPossibleNames": [],
				"logicalName": "ENLARGEDPOINTER",
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
				"physicalName": "ZoomPercentage",
				"otherPossibleNames": [],
				"logicalName": "ZOOMPERCENTAGE",
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
				"physicalName": "AssistiveTechnologyMathELAOnly",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVETECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "VisualAccommodations",
				"otherPossibleNames": [],
				"logicalName": "VISUALACCOMODATIONS",
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
				"physicalName": "CalculationDeviceAndOrMathChartsAndOrCounters",
				"otherPossibleNames": [],
				"logicalName": "CALCULATIONDEVICEANDMATHEMATICSTOOLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": ["01", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ResponseAccommodationforELACSLAConstructedResponse",
				"otherPossibleNames": [],
				"logicalName": "SCRIBEFORELACONSTRUCTEDRESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": ["C", "T", "B", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ResponseAccommodationforELACSLASelectedResponse",
				"otherPossibleNames": [],
				"logicalName": "SCRIBEFORELASELECTEDRESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ResponseAccommodationforMathScienceandSocialStudies",
				"otherPossibleNames": [],
				"logicalName": "SCRIBEFORMATHEMATICSSCIENCEANDSOCIALSTUDIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "WordPrediction",
				"otherPossibleNames": [],
				"logicalName": "WORDPREDICTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "AdministrationDirectionsReadAloudClarifiedinStudentsNativeLanguage",
				"otherPossibleNames": [],
				"logicalName": "ADMINISTRATIONDIRECTIONSCLARIFIEDINSTUDENTSNATIVELANGUAGE",
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
				"scale": null
			},
			{
				"physicalName": "NonEnglishResponse",
				"otherPossibleNames": [],
				"logicalName": "NONENGLISHRESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 3,
				"expectedValues": ["SPA", "HT", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpanishTransadaptationoftheAssessmentTTSnotincluded",
				"otherPossibleNames": [],
				"logicalName": "SPANISHTRANSADAPTATIONOFTHEASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "WordtoWordDictionaryEnglishNativeLanguage",
				"otherPossibleNames": [],
				"logicalName": "WORDTOWORDDICTIONARYENGLISHNATIVELANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 3,
				"expectedValues": ["SPA", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AuditoryPresentationTexttoSpeechEnglishandSpanish",
				"otherPossibleNames": [],
				"logicalName": "TEXTTOSPEECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": ["Y", "", "01", "02"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AuditorySignedPresentationScript",
				"otherPossibleNames": [],
				"logicalName": "AUDITORYPRESENTATIONORALSCRIPTORSIGNER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "UniqueAccommodation",
				"otherPossibleNames": [],
				"logicalName": "UNIQUEACCOMMODATION",
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
				"scale": null
			},
			{
				"physicalName": "EmergencyAccommodation",
				"otherPossibleNames": [],
				"logicalName": "EMERGENCYACCOMMODATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": ["01", "99", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ExtendedTime",
				"otherPossibleNames": [],
				"logicalName": "EXTENDEDTIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentTestUUID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_TEST_UUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FormID",
				"otherPossibleNames": [],
				"logicalName": "ONLINEFORMID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStatus",
				"otherPossibleNames": [],
				"logicalName": "TESTSTATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 7,
				"expectedValues": ["Assign", "Attempt"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TotalTestItems",
				"otherPossibleNames": [],
				"logicalName": "TOTALTESTITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestAttemptednessFlag",
				"otherPossibleNames": [],
				"logicalName": "TESTATTEMPTEDNESSFLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TotalTestItemsAttempted",
				"otherPossibleNames": [],
				"logicalName": "TOTALTESTITEMSATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "StudentUnit1TestUUID",
				"otherPossibleNames": [],
				"logicalName": "STUDENTUNIT1TESTUUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unit1FormID",
				"otherPossibleNames": [],
				"logicalName": "UNIT1FORMID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unit1TotalTestItems",
				"otherPossibleNames": [],
				"logicalName": "UNIT1TOTALTESTITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Unit1NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "UNIT1NUMBEROFATTEMPTEDITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "StudentUnit2TestUUID",
				"otherPossibleNames": [],
				"logicalName": "STUDENTUNIT2TESTUUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unit2FormID",
				"otherPossibleNames": [],
				"logicalName": "UNIT2FORMID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unit2TotalTestItems",
				"otherPossibleNames": [],
				"logicalName": "UNIT2TOTALTESTITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Unit2NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "UNIT2NUMBEROFATTEMPTEDITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "StudentUnit3TestUUID",
				"otherPossibleNames": [],
				"logicalName": "STUDENTUNIT3TESTUUID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unit3FormID",
				"otherPossibleNames": [],
				"logicalName": "UNIT3FORMID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unit3TotalTestItems",
				"otherPossibleNames": [],
				"logicalName": "UNIT3TOTALTESTITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Unit3NumberOfAttemptedItems",
				"otherPossibleNames": [],
				"logicalName": "UNIT3NUMBEROFATTEMPTEDITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "NotTestedCode",
				"otherPossibleNames": [],
				"logicalName": "NOTTESTEDCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NotTestedReason",
				"otherPossibleNames": [],
				"logicalName": "NOTTESTEDREASON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "VoidScoreCode",
				"otherPossibleNames": [],
				"logicalName": "VOIDSCORECODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "VoidScoreReason",
				"otherPossibleNames": [],
				"logicalName": "VOIDSCOREREASON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CalculatedInvalidation",
				"otherPossibleNames": [],
				"logicalName": "CALCULATEDINVALIDATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReportSuppressionCode",
				"otherPossibleNames": [],
				"logicalName": "REPORTSUPPRESSIONCODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 2,
				"expectedValues": ["01", "03", "06", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ReportSuppressionAction",
				"otherPossibleNames": [],
				"logicalName": "REPORTSUPPRESSIONACTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Unit1TestStartDateTime",
				"otherPossibleNames": [],
				"logicalName": "UNIT1ONLINETESTSTARTDATETIME",
				"formatMask": "yyyy-MM-ddTHH:mm:ss",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "Unit1TestEndDateTime",
				"otherPossibleNames": [],
				"logicalName": "UNIT1ONLINETESTENDDATETIME",
				"formatMask": "yyyy-MM-ddTHH:mm:ss",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "Unit2TestStartDateTime",
				"otherPossibleNames": [],
				"logicalName": "UNIT2ONLINETESTSTARTDATETIME",
				"formatMask": "yyyy-MM-ddTHH:mm:ss",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "Unit2TestEndDateTime",
				"otherPossibleNames": [],
				"logicalName": "UNIT2ONLINETESTENDDATETIME",
				"formatMask": "yyyy-MM-ddTHH:mm:ss",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "Unit3TestStartDateTime",
				"otherPossibleNames": [],
				"logicalName": "UNIT3ONLINETESTSTARTDATETIME",
				"formatMask": "yyyy-MM-ddTHH:mm:ss",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "Unit3TestEndDateTime",
				"otherPossibleNames": [],
				"logicalName": "UNIT3ONLINETESTENDDATETIME",
				"formatMask": "yyyy-MM-ddTHH:mm:ss",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			},
			{
				"physicalName": "AssessmentYear",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENTYEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
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
					"columnNum": 96
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FederalRaceEthnicity",
				"otherPossibleNames": [],
				"logicalName": "FEDERALRACEETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestingDistrictName",
				"otherPossibleNames": [],
				"logicalName": "TESTINGDISTRICTNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestingSchoolName",
				"otherPossibleNames": [],
				"logicalName": "TESTINGSCHOOLNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ResponsibleDistrictName",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLEDISTRICTNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ResponsibleSchoolName",
				"otherPossibleNames": [],
				"logicalName": "RESPONSIBLESCHOOLNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 60,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 3,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 3,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 3,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 3,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SS",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_OVERALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SSCSEM",
				"otherPossibleNames": [],
				"logicalName": "CSEM_OVERALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PerfLVL",
				"otherPossibleNames": [],
				"logicalName": "PERF_LVL_OVERALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "PercentileRank",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_RANK_OVERALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestReadingScaleScore",
				"otherPossibleNames": [],
				"logicalName": "TEST_READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestReadingSSCSEM",
				"otherPossibleNames": [],
				"logicalName": "TEST_READING_CSEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestWritingRawScore",
				"otherPossibleNames": [],
				"logicalName": "TEST_WRITING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestWritingPointsPossible",
				"otherPossibleNames": [],
				"logicalName": "TEST_WRITING_PTS_POSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "TestWritingPercentEarned",
				"otherPossibleNames": [],
				"logicalName": "TEST_WRITING_PCT_CORR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim1RawScore",
				"otherPossibleNames": [],
				"logicalName": "STD1_MA_ELA_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim1PtsPoss",
				"otherPossibleNames": [],
				"logicalName": "STD1_MA_ELA_PTS_POSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim1PctEarned",
				"otherPossibleNames": [],
				"logicalName": "STD1_MA_ELA_PCT_CORR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim2RawScore",
				"otherPossibleNames": [],
				"logicalName": "STD2_MA_ELA_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim2PtsPoss",
				"otherPossibleNames": [],
				"logicalName": "STD2_MA_ELA_PTS_POSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim2PctEarned",
				"otherPossibleNames": [],
				"logicalName": "STD2_MA_ELA_PCT_CORR",
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
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim3RawScore",
				"otherPossibleNames": [],
				"logicalName": "STD3_MA_ELA_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim3PtsPoss",
				"otherPossibleNames": [],
				"logicalName": "STD3_MA_ELA_PTS_POSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim3PctEarned",
				"otherPossibleNames": [],
				"logicalName": "STD3_MA_ELA_PCT_CORR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim4RawScore",
				"otherPossibleNames": [],
				"logicalName": "STD4_MA_ELA_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim4PtsPoss",
				"otherPossibleNames": [],
				"logicalName": "STD4_MA_ELA_PTS_POSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim4PctEarned",
				"otherPossibleNames": [],
				"logicalName": "STD4_MA_ELA_PCT_CORR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Subclaim5RawScore",
				"otherPossibleNames": [],
				"logicalName": "STD5_MA_ELA_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim5PtsPoss",
				"otherPossibleNames": [],
				"logicalName": "STD5_MA_ELA_PTS_POSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Subclaim5PctEarned",
				"otherPossibleNames": [],
				"logicalName": "STD5_MA_ELA_PCT_CORR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
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
				"physicalName": "ScItemResponse",
				"otherPossibleNames": [],
				"logicalName": "SCITEMRESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 200,
				"expectedValues": ["0", "1", "2", "3", "4", "5", "6", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CoreFormID",
				"otherPossibleNames": [],
				"logicalName": "CORE_FORM_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain1Descriptor1PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_1_CLUSTER_COS_1_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain1Descriptor2PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_1_CLUSTER_COS_2_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain1Descriptor3PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_1_CLUSTER_COS_3_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain1Descriptor4PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_1_CLUSTER_COS_4_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain2Descriptor1PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_2_CLUSTER_COS_1_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain2Descriptor2PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_2_CLUSTER_COS_2_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain2Descriptor3PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_2_CLUSTER_COS_3_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain2Descriptor4PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_2_CLUSTER_COS_4_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain3Descriptor1PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_3_CLUSTER_COS_1_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain3Descriptor2PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_3_CLUSTER_COS_2_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain3Descriptor3PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_3_CLUSTER_COS_3_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain3Descriptor4PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_3_CLUSTER_COS_4_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain4Descriptor1PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_4_CLUSTER_COS_1_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain4Descriptor2PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_4_CLUSTER_COS_2_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain4Descriptor3PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_4_CLUSTER_COS_3_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain4Descriptor4PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_4_CLUSTER_COS_4_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain4Descriptor5PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_4_CLUSTER_COS_5_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain4Descriptor6PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_4_CLUSTER_COS_6_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain5Descriptor1PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_5_CLUSTER_COS_1_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain5Descriptor2PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_5_CLUSTER_COS_2_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain5Descriptor3PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_5_CLUSTER_COS_3_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain5Descriptor4PercentEarned",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_5_CLUSTER_COS_4_STUDENT_PERCENT_EARNED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 3,
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
				"physicalName": "PCRTraitConditionCodeString",
				"otherPossibleNames": [],
				"logicalName": "PCRTRAITCONDITIONCODESTRING",
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
			},
			{
				"physicalName": "Filler",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
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