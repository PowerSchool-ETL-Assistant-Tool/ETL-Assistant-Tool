{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "OST_STRAND_1819_FW",
		"recordLength": 1052,
		"naturalKey": ["STUDENT_STATE_ID","TEST_NAME"],
		"fields": [{
                "physicalName": "Assessment type",
                "otherPossibleNames": [],
                "logicalName": "ASSESSMENT_TYPE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1,
                    "offsetEnd": 5,
                    "columnNum": 1
                },
                "fieldLength": 5,
                "expectedValues": ["AASCD", "OCBA ", "OELPA"],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Administration",
                "otherPossibleNames": [],
                "logicalName": "ADMINISTRATION",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 6,
                    "offsetEnd": 15,
                    "columnNum": 2
                },
                "fieldLength": 10,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SSID",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_STATE_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 16,
                    "offsetEnd": 24,
                    "columnNum": 3
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local ID",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_LOCAL_ID",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 25,
                    "offsetEnd": 33,
                    "columnNum": 4
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Last name",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_LAST_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 34,
                    "offsetEnd": 68,
                    "columnNum": 5
                },
                "fieldLength": 35,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "First name",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_FIRST_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 69,
                    "offsetEnd": 103,
                    "columnNum": 6
                },
                "fieldLength": 35,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Middle name",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_MIDDLE_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 104,
                    "offsetEnd": 138,
                    "columnNum": 7
                },
                "fieldLength": 35,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Date of birth",
                "otherPossibleNames": [],
                "logicalName": "DATE_OF_BIRTH",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 139,
                    "offsetEnd": 148,
                    "columnNum": 8
                },
                "fieldLength": 10,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Gender",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_GENDER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 149,
                    "offsetEnd": 149,
                    "columnNum": 9
                },
                "fieldLength": 1,
                "expectedValues": ["F", "M", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Enrolled grade",
                "otherPossibleNames": [],
                "logicalName": "ENROLLED_GRADE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 150,
                    "offsetEnd": 151,
                    "columnNum": 10
                },
                "fieldLength": 2,
                "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "22"],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Ethnicity",
                "otherPossibleNames": [],
                "logicalName": "ETHNICITY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 152,
                    "offsetEnd": 152,
                    "columnNum": 11
                },
                "fieldLength": 1,
                "expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7"],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "LEP",
                "otherPossibleNames": [],
                "logicalName": "LEP",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 153,
                    "offsetEnd": 153,
                    "columnNum": 12
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
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
                    "offsetStart": 154,
                    "offsetEnd": 154,
                    "columnNum": 13
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Gifted and Talented",
                "otherPossibleNames": [],
                "logicalName": "GIFTED_AND_TALENTED",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 155,
                    "offsetEnd": 155,
                    "columnNum": 14
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "504 Plan",
                "otherPossibleNames": [],
                "logicalName": "504_PLAN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 156,
                    "offsetEnd": 156,
                    "columnNum": 15
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "IEP",
                "otherPossibleNames": [],
                "logicalName": "IEP",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 157,
                    "offsetEnd": 157,
                    "columnNum": 16
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Primary Disability",
                "otherPossibleNames": [],
                "logicalName": "PRIMARY_DISABILITY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 158,
                    "offsetEnd": 160,
                    "columnNum": 17
                },
                "fieldLength": 3,
                "expectedValues": ["AUT", "DB ", "DD ", "EMN", "HI ", "ID ", "MD ", "OI ", "OHI", "SLD", "SLI", "TBI", "VI ", "    ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Accommodations - ELA",
                "otherPossibleNames": [],
                "logicalName": "ACCOMMODATIONS_-_ELA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 161,
                    "offsetEnd": 161,
                    "columnNum": 18
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Accommodations - Mathematics",
                "otherPossibleNames": [],
                "logicalName": "ACCOMMODATIONS_-_MATHEMATICS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 162,
                    "offsetEnd": 162,
                    "columnNum": 19
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Accommodations - Social Studies",
                "otherPossibleNames": [],
                "logicalName": "ACCOMMODATIONS_-_SOCIAL_STUDIES",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 163,
                    "offsetEnd": 163,
                    "columnNum": 20
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Accommodations - Science",
                "otherPossibleNames": [],
                "logicalName": "ACCOMMODATIONS_-_SCIENCE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 164,
                    "offsetEnd": 164,
                    "columnNum": 21
                },
                "fieldLength": 1,
                "expectedValues": ["Y", "N", " ", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending district name",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_DISTRICT_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 165,
                    "offsetEnd": 194,
                    "columnNum": 22
                },
                "fieldLength": 30,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending district IRN",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_DISTRICT_IRN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 195,
                    "offsetEnd": 200,
                    "columnNum": 23
                },
                "fieldLength": 6,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending district type",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_DISTRICT_TYPE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 201,
                    "offsetEnd": 201,
                    "columnNum": 24
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending district county",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_DISTRICT_COUNTY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 202,
                    "offsetEnd": 221,
                    "columnNum": 25
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending school name",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_SCHOOL_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 222,
                    "offsetEnd": 251,
                    "columnNum": 26
                },
                "fieldLength": 30,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending school IRN",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_SCHOOL_IRN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 252,
                    "offsetEnd": 257,
                    "columnNum": 27
                },
                "fieldLength": 6,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Attending school type",
                "otherPossibleNames": [],
                "logicalName": "ATTENDING_SCHOOL_TYPE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 258,
                    "offsetEnd": 258,
                    "columnNum": 28
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home district name",
                "otherPossibleNames": [],
                "logicalName": "HOME_DISTRICT_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 259,
                    "offsetEnd": 288,
                    "columnNum": 29
                },
                "fieldLength": 30,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home district IRN",
                "otherPossibleNames": [],
                "logicalName": "HOME_DISTRICT_IRN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 289,
                    "offsetEnd": 294,
                    "columnNum": 30
                },
                "fieldLength": 6,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home district type",
                "otherPossibleNames": [],
                "logicalName": "HOME_DISTRICT_TYPE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 295,
                    "offsetEnd": 295,
                    "columnNum": 31
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home district county",
                "otherPossibleNames": [],
                "logicalName": "HOME_DISTRICT_COUNTY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 296,
                    "offsetEnd": 315,
                    "columnNum": 32
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home school name",
                "otherPossibleNames": [],
                "logicalName": "HOME_SCHOOL_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 316,
                    "offsetEnd": 345,
                    "columnNum": 33
                },
                "fieldLength": 30,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home school IRN",
                "otherPossibleNames": [],
                "logicalName": "HOME_SCHOOL_IRN",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 346,
                    "offsetEnd": 351,
                    "columnNum": 34
                },
                "fieldLength": 6,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home school type",
                "otherPossibleNames": [],
                "logicalName": "HOME_SCHOOL_TYPE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 352,
                    "offsetEnd": 352,
                    "columnNum": 35
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ITC code",
                "otherPossibleNames": [],
                "logicalName": "ITC_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 353,
                    "offsetEnd": 354,
                    "columnNum": 36
                },
                "fieldLength": 2,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Home room",
                "otherPossibleNames": [],
                "logicalName": "HOME_ROOM",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 355,
                    "offsetEnd": 392,
                    "columnNum": 37
                },
                "fieldLength": 38,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Staff Member",
                "otherPossibleNames": [],
                "logicalName": "STAFF_MEMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 393,
                    "offsetEnd": 422,
                    "columnNum": 38
                },
                "fieldLength": 30,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---ELA or HS ELA 1",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---ELA_OR_HS_ELA_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 423,
                    "offsetEnd": 442,
                    "columnNum": 39
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---HS ELA 2",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---HS_ELA_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 443,
                    "offsetEnd": 462,
                    "columnNum": 40
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Mathematics or Integrated Mathematics 1",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---MATHEMATICS_OR_INTEGRATED_MATHEMATICS_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 463,
                    "offsetEnd": 482,
                    "columnNum": 41
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Integrated Mathematics 2",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---INTEGRATED_MATHEMATICS_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 483,
                    "offsetEnd": 502,
                    "columnNum": 42
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Algebra 1",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---ALGEBRA_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 503,
                    "offsetEnd": 522,
                    "columnNum": 43
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Geometry",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---GEOMETRY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 523,
                    "offsetEnd": 542,
                    "columnNum": 44
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Social Studies or American History",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---SOCIAL_STUDIES_OR_AMERICAN_HISTORY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 543,
                    "offsetEnd": 562,
                    "columnNum": 45
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---American Government",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---AMERICAN_GOVERNMENT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 563,
                    "offsetEnd": 582,
                    "columnNum": 46
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Physical Science or Science",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---PHYSICAL_SCIENCE_OR_SCIENCE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 583,
                    "offsetEnd": 602,
                    "columnNum": 47
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Section Number/Class Name/Course Code---Biology",
                "otherPossibleNames": [],
                "logicalName": "SECTION_NUMBER/CLASS_NAME/COURSE_CODE---BIOLOGY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 603,
                    "offsetEnd": 622,
                    "columnNum": 48
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---ELA or HS ELA 1",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---ELA_OR_HS_ELA_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 623,
                    "offsetEnd": 642,
                    "columnNum": 49
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---HS ELA 2",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---HS_ELA_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 643,
                    "offsetEnd": 662,
                    "columnNum": 50
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Mathematics or Integrated Mathematics 1",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---MATHEMATICS_OR_INTEGRATED_MATHEMATICS_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 663,
                    "offsetEnd": 682,
                    "columnNum": 51
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Integrated Mathematics 2",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---INTEGRATED_MATHEMATICS_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 683,
                    "offsetEnd": 702,
                    "columnNum": 52
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Algebra 1",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---ALGEBRA_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 703,
                    "offsetEnd": 722,
                    "columnNum": 53
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Geometry",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---GEOMETRY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 723,
                    "offsetEnd": 742,
                    "columnNum": 54
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Social Studies or American History",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---SOCIAL_STUDIES_OR_AMERICAN_HISTORY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 743,
                    "offsetEnd": 762,
                    "columnNum": 55
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---American Government",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---AMERICAN_GOVERNMENT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 763,
                    "offsetEnd": 782,
                    "columnNum": 56
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Physical Science or Science",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---PHYSICAL_SCIENCE_OR_SCIENCE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 783,
                    "offsetEnd": 802,
                    "columnNum": 57
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Name---Biology",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_NAME---BIOLOGY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 803,
                    "offsetEnd": 822,
                    "columnNum": 58
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---ELA or HS ELA 1",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---ELA_OR_HS_ELA_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 823,
                    "offsetEnd": 831,
                    "columnNum": 59
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---HS ELA 2",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---HS_ELA_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 832,
                    "offsetEnd": 840,
                    "columnNum": 60
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Mathematics or Integrated Mathematics 1",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---MATHEMATICS_OR_INTEGRATED_MATHEMATICS_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 841,
                    "offsetEnd": 849,
                    "columnNum": 61
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Integrated Mathematics 2",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---INTEGRATED_MATHEMATICS_2",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 850,
                    "offsetEnd": 858,
                    "columnNum": 62
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Algebra 1",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---ALGEBRA_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 859,
                    "offsetEnd": 867,
                    "columnNum": 63
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Geometry",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---GEOMETRY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 868,
                    "offsetEnd": 876,
                    "columnNum": 64
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Social Studies or American History",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---SOCIAL_STUDIES_OR_AMERICAN_HISTORY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 877,
                    "offsetEnd": 885,
                    "columnNum": 65
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---American Government",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---AMERICAN_GOVERNMENT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 886,
                    "offsetEnd": 894,
                    "columnNum": 66
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Physical Science or Science",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---PHYSICAL_SCIENCE_OR_SCIENCE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 895,
                    "offsetEnd": 903,
                    "columnNum": 67
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Teacher Identification Number---Biology",
                "otherPossibleNames": [],
                "logicalName": "TEACHER_IDENTIFICATION_NUMBER---BIOLOGY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 904,
                    "offsetEnd": 912,
                    "columnNum": 68
                },
                "fieldLength": 9,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test name",
                "otherPossibleNames": [],
                "logicalName": "TEST_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 913,
                    "offsetEnd": 943,
                    "columnNum": 69
                },
                "fieldLength": 31,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Overall scale score - Ohio's State Tests or Alternate Assessment",
                "otherPossibleNames": ["Overall scaled score"],
                "logicalName": "OVERALL_SCALE_SCORE_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 944,
                    "offsetEnd": 946,
                    "columnNum": 70
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Overall performance level - Ohio's State Tests or Alternate Assessment",
                "otherPossibleNames": ["Overall performance level"],
                "logicalName": "OVERALL_PERFORMANCE_LEVEL_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 947,
                    "offsetEnd": 947,
                    "columnNum": 71
                },
                "fieldLength": 1,
                "expectedValues": ["5", "4", "3", "2", "1", " "],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": ["Part 1 tested"],
                "logicalName": "FILLER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 948,
                    "offsetEnd": 948,
                    "columnNum": 72
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Filler",
                "otherPossibleNames": ["Part 2 tested"],
                "logicalName": "FILLER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 949,
                    "offsetEnd": 949,
                    "columnNum": 73
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 1 performance band ",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_1_PERFORMANCE_BAND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 950,
                    "offsetEnd": 950,
                    "columnNum": 74
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 2 performance band ",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_2_PERFORMANCE_BAND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 951,
                    "offsetEnd": 951,
                    "columnNum": 75
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 3 performance band ",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_3_PERFORMANCE_BAND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 952,
                    "offsetEnd": 952,
                    "columnNum": 76
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 4 performance band ",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_4_PERFORMANCE_BAND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 953,
                    "offsetEnd": 953,
                    "columnNum": 77
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 5 performance band ",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_5_PERFORMANCE_BAND",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 954,
                    "offsetEnd": 954,
                    "columnNum": 78
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Grade 3 Reading Subscore",
                "otherPossibleNames": [],
                "logicalName": "GRADE_3_READING_SUBSCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 955,
                    "offsetEnd": 957,
                    "columnNum": 79
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Third Grade Reading Guarantee Promotion Score Met",
                "otherPossibleNames": [],
                "logicalName": "THIRD_GRADE_READING_GUARANTEE_PROMOTION_SCORE_MET",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 958,
                    "offsetEnd": 958,
                    "columnNum": 80
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Overall Scale Score",
                "otherPossibleNames": [],
                "logicalName": "OELPA_OVERALL_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 959,
                    "offsetEnd": 962,
                    "columnNum": 81
                },
                "fieldLength": 4,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Overall Scale Score Standard Error",
                "otherPossibleNames": [],
                "logicalName": "OELPA_OVERALL_SCALE_SCORE_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 963,
                    "offsetEnd": 966,
                    "columnNum": 82
                },
                "fieldLength": 4,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Proficiency Status",
                "otherPossibleNames": [],
                "logicalName": "OELPA_PROFICIENCY_STATUS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 967,
                    "offsetEnd": 969,
                    "columnNum": 83
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Comprehension Scale Score",
                "otherPossibleNames": [],
                "logicalName": "OELPA_COMPREHENSION_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 970,
                    "offsetEnd": 973,
                    "columnNum": 84
                },
                "fieldLength": 4,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Comprehension Scale Score Standard Error",
                "otherPossibleNames": [],
                "logicalName": "OELPA_COMPREHENSION_SCALE_SCORE_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 974,
                    "offsetEnd": 977,
                    "columnNum": 85
                },
                "fieldLength": 4,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Listening Scale Score",
                "otherPossibleNames": [],
                "logicalName": "OELPA_LISTENING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 978,
                    "offsetEnd": 980,
                    "columnNum": 86
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Listening Scale Score Standard Error",
                "otherPossibleNames": [],
                "logicalName": "OELPA_LISTENING_SCALE_SCORE_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 981,
                    "offsetEnd": 983,
                    "columnNum": 87
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Listening Performance Level",
                "otherPossibleNames": [],
                "logicalName": "OELPA_LISTENING_PERFORMANCE_LEVEL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 984,
                    "offsetEnd": 986,
                    "columnNum": 88
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Reading Scale Score",
                "otherPossibleNames": [],
                "logicalName": "OELPA_READING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 987,
                    "offsetEnd": 989,
                    "columnNum": 89
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Reading Scale Score Standard Error",
                "otherPossibleNames": [],
                "logicalName": "OELPA_READING_SCALE_SCORE_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 990,
                    "offsetEnd": 992,
                    "columnNum": 90
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Reading Performance Level",
                "otherPossibleNames": [],
                "logicalName": "OELPA_READING_PERFORMANCE_LEVEL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 993,
                    "offsetEnd": 995,
                    "columnNum": 91
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Speaking Scale Score",
                "otherPossibleNames": [],
                "logicalName": "OELPA_SPEAKING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 996,
                    "offsetEnd": 998,
                    "columnNum": 92
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Speaking Scale Score Standard Error",
                "otherPossibleNames": [],
                "logicalName": "OELPA_SPEAKING_SCALE_SCORE_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 999,
                    "offsetEnd": 1001,
                    "columnNum": 93
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Speaking Performance Level",
                "otherPossibleNames": [],
                "logicalName": "OELPA_SPEAKING_PERFORMANCE_LEVEL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1002,
                    "offsetEnd": 1004,
                    "columnNum": 94
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Writing Scale Score",
                "otherPossibleNames": [],
                "logicalName": "OELPA_WRITING_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1005,
                    "offsetEnd": 1007,
                    "columnNum": 95
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Writing Scale Score Standard Error",
                "otherPossibleNames": [],
                "logicalName": "OELPA_WRITING_SCALE_SCORE_STANDARD_ERROR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1008,
                    "offsetEnd": 1010,
                    "columnNum": 96
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "OELPA Writing Performance Level",
                "otherPossibleNames": [],
                "logicalName": "OELPA_WRITING_PERFORMANCE_LEVEL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1011,
                    "offsetEnd": 1013,
                    "columnNum": 97
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Overall Raw score",
                "otherPossibleNames": [],
                "logicalName": "OVERALL_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1014,
                    "offsetEnd": 1016,
                    "columnNum": 98
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 1 Raw Score",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_1_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1017,
                    "offsetEnd": 1019,
                    "columnNum": 99
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 2 Raw Score",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1020,
                    "offsetEnd": 1022,
                    "columnNum": 100
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 3 Raw Score",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_3_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1023,
                    "offsetEnd": 1025,
                    "columnNum": 101
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 4 Raw Score",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_4_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1026,
                    "offsetEnd": 1028,
                    "columnNum": 102
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Subscore 5 Raw Score",
                "otherPossibleNames": [],
                "logicalName": "SUBSCORE_5_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 1029,
                    "offsetEnd": 1031,
                    "columnNum": 103
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
           {
               "physicalName": "Writing Item 1 Organization Score",
               "otherPossibleNames": [],
               "logicalName": "WRITING_ITEM_1_ORGANIZATION_SCORE",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1032,
                   "offsetEnd": 1033,
                   "columnNum": 104
               },
               "fieldLength": 2,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Writing Item 1 Elaboration Score",
               "otherPossibleNames": [],
               "logicalName": "WRITING_ITEM_1_ELABORATION_SCORE",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1034,
                   "offsetEnd": 1035,
                   "columnNum": 105
               },
               "fieldLength": 2,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Writing Item 1 Conventions Score",
               "otherPossibleNames": [],
               "logicalName": "WRITING_ITEM_1_CONVENTIONS_SCORE",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1036,
                   "offsetEnd": 1037,
                   "columnNum": 106
               },
               "fieldLength": 2,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Writing Item 2 Organization Score",
               "otherPossibleNames": [],
               "logicalName": "WRITING_ITEM_2_ORGANIZATION_SCORE",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1038,
                   "offsetEnd": 1039,
                   "columnNum": 107
               },
               "fieldLength": 2,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Writing Item 2 Elaboration Score",
               "otherPossibleNames": [],
               "logicalName": "WRITING_ITEM_2_ELABORATION_SCORE",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1040,
                   "offsetEnd": 1041,
                   "columnNum": 108
               },
               "fieldLength": 2,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Writing Item 2 Conventions Score",
               "otherPossibleNames": [],
               "logicalName": "WRITING_ITEM_2_CONVENTIONS_SCORE",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1042,
                   "offsetEnd": 1043,
                   "columnNum": 109
               },
               "fieldLength": 2,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: English Language Arts I",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Language_ARTS_I",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1044,
                   "offsetEnd": 1044,
                   "columnNum": 110
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: English Language Arts II",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Language_ARTS_II",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1045,
                   "offsetEnd": 1045,
                   "columnNum": 111
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: Algebra I",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Indicator_ALGEBRA_I",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1046,
                   "offsetEnd": 1046,
                   "columnNum": 112
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: Geometry",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Retester_INDICATOR_GEOMETRY",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1047,
                   "offsetEnd": 1047,
                   "columnNum": 113
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: Integrated Mathematics I",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Integrated_MATHEMATICS_I",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1048,
                   "offsetEnd": 1048,
                   "columnNum": 114
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: Integrated Mathematics II",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Integrated_MATHEMATICS_II",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1049,
                   "offsetEnd": 1049,
                   "columnNum": 115
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: Biology",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Retester_INDICATOR_BIOLOGY",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1050,
                   "offsetEnd": 1050,
                   "columnNum": 116
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: American Government",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Indicator_AMERICAN_GOVERNMENT",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1051,
                   "offsetEnd": 1051,
                   "columnNum": 117
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           },
           {
               "physicalName": "Retester Indicator: American History",
               "otherPossibleNames": [],
               "logicalName": "RETESTER_INDICATOR_Indicator_AMERICAN_HISTORY",
               "formatMask": null,
               "isFieldRequired": "Y",
               "canBeNull": "Y",
               "fieldOffset": {
                   "offsetStart": 1052,
                   "offsetEnd": 1052,
                   "columnNum": 118
               },
               "fieldLength": 1,
               "fieldPrecision": null,
               "expectedValues": [],
               "dataTypes": "STRING",
               "scale": null
           }
		]
	},
	"fileExtensions": [".txt"]
}