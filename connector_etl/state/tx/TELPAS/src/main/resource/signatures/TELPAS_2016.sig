{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".dat"
    ],
    "format": {
        "@type": "Fixed Length",
        "formatName": "TELPAS_2016",
        "recordLength": 800,
        "hasHeader": false,
        "naturalKey": [
            "ADMINISTRATION_DATE",
            "STUDENT_ID",
            "LOCAL_STUDENT_ID"
        ],
        "fields": [
            {
                "physicalName": "Administration Date",
                "otherPossibleNames": [],
                "logicalName": "ADMINISTRATION_DATE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1,
                    "offsetEnd": 4,
                    "columnNum": 1
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade Level Code",
                "otherPossibleNames": [],
                "logicalName": "GRADE_LEVEL_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 5,
                    "offsetEnd": 6,
                    "columnNum": 2
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ESC Region Number",
                "otherPossibleNames": [],
                "logicalName": "ESC_REGION_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 7,
                    "offsetEnd": 8,
                    "columnNum": 3
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 9,
                    "offsetEnd": 17,
                    "columnNum": 4
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "District Name",
                "otherPossibleNames": [],
                "logicalName": "DISTRICT_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 18,
                    "offsetEnd": 32,
                    "columnNum": 5
                },
                "fieldLength": 15,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Campus Name",
                "otherPossibleNames": [],
                "logicalName": "CAMPUS_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 33,
                    "offsetEnd": 47,
                    "columnNum": 6
                },
                "fieldLength": 15,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Last Name",
                "otherPossibleNames": [],
                "logicalName": "LAST_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 48,
                    "offsetEnd": 62,
                    "columnNum": 7
                },
                "fieldLength": 15,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "First Name",
                "otherPossibleNames": [],
                "logicalName": "FIRST_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 63,
                    "offsetEnd": 72,
                    "columnNum": 8
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Middle Initial",
                "otherPossibleNames": [],
                "logicalName": "MIDDLE_INITIAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 73,
                    "offsetEnd": 73,
                    "columnNum": 9
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Student ID",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 74,
                    "offsetEnd": 82,
                    "columnNum": 10
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Sex Code",
                "otherPossibleNames": [],
                "logicalName": "SEX_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 83,
                    "offsetEnd": 83,
                    "columnNum": 11
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Date of Birth",
                "otherPossibleNames": [],
                "logicalName": "DATE_OF_BIRTH",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 84,
                    "offsetEnd": 91,
                    "columnNum": 12
                },
                "fieldLength": 8,
                "fieldPrecision": null,
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
					"offsetStart": 92,
					"offsetEnd": 92,
					"columnNum": 13
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Hispanic Latino Code",
                "otherPossibleNames": [],
                "logicalName": "HISPANIC_LATINO_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 93,
                    "offsetEnd": 93,
                    "columnNum": 14
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "American Indian Alaska Native Code",
                "otherPossibleNames": [],
                "logicalName": "AMERICAN_INDIAN_ALASKA_NATIVE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 94,
                    "offsetEnd": 94,
                    "columnNum": 15
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Asian Code",
                "otherPossibleNames": [],
                "logicalName": "ASIAN_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 95,
                    "offsetEnd": 95,
                    "columnNum": 16
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Black African American Code",
                "otherPossibleNames": [],
                "logicalName": "BLACK_AFRICAN_AMERICAN_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 96,
                    "offsetEnd": 96,
                    "columnNum": 17
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Native Hawaiian Pacific Islander Code",
                "otherPossibleNames": [],
                "logicalName": "NATIVE_HAWAIIAN_PACIFIC_ISLANDER_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 97,
                    "offsetEnd": 97,
                    "columnNum": 18
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "White Code",
                "otherPossibleNames": [],
                "logicalName": "WHITE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 98,
                    "offsetEnd": 98,
                    "columnNum": 19
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Ethnicity Race Reporting Category",
                "otherPossibleNames": [],
                "logicalName": "ETHNICITY_RACE_REPORTING_CATEGORY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 99,
                    "offsetEnd": 99,
                    "columnNum": 20
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Economic Disadvantage Code",
                "otherPossibleNames": [],
                "logicalName": "ECONOMIC_DISADVANTAGE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 100,
                    "offsetEnd": 100,
                    "columnNum": 21
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Title I Part A Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "TITLE_I_PART_A_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 101,
                    "offsetEnd": 101,
                    "columnNum": 22
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Migrant Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "MIGRANT_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 102,
                    "offsetEnd": 102,
                    "columnNum": 23
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
 					"offsetStart": 103,
 					"offsetEnd": 107,
 					"columnNum": 24
 				},
 				"fieldLength": 5,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Bilingual Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "BILINGUAL_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 108,
                    "offsetEnd": 108,
                    "columnNum": 25
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ESL Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "ESL_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 109,
                    "offsetEnd": 109,
                    "columnNum": 26
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
 					"offsetStart": 110,
 					"offsetEnd": 110,
 					"columnNum": 27
 				},
 				"fieldLength": 1,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Special Ed Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "SPECIAL_ED_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 111,
                    "offsetEnd": 111,
                    "columnNum": 28
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
 					"offsetStart": 112,
 					"offsetEnd": 116,
 					"columnNum": 29
 				},
 				"fieldLength": 5,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Gifted Talented Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "GIFTED_TALENTED_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 117,
                    "offsetEnd": 117,
                    "columnNum": 30
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "At Risk Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "AT_RISK_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 118,
                    "offsetEnd": 118,
                    "columnNum": 31
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
 					"offsetStart": 119,
 					"offsetEnd": 121,
 					"columnNum": 32
 				},
 				"fieldLength": 3,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Career and Technical Ed Indicator Code",
                "otherPossibleNames": [],
                "logicalName": "CAREER_AND_TECHNICAL_ED_INDICATOR_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 122,
                    "offsetEnd": 122,
                    "columnNum": 33
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
		    {
 				"physicalName": "LOCAL USE",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 123,
 					"offsetEnd": 126,
 					"columnNum": 34
 				},
 				"fieldLength": 4,
 				"fieldPrecision": null,
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
 					"offsetStart": 127,
 					"offsetEnd": 130,
 					"columnNum": 35
 				},
 				"fieldLength": 4,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Unschooled Aslyee Refugee",
                "otherPossibleNames": [],
                "logicalName": "UNSCHOOLED_ASLYEE_REFUGEE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 131,
                    "offsetEnd": 131,
                    "columnNum": 36
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Students with Interrupted Formal Education",
                "otherPossibleNames": [],
                "logicalName": "STUDENTS_WITH_INTERRUPTED_FORMAL_EDUCATION",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 132,
                    "offsetEnd": 132,
                    "columnNum": 37
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
 			{
 				"physicalName": "AGENCY USE A",
 				"otherPossibleNames": [],
 				"logicalName": "AGENCY_USE_A",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 133,
 					"offsetEnd": 133,
 					"columnNum": 38
 				},
 				"fieldLength": 1,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "AGENCY USE B",
 				"otherPossibleNames": [],
 				"logicalName": "AGENCY_USE_B",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 134,
 					"offsetEnd": 134,
 					"columnNum": 39
 				},
 				"fieldLength": 1,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "AGENCY USE C",
 				"otherPossibleNames": [],
 				"logicalName": "AGENCY_USE_C",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 135,
 					"offsetEnd": 135,
 					"columnNum": 40
 				},
 				"fieldLength": 1,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "AGENCY USE D",
 				"otherPossibleNames": [],
 				"logicalName": "AGENCY_USE_D",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 136,
 					"offsetEnd": 136,
 					"columnNum": 41
 				},
 				"fieldLength": 1,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "AGENCY USE E",
 				"otherPossibleNames": [],
 				"logicalName": "AGENCY_USE_E",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 137,
 					"offsetEnd": 137,
 					"columnNum": 42
 				},
 				"fieldLength": 1,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
 			{
 				"physicalName": "BLANK",
 				"otherPossibleNames": [],
 				"logicalName": "AGENCY USE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 138,
 					"offsetEnd": 140,
 					"columnNum": 43
 				},
 				"fieldLength": 3,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Years in US Schools",
                "otherPossibleNames": [],
                "logicalName": "YEARS_IN_US_SCHOOLS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 141,
                    "offsetEnd": 141,
                    "columnNum": 44
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
 					"offsetStart": 142,
 					"offsetEnd": 143,
 					"columnNum": 45
 				},
 				"fieldLength": 2,
 				"fieldPrecision": null,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": null
 			},
            {
                "physicalName": "Parental Denial",
                "otherPossibleNames": [],
                "logicalName": "PARENTAL_DENIAL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 144,
                    "offsetEnd": 144,
                    "columnNum": 46
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local Student ID",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_STUDENT_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 145,
                    "offsetEnd": 153,
                    "columnNum": 47
                },
                "fieldLength": 9,
                "fieldPrecision": null,
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
					"offsetStart": 154,
					"offsetEnd": 154,
					"columnNum": 48
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Fall 2015 Peims County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "FALL_2015_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 155,
                    "offsetEnd": 163,
                    "columnNum": 49
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Document Number",
                "otherPossibleNames": [],
                "logicalName": "DOCUMENT_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 164,
                    "offsetEnd": 172,
                    "columnNum": 50
                },
                "fieldLength": 9,
                "fieldPrecision": null,
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
					"offsetStart": 173,
					"offsetEnd": 173,
					"columnNum": 51
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Fall 2015 Peims Crisis Code",
                "otherPossibleNames": [],
                "logicalName": "FALL_2015_PEIMS_CRISIS_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 174,
                    "offsetEnd": 175,
                    "columnNum": 52
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Fall 2015 Peims Student Attribution Code",
                "otherPossibleNames": [],
                "logicalName": "FALL_2015_PEIMS_STUDENT_ATTRIBUTION_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 176,
                    "offsetEnd": 177,
                    "columnNum": 53
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
				"physicalName": "Fall 2016 Peims Military Connected Student Code",
				"otherPossibleNames": [],
				"logicalName": "FALL_2016_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 178,
					"offsetEnd": 178,
					"columnNum": 54
				},
				"fieldLength": 1,
				"fieldPrecision": null,
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
					"offsetStart": 179,
					"offsetEnd": 180,
					"columnNum": 55
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Rater Info A",
                "otherPossibleNames": [],
                "logicalName": "RATER_INFO_A",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 181,
                    "offsetEnd": 181,
                    "columnNum": 56
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 182,
					"offsetEnd": 190,
					"columnNum": 57
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Rater Info B",
                "otherPossibleNames": [],
                "logicalName": "RATER_INFO_B",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 191,
                    "offsetEnd": 191,
                    "columnNum": 58
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 192,
					"offsetEnd": 200,
					"columnNum": 59
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Reading Accommodations Information General Accommodations",
                "otherPossibleNames": [],
                "logicalName": "READING_ACCOMMODATIONS_INFORMATION_GENERAL_ACCOMMODATIONS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 201,
                    "offsetEnd": 201,
                    "columnNum": 60
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Reading Accommodations Information Large Print",
                "otherPossibleNames": [],
                "logicalName": "READING_ACCOMMODATIONS_INFORMATION_LARGE_PRINT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 202,
                    "offsetEnd": 202,
                    "columnNum": 61
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Reading Accommodations Information Extra Day",
                "otherPossibleNames": [],
                "logicalName": "READING_ACCOMMODATIONS_INFORMATION_EXTRA_DAY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 203,
                    "offsetEnd": 203,
                    "columnNum": 62
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 204,
					"offsetEnd": 218,
					"columnNum": 63
				},
				"fieldLength": 15,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "ELL Progress Measure Plan For Subjects Other Than English I and English II",
                "otherPossibleNames": [],
                "logicalName": "ELL_PROGRESS_MEASURE_PLAN_FOR_SUBJECTS_OTHER_THAN_ENGLISH_I_AND_ENGLISH_II",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 219,
                    "offsetEnd": 219,
                    "columnNum": 64
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ELL Progress Measure Plan For English I and English II",
                "otherPossibleNames": [],
                "logicalName": "ELL_PROGRESS_MEASURE_PLAN_FOR_ENGLISH_I_AND_ENGLISH_II",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 220,
                    "offsetEnd": 220,
                    "columnNum": 65
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ELL Progress Measure Qualification For Subjects Other Than English I and English II",
                "otherPossibleNames": [],
                "logicalName": "ELL_PROGRESS_MEASURE_QUALIFICATION_FOR_SUBJECTS_OTHER_THAN_ENGLISH_I_AND_ENGLISH_II",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 221,
                    "offsetEnd": 221,
                    "columnNum": 66
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ELL Progress Measure Qualification For English I and English II",
                "otherPossibleNames": [],
                "logicalName": "ELL_PROGRESS_MEASURE_QUALIFICATION_FOR_ENGLISH_I_AND_ENGLISH_II",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 222,
                    "offsetEnd": 222,
                    "columnNum": 67
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Year ELL Plan Determined",
                "otherPossibleNames": [],
                "logicalName": "YEAR_ELL_PLAN_DETERMINED",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 223,
                    "offsetEnd": 226,
                    "columnNum": 68
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Plan Year Unschooled Asylee Refugee",
                "otherPossibleNames": [],
                "logicalName": "PLAN_YEAR_UNSCHOOLED_ASYLEE_REFUGEE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 227,
                    "offsetEnd": 227,
                    "columnNum": 69
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Plan Year Students With Interuppted Formal Education",
                "otherPossibleNames": [],
                "logicalName": "PLAN_YEAR_STUDENTS_WITH_INTERUPPTED_FORMAL_EDUCATION",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 228,
                    "offsetEnd": 228,
                    "columnNum": 70
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Plan Year Years In US Schools",
                "otherPossibleNames": [],
                "logicalName": "PLAN_YEAR_YEARS_IN_US_SCHOOLS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 229,
                    "offsetEnd": 229,
                    "columnNum": 71
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Plan Year TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "PLAN_YEAR_TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 230,
                    "offsetEnd": 230,
                    "columnNum": 72
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Listening Score Code",
                "otherPossibleNames": [],
                "logicalName": "LISTENING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 231,
                    "offsetEnd": 231,
                    "columnNum": 73
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 232,
					"offsetEnd": 232,
					"columnNum": 74
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Listening Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "LISTENING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 233,
                    "offsetEnd": 233,
                    "columnNum": 75
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 234,
					"offsetEnd": 245,
					"columnNum": 76
				},
				"fieldLength": 12,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Speaking Score Code",
                "otherPossibleNames": [],
                "logicalName": "SPEAKING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 246,
                    "offsetEnd": 246,
                    "columnNum": 77
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 247,
					"offsetEnd": 247,
					"columnNum": 78
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Speaking Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "SPEAKING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 248,
                    "offsetEnd": 248,
                    "columnNum": 79
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 249,
					"offsetEnd": 260,
					"columnNum": 80
				},
				"fieldLength": 12,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Writing Score Code",
                "otherPossibleNames": [],
                "logicalName": "WRITING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 261,
                    "offsetEnd": 261,
                    "columnNum": 81
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 262,
					"offsetEnd": 262,
					"columnNum": 82
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Writing Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "WRITING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 263,
                    "offsetEnd": 263,
                    "columnNum": 83
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 264,
					"offsetEnd": 275,
					"columnNum": 84
				},
				"fieldLength": 12,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Reading Score Code",
                "otherPossibleNames": [],
                "logicalName": "READING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 276,
                    "offsetEnd": 276,
                    "columnNum": 85
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 277,
					"offsetEnd": 277,
					"columnNum": 86
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "TELPAS Reading Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "READING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 278,
                    "offsetEnd": 278,
                    "columnNum": 87
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 279,
					"offsetEnd": 290,
					"columnNum": 88
				},
				"fieldLength": 12,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Beginning Proficiency Level Number of Items Correct for Reporting Category 1",
                "otherPossibleNames": [],
                "logicalName": "BEGINNING_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 291,
                    "offsetEnd": 291,
                    "columnNum": 89
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Beginning Proficiency Level Number of Items Correct for Reporting Categories 2 and 3",
                "otherPossibleNames": [],
                "logicalName": "BEGINNING_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORIES_2_AND_3",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 292,
                    "offsetEnd": 292,
                    "columnNum": 90
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 293,
					"offsetEnd": 294,
					"columnNum": 91
				},
				"fieldLength": 2,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Total Number of Beginning Proficiency Level Items Correct",
                "otherPossibleNames": [],
                "logicalName": "TOTAL_NUMBER_OF_BEGINNING_PROFICIENCY_LEVEL_ITEMS_CORRECT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 295,
                    "offsetEnd": 296,
                    "columnNum": 92
                },
                "fieldLength": 2,
                "fieldPrecision": null,
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
					"offsetStart": 297,
					"offsetEnd": 300,
					"columnNum": 93
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Intermediate Proficiency Level Number of Items Correct for Reporting Category 1",
                "otherPossibleNames": [],
                "logicalName": "INTERMEDIATE_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 301,
                    "offsetEnd": 301,
                    "columnNum": 94
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Intermediate Proficiency Level Number of Items Correct for Reporting Category 2",
                "otherPossibleNames": [],
                "logicalName": "INTERMEDIATE_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 302,
                    "offsetEnd": 302,
                    "columnNum": 95
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Intermediate Proficiency Level Number of Items Correct for Reporting Category 3",
                "otherPossibleNames": [],
                "logicalName": "INTERMEDIATE_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_3",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 303,
                    "offsetEnd": 303,
                    "columnNum": 96
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 304,
					"offsetEnd": 304,
					"columnNum": 97
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Total Number of Intermediate Proficiency Level Items Correct",
                "otherPossibleNames": [],
                "logicalName": "TOTAL_NUMBER_OF_INTERMEDIATE_PROFICIENCY_LEVEL_ITEMS_CORRECT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 305,
                    "offsetEnd": 306,
                    "columnNum": 98
                },
                "fieldLength": 2,
                "fieldPrecision": null,
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
					"offsetStart": 307,
					"offsetEnd": 310,
					"columnNum": 99
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Advanced Proficiency Level Number of Items Correct for Reporting Category 1",
                "otherPossibleNames": [],
                "logicalName": "ADVANCED_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 311,
                    "offsetEnd": 311,
                    "columnNum": 100
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Advanced Proficiency Level Number of Items Correct for Reporting Category 2",
                "otherPossibleNames": [],
                "logicalName": "ADVANCED_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 312,
                    "offsetEnd": 312,
                    "columnNum": 101
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Advanced Proficiency Level Number of Items Correct for Reporting Category 3",
                "otherPossibleNames": [],
                "logicalName": "ADVANCED_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_3",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 313,
                    "offsetEnd": 313,
                    "columnNum": 102
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 314,
					"offsetEnd": 314,
					"columnNum": 103
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Total Number of Advanced Proficiency Level Items Correct",
                "otherPossibleNames": [],
                "logicalName": "TOTAL_NUMBER_OF_ADVANCED_PROFICIENCY_LEVEL_ITEMS_CORRECT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 315,
                    "offsetEnd": 316,
                    "columnNum": 104
                },
                "fieldLength": 2,
                "fieldPrecision": null,
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
					"offsetStart": 317,
					"offsetEnd": 320,
					"columnNum": 105
				},
				"fieldLength": 4,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Advanced High Proficiency Level Number of Items Correct for Reporting Category 1",
                "otherPossibleNames": [],
                "logicalName": "ADVANCED_HIGH_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 321,
                    "offsetEnd": 321,
                    "columnNum": 106
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Advanced High Proficiency Level Number of Items Correct for Reporting Category 2",
                "otherPossibleNames": [],
                "logicalName": "ADVANCED_HIGH_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 322,
                    "offsetEnd": 322,
                    "columnNum": 107
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Advanced High Proficiency Level Number of Items Correct for Reporting Category 3",
                "otherPossibleNames": [],
                "logicalName": "ADVANCED_HIGH_PROFICIENCY_LEVEL_NUMBER_OF_ITEMS_CORRECT_FOR_REPORTING_CATEGORY_3",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 323,
                    "offsetEnd": 323,
                    "columnNum": 108
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 324,
					"offsetEnd": 324,
					"columnNum": 109
				},
				"fieldLength": 1,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Total Number of Advanced High Proficiency Level Items Correct",
                "otherPossibleNames": [],
                "logicalName": "TOTAL_NUMBER_OF_ADVANCED_HIGH_PROFICIENCY_LEVEL_ITEMS_CORRECT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 325,
                    "offsetEnd": 326,
                    "columnNum": 110
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Reading Raw Score",
                "otherPossibleNames": [],
                "logicalName": "READING_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 327,
                    "offsetEnd": 328,
                    "columnNum": 111
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 329,
                    "offsetEnd": 332,
                    "columnNum": 112
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Reading Paper Test Administration",
                "otherPossibleNames": [],
                "logicalName": "READING_PAPER_TEST_ADMINISTRATION",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 333,
                    "offsetEnd": 333,
                    "columnNum": 113
                },
                "fieldLength": 1,
                "fieldPrecision": null,
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
					"offsetStart": 334,
					"offsetEnd": 342,
					"columnNum": 114
				},
				"fieldLength": 9,
				"fieldPrecision": null,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
            {
                "physicalName": "Item Proficiency Level",
                "otherPossibleNames": [],
                "logicalName": "ITEM_PROFICIENCY_LEVEL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 343,
                    "offsetEnd": 412,
                    "columnNum": 115
                },
                "fieldLength": 70,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Item Reporting Category Numbers",
                "otherPossibleNames": [],
                "logicalName": "ITEM_REPORTING_CATEGORY_NUMBERS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 413,
                    "offsetEnd": 482,
                    "columnNum": 116
                },
                "fieldLength": 70,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                 "physicalName": "Correct Item Response",
                 "otherPossibleNames": [],
                 "logicalName": "CORRECT_ITEM_RESPONSE",
                 "formatMask": null,
                 "isFieldRequired": "Y",
                 "canBeNull": "Y",
                 "fieldOffset": {
                     "offsetStart": 483,
                     "offsetEnd": 552,
                     "columnNum": 117
                 },
                 "fieldLength": 70,
                 "fieldPrecision": null,
                 "expectedValues": [],
                 "dataTypes": "STRING",
                 "scale": null
             },
            {
                "physicalName": "Student Item Response",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_ITEM_RESPONSE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 553,
                    "offsetEnd": 622,
                    "columnNum": 118
                },
                "fieldLength": 70,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Yearly Progress Indicator",
                "otherPossibleNames": [],
                "logicalName": "YEARLY_PROGRESS_INDICATOR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 623,
                    "offsetEnd": 623,
                    "columnNum": 119
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TELPAS Comprehension Score",
                "otherPossibleNames": [],
                "logicalName": "TELPAS_COMPREHENSION_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 624,
                    "offsetEnd": 626,
                    "columnNum": 120
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TELPAS Composite Score",
                "otherPossibleNames": [],
                "logicalName": "TELPAS_COMPOSITE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 627,
                    "offsetEnd": 629,
                    "columnNum": 121
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 630,
                    "offsetEnd": 630,
                    "columnNum": 122
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Student Portal Unique Access Code",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_PORTAL_UNIQUE_ACCESS_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 631,
                    "offsetEnd": 636,
                    "columnNum": 123
                },
                "fieldLength": 6,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Texas Student Data System Unique Student ID",
                "otherPossibleNames": [],
                "logicalName": "TEXAS_STUDENT_DATA_SYSTEM_UNIQUE_STUDENT_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 637,
                    "offsetEnd": 646,
                    "columnNum": 124
                },
                "fieldLength": 10,
                "fieldPrecision": null,
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
                     "offsetStart": 647,
                     "offsetEnd": 663,
                     "columnNum": 125
                 },
                 "fieldLength": 17,
                 "fieldPrecision": null,
                 "expectedValues": [],
                 "dataTypes": "STRING",
                 "scale": null
             },
            {
                "physicalName": "Spring 2011 Administration Grade",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_ADMINISTRATION_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 664,
                    "offsetEnd": 665,
                    "columnNum": 126
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2011 Administration County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 666,
                    "offsetEnd": 674,
                    "columnNum": 127
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2011 Administration TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 675,
                    "offsetEnd": 675,
                    "columnNum": 128
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2011 Administration TELPAS Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_ADMINISTRATION_TELPAS_READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 676,
                    "offsetEnd": 679,
                    "columnNum": 129
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2011 Administration TELPAS Reading Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_ADMINISTRATION_TELPAS_READING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 680,
                    "offsetEnd": 680,
                    "columnNum": 130
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2011 Administration TELPAS Reading Score Code",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_ADMINISTRATION_TELPAS_READING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 681,
                    "offsetEnd": 681,
                    "columnNum": 131
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2012 Administration Grade",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2012_ADMINISTRATION_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 682,
                    "offsetEnd": 683,
                    "columnNum": 132
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2012 Administration County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2012_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 684,
                    "offsetEnd": 692,
                    "columnNum": 133
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2012 Administration TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2012_TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 693,
                    "offsetEnd": 693,
                    "columnNum": 134
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2011 Administration TELPAS Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2011_ADMINISTRATION_TELPAS_READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 694,
                    "offsetEnd": 697,
                    "columnNum": 135
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2012 Administration TELPAS Reading Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2012_ADMINISTRATION_TELPAS_READING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 698,
                    "offsetEnd": 698,
                    "columnNum": 136
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2012 Administration TELPAS Reading Score Code",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2012_ADMINISTRATION_TELPAS_READING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 699,
                    "offsetEnd": 699,
                    "columnNum": 137
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2013 Administration Grade",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2013_ADMINISTRATION_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 700,
                    "offsetEnd": 701,
                    "columnNum": 138
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2013 Administration County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2013_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 702,
                    "offsetEnd": 710,
                    "columnNum": 139
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2013 Administration TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2013_TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 711,
                    "offsetEnd": 711,
                    "columnNum": 140
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2013 Administration TELPAS Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2013_ADMINISTRATION_TELPAS_READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 712,
                    "offsetEnd": 715,
                    "columnNum": 141
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2013 Administration TELPAS Reading Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2013_ADMINISTRATION_TELPAS_READING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 716,
                    "offsetEnd": 716,
                    "columnNum": 142
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2013 Administration TELPAS Reading Score Code",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2013_ADMINISTRATION_TELPAS_READING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 717,
                    "offsetEnd": 717,
                    "columnNum": 143
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2014 Administration Grade",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2014_ADMINISTRATION_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 718,
                    "offsetEnd": 719,
                    "columnNum": 144
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2014 Administration County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2014_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 720,
                    "offsetEnd": 728,
                    "columnNum": 145
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2014 Administration TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2014_TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 729,
                    "offsetEnd": 729,
                    "columnNum": 146
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2014 Administration TELPAS Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2014_ADMINISTRATION_TELPAS_READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 730,
                    "offsetEnd": 733,
                    "columnNum": 147
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2014 Administration TELPAS Reading Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2014_ADMINISTRATION_TELPAS_READING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 734,
                    "offsetEnd": 734,
                    "columnNum": 148
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2014 Administration TELPAS Reading Score Code",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2014_ADMINISTRATION_TELPAS_READING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 735,
                    "offsetEnd": 735,
                    "columnNum": 149
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2015 Administration Grade",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2015_ADMINISTRATION_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 736,
                    "offsetEnd": 737,
                    "columnNum": 150
                },
                "fieldLength": 2,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2015 Administration County District Campus Number",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2015_ADMINISTRATION_COUNTY_DISTRICT_CAMPUS_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 738,
                    "offsetEnd": 746,
                    "columnNum": 151
                },
                "fieldLength": 9,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2015 Administration TELPAS Composite Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2015_TELPAS_COMPOSITE_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 747,
                    "offsetEnd": 747,
                    "columnNum": 152
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2015 Administration TELPAS Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2015_ADMINISTRATION_TELPAS_READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 748,
                    "offsetEnd": 751,
                    "columnNum": 153
                },
                "fieldLength": 4,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2015 Administration TELPAS Reading Proficiency Rating",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2015_ADMINISTRATION_TELPAS_READING_PROFICIENCY_RATING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 752,
                    "offsetEnd": 752,
                    "columnNum": 154
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Spring 2015 Administration TELPAS Reading Score Code",
                "otherPossibleNames": [],
                "logicalName": "SPRING_2015_ADMINISTRATION_TELPAS_READING_SCORE_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 753,
                    "offsetEnd": 753,
                    "columnNum": 155
                },
                "fieldLength": 1,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            }
        ]
    }
}