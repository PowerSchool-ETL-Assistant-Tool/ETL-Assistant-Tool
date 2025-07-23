{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".csv"
    ],
    "format": {
        "@type": "Delimited",
        "formatName": "LEAP_3_8_1718_commaDelimited",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "recordLength": "",
        "hasHeader": true,
        "naturalKey": [
              "LASID",
              "DISTRICT_CODE",
              "SCHOOL_CODE",
              "STUDENT_LAST_NAME",
              "STUDENT_FIRST_NAME",
              "STUDENT_MIDDLE_INITIAL",
              "ADMINISTRATIONDATE"
          ],
        "fields": [
            {
                "physicalName": "SchoolSystemNbr",
                "otherPossibleNames": [],
                "logicalName": "DISTRICT_CODE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 1
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "columnNum": 2
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 3
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "columnNum": 4
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "columnNum": 5
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "columnNum": 6
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "columnNum": 7
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 8
                },
                "fieldLength": 500,
                "fieldPrecision": null,
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
                    "columnNum": 9
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 10
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "03",
                    "04",
                    "05",
                    "06",
                    "07",
                    "08"
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 11
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "M",
                    "F",
                    "I"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 12
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "I"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 13
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 14
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "0",
                    "1",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Limited English Proficient",
                "otherPossibleNames": [],
                "logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 15
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 16
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "Y",
                    "N"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 17
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "Y",
                    "N"
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Summarized McKinney Vento Act",
                "otherPossibleNames": [],
                "logicalName": "SUMMARIZED_MCKINNEY-VENTO_ACT_(HOMELESS)",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 18
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 19
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "Y",
                    "N"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 20
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "Y",
                    "N"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 21
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "Y",
                    "N"
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 22
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "P",
                    "O",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 23
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 24
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ELAScaleScore",
                "otherPossibleNames": [],
                "logicalName": "SCALE_SCORE_ELA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 25
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 26
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "4",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 27
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "ADV",
                    "MAS",
                    "BAS",
                    "APP",
                    "UNS",
                    "INC",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 28
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 29
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 30
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 31
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 32
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 33
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 34
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 35
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "P",
                    "O",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 36
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 37
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "MathScaleScore",
                "otherPossibleNames": [],
                "logicalName": "SCALE_SCORE_MATH",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 38
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 39
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "4",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 40
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "ADV",
                    "MAS",
                    "BAS",
                    "APP",
                    "UNS",
                    "INC",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 41
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Products & Quotients_Solve Multiplication & Division Problems",
                "otherPossibleNames": [],
                "logicalName": "PRODUCTS_&_QUOTIENTS_SOLVEMULTIPLICATION_&_DIVISION_PROBLEMS_RATING_MA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 42
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 43
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 44
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 45
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Compare & Solve Problems with Fractions",
                "otherPossibleNames": [],
                "logicalName": "SOLVE_TIME_AREA_MEASUREMENT_&_ESTIMATION_PROBLEMS_RATING_MA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 46
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 47
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 48
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 49
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 50
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 51
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 501,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 502,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Expressions Inequalities & Equations",
                "otherPossibleNames": [],
                "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_MA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 503,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Analyze Proportional Relationships & Solve Problems",
                "otherPossibleNames": [],
                "logicalName": "MODELING_&_APPLICATION_RATING_MA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 504,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Operations & Rational Numbers",
                "otherPossibleNames": [],
                "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_MA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 505,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 506,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 507,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Solving Linear Equations_Systems of Linear Equations",
                "otherPossibleNames": [],
                "logicalName": "SOLVING_LINEAR_EQUATIONS_SYSTEMSLINEAR_EQUATIONS_OF_LINEAR_EQUATIONS_RATING_MA",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 508,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 509,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 510,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 511,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 512,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 513,
                "fieldPrecision": null,
                "expectedValues": [
                    "P",
                    "O",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 514,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 515,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SocialScaleScore",
                "otherPossibleNames": [],
                "logicalName": "SCALE_SCORE_SOCIAL_STUDIES",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 516,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 517,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "4",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 518,
                "fieldPrecision": null,
                "expectedValues": [
                    "ADV",
                    "MAS",
                    "BAS",
                    "APP",
                    "UNS",
                    "INC",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 519,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 520,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 521,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 522,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "3",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 523,
                "fieldPrecision": null,
                "expectedValues": [
                    "P",
                    "O",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 524,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 525,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 526,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 527,
                "fieldPrecision": null,
                "expectedValues": [
                    "1",
                    "2",
                    "4",
                    ""
                ],
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 528,
                "fieldPrecision": null,
                "expectedValues": [
                    "ADV",
                    "MAS",
                    "BAS",
                    "APP",
                    "UNS",
                    "INC",
                    ""
                ],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 529,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 530,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 531,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
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
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 532,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "AdministrationDate",
                "otherPossibleNames": [],
                "logicalName": "ADMINISTRATIONDATE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 52
                },
                "fieldLength": 533,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            }
        ]
    }
}