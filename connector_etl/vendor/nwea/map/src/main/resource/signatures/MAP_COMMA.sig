{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "MAP_COMMA",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["TERMNAME", "STUDENT_LOCAL_ID","MEASUREMENTSCALE","DISCIPLINE"],
		"fields": [{
				"physicalName": "TermName",
				"otherPossibleNames": [],
				"logicalName": "TERMNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 1,
					"columnNum": 1
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "StudentID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LOCAL_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 2,
					"offsetEnd": 2,
					"columnNum": 2
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SchoolName",
				"otherPossibleNames": ["INSTITUTIONNAME"],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 3,
					"columnNum": 3
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MeasurementScale",
				"otherPossibleNames": [],
				"logicalName": "MEASUREMENTSCALE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 4,
					"offsetEnd": 4,
					"columnNum": 4
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Discipline",
				"otherPossibleNames": [],
				"logicalName": "DISCIPLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 5,
					"offsetEnd": 5,
					"columnNum": 5
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "GrowthMeasureYN",
				"otherPossibleNames": [],
				"logicalName": "GROWTHMEASUREYN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 6,
					"offsetEnd": 6,
					"columnNum": 6
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NormsReferenceData",
				"otherPossibleNames": [],
				"logicalName": "NORMSREFERENCEDATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 7,
					"columnNum": 7
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WISelectedAYFall",
				"otherPossibleNames": [],
				"logicalName": "WISELECTEDAYFALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 8,
					"offsetEnd": 8,
					"columnNum": 8
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WISelectedAYWinter",
				"otherPossibleNames": [],
				"logicalName": "WISELECTEDAYWINTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 9,
					"offsetEnd": 9,
					"columnNum": 9
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WISelectedAYSpring",
				"otherPossibleNames": [],
				"logicalName": "WISELECTEDAYSPRING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 10,
					"offsetEnd": 10,
					"columnNum": 10
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WIPreviousAYFall",
				"otherPossibleNames": [],
				"logicalName": "WIPREVIOUSAYFALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 11,
					"offsetEnd": 11,
					"columnNum": 11
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WIPreviousAYWinter",
				"otherPossibleNames": [],
				"logicalName": "WIPREVIOUSAYWINTER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 12,
					"offsetEnd": 12,
					"columnNum": 12
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WIPreviousAYSpring",
				"otherPossibleNames": [],
				"logicalName": "WIPREVIOUSAYSPRING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 13,
					"offsetEnd": 13,
					"columnNum": 13
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestType",
				"otherPossibleNames": [],
				"logicalName": "TESTTYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 14,
					"offsetEnd": 14,
					"columnNum": 14
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestName",
				"otherPossibleNames": [],
				"logicalName": "TESTNAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 15,
					"offsetEnd": 15,
					"columnNum": 15
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestID",
				"otherPossibleNames": [],
				"logicalName": "TESTID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 16,
					"offsetEnd": 16,
					"columnNum": 16
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestStartDate",
				"otherPossibleNames": [],
				"logicalName": "TEST_ADMIN_DATE",
				"formatMask": "MM/DD/YYYY",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 17,
					"offsetEnd": 17,
					"columnNum": 17
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestDurationMinutes",
				"otherPossibleNames": [],
				"logicalName": "TESTDURATIONMINUTES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 18,
					"offsetEnd": 18,
					"columnNum": 18
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestRITScore",
				"otherPossibleNames": [],
				"logicalName": "TESTRITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 19,
					"offsetEnd": 19,
					"columnNum": 19
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestStandardError",
				"otherPossibleNames": [],
				"logicalName": "TESTSTANDARDERROR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 20,
					"offsetEnd": 20,
					"columnNum": 20
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestPercentile",
				"otherPossibleNames": [],
				"logicalName": "TESTPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 21,
					"offsetEnd": 21,
					"columnNum": 21
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToFallProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOFALLPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 22,
					"offsetEnd": 22,
					"columnNum": 22
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToFallObservedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOFALLOBSERVEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 23,
					"offsetEnd": 23,
					"columnNum": 23
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToFallObservedGrowthSE",
				"otherPossibleNames": [],
				"logicalName": "FALLTOFALLOBSERVEDGROWTHSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 24,
					"offsetEnd": 24,
					"columnNum": 24
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToFallMetProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOFALLMETPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 25,
					"offsetEnd": 25,
					"columnNum": 25
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToFallConditionalGrowthIndex",
				"otherPossibleNames": [],
				"logicalName": "FALLTOFALLCONDITIONALGROWTHINDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 26,
					"offsetEnd": 26,
					"columnNum": 26
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToFallConditionalGrowthPercentile",
				"otherPossibleNames": [],
				"logicalName": "FALLTOFALLCONDITIONALGROWTHPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 27,
					"offsetEnd": 27,
					"columnNum": 27
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToWinterProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOWINTERPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 28,
					"offsetEnd": 28,
					"columnNum": 28
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToWinterObservedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOWINTEROBSERVEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 29,
					"offsetEnd": 29,
					"columnNum": 29
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToWinterObservedGrowthSE",
				"otherPossibleNames": [],
				"logicalName": "FALLTOWINTEROBSERVEDGROWTHSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 30,
					"offsetEnd": 30,
					"columnNum": 30
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToWinterMetProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOWINTERMETPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 31,
					"offsetEnd": 31,
					"columnNum": 31
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToWinterConditionalGrowthIndex",
				"otherPossibleNames": [],
				"logicalName": "FALLTOWINTERCONDITIONALGROWTHINDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 32,
					"offsetEnd": 32,
					"columnNum": 32
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToWinterConditionalGrowthPercentile",
				"otherPossibleNames": [],
				"logicalName": "FALLTOWINTERCONDITIONALGROWTHPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 33,
					"offsetEnd": 33,
					"columnNum": 33
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToSpringProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOSPRINGPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 34,
					"offsetEnd": 34,
					"columnNum": 34
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToSpringObservedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOSPRINGOBSERVEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 35,
					"offsetEnd": 35,
					"columnNum": 35
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToSpringObservedGrowthSE",
				"otherPossibleNames": [],
				"logicalName": "FALLTOSPRINGOBSERVEDGROWTHSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 36,
					"offsetEnd": 36,
					"columnNum": 36
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToSpringMetProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "FALLTOSPRINGMETPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 37,
					"offsetEnd": 37,
					"columnNum": 37
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToSpringConditionalGrowthIndex",
				"otherPossibleNames": [],
				"logicalName": "FALLTOSPRINGCONDITIONALGROWTHINDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 38,
					"offsetEnd": 38,
					"columnNum": 38
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FallToSpringConditionalGrowthPercentile",
				"otherPossibleNames": [],
				"logicalName": "FALLTOSPRINGCONDITIONALGROWTHPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 39,
					"offsetEnd": 39,
					"columnNum": 39
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToWinterProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOWINTERPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 40,
					"offsetEnd": 40,
					"columnNum": 40
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToWinterObservedGrowth",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOWINTEROBSERVEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 41,
					"offsetEnd": 41,
					"columnNum": 41
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToWinterObservedGrowthSE",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOWINTEROBSERVEDGROWTHSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 42,
					"offsetEnd": 42,
					"columnNum": 42
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToWinterMetProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOWINTERMETPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 43,
					"offsetEnd": 43,
					"columnNum": 43
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToWinterConditionalGrowthIndex",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOWINTERCONDITIONALGROWTHINDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 44,
					"offsetEnd": 44,
					"columnNum": 44
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToWinterConditionalGrowthPercentile",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOWINTERCONDITIONALGROWTHPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 45,
					"offsetEnd": 45,
					"columnNum": 45
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToSpringProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOSPRINGPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 46,
					"offsetEnd": 46,
					"columnNum": 46
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToSpringObservedGrowth",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOSPRINGOBSERVEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 47,
					"offsetEnd": 47,
					"columnNum": 47
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToSpringObservedGrowthSE",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOSPRINGOBSERVEDGROWTHSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 48,
					"offsetEnd": 48,
					"columnNum": 48
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToSpringMetProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOSPRINGMETPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 49,
					"offsetEnd": 49,
					"columnNum": 49
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToSpringConditionalGrowthIndex",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOSPRINGCONDITIONALGROWTHINDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 50,
					"offsetEnd": 50,
					"columnNum": 50
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WinterToSpringConditionalGrowthPercentile",
				"otherPossibleNames": [],
				"logicalName": "WINTERTOSPRINGCONDITIONALGROWTHPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 51,
					"offsetEnd": 51,
					"columnNum": 51
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SpringToSpringProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "SPRINGTOSPRINGPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 52,
					"offsetEnd": 52,
					"columnNum": 52
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SpringToSpringObservedGrowth",
				"otherPossibleNames": [],
				"logicalName": "SPRINGTOSPRINGOBSERVEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 53,
					"offsetEnd": 53,
					"columnNum": 53
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SpringToSpringObservedGrowthSE",
				"otherPossibleNames": [],
				"logicalName": "SPRINGTOSPRINGOBSERVEDGROWTHSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 54,
					"offsetEnd": 54,
					"columnNum": 54
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SpringToSpringMetProjectedGrowth",
				"otherPossibleNames": [],
				"logicalName": "SPRINGTOSPRINGMETPROJECTEDGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 55,
					"offsetEnd": 55,
					"columnNum": 55
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SpringToSpringConditionalGrowthIndex",
				"otherPossibleNames": [],
				"logicalName": "SPRINGTOSPRINGCONDITIONALGROWTHINDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 56,
					"offsetEnd": 56,
					"columnNum": 56
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SpringToSpringConditionalGrowthPercentile",
				"otherPossibleNames": [],
				"logicalName": "SPRINGTOSPRINGCONDITIONALGROWTHPERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 57,
					"offsetEnd": 57,
					"columnNum": 57
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RITtoReadingScore",
				"otherPossibleNames": [],
				"logicalName": "RITTOREADINGSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 58,
					"offsetEnd": 58,
					"columnNum": 58
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RITtoReadingMin",
				"otherPossibleNames": [],
				"logicalName": "RITTOREADINGMIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 59,
					"offsetEnd": 59,
					"columnNum": 59
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RITtoReadingMax",
				"otherPossibleNames": [],
				"logicalName": "RITTOREADINGMAX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 60,
					"offsetEnd": 60,
					"columnNum": 60
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal1Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL1NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 61,
					"offsetEnd": 61,
					"columnNum": 61
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal1RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL1RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 62,
					"offsetEnd": 62,
					"columnNum": 62
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal1StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL1STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 63,
					"offsetEnd": 63,
					"columnNum": 63
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal1Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL1RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 64,
					"offsetEnd": 64,
					"columnNum": 64
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal1Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL1ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 65,
					"offsetEnd": 65,
					"columnNum": 65
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal2Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL2NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 66,
					"offsetEnd": 66,
					"columnNum": 66
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal2RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL2RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 67,
					"offsetEnd": 67,
					"columnNum": 67
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal2StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL2STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 68,
					"offsetEnd": 68,
					"columnNum": 68
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal2Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL2RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 69,
					"offsetEnd": 69,
					"columnNum": 69
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal2Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL2ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 70,
					"offsetEnd": 70,
					"columnNum": 70
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal3Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL3NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 71,
					"offsetEnd": 71,
					"columnNum": 71
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal3RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL3RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 72,
					"offsetEnd": 72,
					"columnNum": 72
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal3StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL3STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 73,
					"offsetEnd": 73,
					"columnNum": 73
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal3Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL3RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 74,
					"offsetEnd": 74,
					"columnNum": 74
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal3Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL3ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 75,
					"offsetEnd": 75,
					"columnNum": 75
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal4Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL4NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 76,
					"offsetEnd": 76,
					"columnNum": 76
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal4RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL4RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 77,
					"offsetEnd": 77,
					"columnNum": 77
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal4StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL4STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 78,
					"offsetEnd": 78,
					"columnNum": 78
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal4Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL4RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 79,
					"offsetEnd": 79,
					"columnNum": 79
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal4Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL4ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 80,
					"offsetEnd": 80,
					"columnNum": 80
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal5Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL5NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 81,
					"offsetEnd": 81,
					"columnNum": 81
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal5RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL5RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 82,
					"offsetEnd": 82,
					"columnNum": 82
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal5StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL5STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 83,
					"offsetEnd": 83,
					"columnNum": 83
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal5Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL5RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 84,
					"offsetEnd": 84,
					"columnNum": 84
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal5Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL5ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 85,
					"offsetEnd": 85,
					"columnNum": 85
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal6Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL6NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 86,
					"offsetEnd": 86,
					"columnNum": 86
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal6RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL6RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 87,
					"offsetEnd": 87,
					"columnNum": 87
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal6StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL6STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 88,
					"offsetEnd": 88,
					"columnNum": 88
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal6Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL6RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 89,
					"offsetEnd": 89,
					"columnNum": 89
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal6Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL6ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 90,
					"offsetEnd": 90,
					"columnNum": 90
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal7Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL7NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 91,
					"offsetEnd": 91,
					"columnNum": 91
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal7RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL7RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 92,
					"offsetEnd": 92,
					"columnNum": 92
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal7StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL7STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 93,
					"offsetEnd": 93,
					"columnNum": 93
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal7Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL7RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 94,
					"columnNum": 94
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal7Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL7ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 95,
					"offsetEnd": 95,
					"columnNum": 95
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal8Name",
				"otherPossibleNames": [],
				"logicalName": "GOAL8NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 96,
					"offsetEnd": 96,
					"columnNum": 96
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal8RitScore",
				"otherPossibleNames": [],
				"logicalName": "GOAL8RITSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 97,
					"offsetEnd": 97,
					"columnNum": 97
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal8StdErr",
				"otherPossibleNames": [],
				"logicalName": "GOAL8STDERR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 98,
					"offsetEnd": 98,
					"columnNum": 98
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal8Range",
				"otherPossibleNames": [],
				"logicalName": "GOAL8RANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 99,
					"offsetEnd": 99,
					"columnNum": 99
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Goal8Adjective",
				"otherPossibleNames": [],
				"logicalName": "GOAL8ADJECTIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 100,
					"offsetEnd": 100,
					"columnNum": 100
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TestStartTime",
				"otherPossibleNames": [],
				"logicalName": "TESTSTARTTIME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 101,
					"offsetEnd": 101,
					"columnNum": 101
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PercentCorrect",
				"otherPossibleNames": [],
				"logicalName": "PERCENTCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 102,
					"offsetEnd": 102,
					"columnNum": 102
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy1",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 103,
					"offsetEnd": 103,
					"columnNum": 103
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel1",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 104,
					"offsetEnd": 104,
					"columnNum": 104
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy2",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 105,
					"offsetEnd": 105,
					"columnNum": 105
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel2",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 106,
					"offsetEnd": 106,
					"columnNum": 106
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy3",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 107,
					"offsetEnd": 107,
					"columnNum": 107
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel3",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 108,
					"offsetEnd": 108,
					"columnNum": 108
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TypicalFallToFallGrowth",
				"otherPossibleNames": [],
				"logicalName": "TYPICALFALLTOFALLGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 109,
					"offsetEnd": 109,
					"columnNum": 109
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TypicalFallToWinterGrowth",
				"otherPossibleNames": [],
				"logicalName": "TYPICALFALLTOWINTERGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 110,
					"offsetEnd": 110,
					"columnNum": 110
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TypicalFallToSpringGrowth",
				"otherPossibleNames": [],
				"logicalName": "TYPICALFALLTOSPRINGGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 111,
					"offsetEnd": 111,
					"columnNum": 111
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TypicalWinterToWinterGrowth",
				"otherPossibleNames": [],
				"logicalName": "TYPICALWINTERTOWINTERGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 112,
					"offsetEnd": 112,
					"columnNum": 112
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TypicalWinterToSpringGrowth",
				"otherPossibleNames": [],
				"logicalName": "TYPICALWINTERTOSPRINGGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 113,
					"offsetEnd": 113,
					"columnNum": 113
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "TypicalSpringToSpringGrowth",
				"otherPossibleNames": [],
				"logicalName": "TYPICALSPRINGTOSPRINGGROWTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 114,
					"offsetEnd": 114,
					"columnNum": 114
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy4",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 115,
					"offsetEnd": 115,
					"columnNum": 115
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel4",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 116,
					"offsetEnd": 116,
					"columnNum": 116
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy5",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 117,
					"columnNum": 117
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel5",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 118,
					"offsetEnd": 118,
					"columnNum": 118
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy6",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 119,
					"offsetEnd": 119,
					"columnNum": 119
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel6",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 120,
					"offsetEnd": 120,
					"columnNum": 120
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy7",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 121,
					"offsetEnd": 121,
					"columnNum": 121
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel7",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 122,
					"offsetEnd": 122,
					"columnNum": 122
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy8",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 123,
					"offsetEnd": 123,
					"columnNum": 123
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel8",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 124,
					"offsetEnd": 124,
					"columnNum": 124
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy9",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 125,
					"offsetEnd": 125,
					"columnNum": 125
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel9",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 126,
					"offsetEnd": 126,
					"columnNum": 126
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyStudy10",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYSTUDY10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 127,
					"offsetEnd": 127,
					"columnNum": 127
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ProjectedProficiencyLevel10",
				"otherPossibleNames": [],
				"logicalName": "PROJECTEDPROFICIENCYLEVEL10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 128,
					"offsetEnd": 128,
					"columnNum": 128
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": [".csv"]
}