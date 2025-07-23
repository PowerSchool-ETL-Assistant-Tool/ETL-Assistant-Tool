{
    "encoding": "UTF-8",
    "format": {
        "@type": "Delimited",
        "formatName": "CMAS_SCI_SS_COMMA_1819",
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
                "logicalName": "TESTING_SCHOOL_CODE",
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
                "expectedValues": ["04", "05", "07", "08", "11"],
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
                "logicalName": "FILLER",
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
                "expectedValues": [],
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
                "physicalName": "StudentWithDisabilities",
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
                "logicalName": "LANGUAGE_BACKGROUND",
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
                "logicalName": "LANGUAGE_PROFICIENCY",
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
                "logicalName": "TITLE_1",
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
                "physicalName": "Filler",
                "otherPossibleNames": [],
                "logicalName": "FILLER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 36
                },
                "fieldLength": 20,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SessionName",
                "otherPossibleNames": [],
                "logicalName": "SESSIONNAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 37
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
                    "columnNum": 38
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
                    "columnNum": 39
                },
                "fieldLength": 5,
                "expectedValues": ["SS04S", "SC05S", "SS07S", "SC08S", "SCHSS"],
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
                    "columnNum": 40
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
                    "columnNum": 41
                },
                "fieldLength": 1,
                "expectedValues": ["Y", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SeparateAlternateLocation",
                "otherPossibleNames": [],
                "logicalName": "SEPARATEALTERNATELOCATION",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 42
                },
                "fieldLength": 1,
                "expectedValues": ["Y", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SmallTestingGroup",
                "otherPossibleNames": [],
                "logicalName": "SMALLTESTINGGROUP",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 43
                },
                "fieldLength": 1,
                "expectedValues": ["Y", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "SpecializedEquipmentOrFurniture",
                "otherPossibleNames": [],
                "logicalName": "SPECIALIZEDEQUIPMENTORFURNITURE",
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
                "physicalName": "SpecifiedAreaOrSetting",
                "otherPossibleNames": [],
                "logicalName": "SPECIFIEDAREAORSETTING",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 45
                },
                "fieldLength": 1,
                "expectedValues": ["Y", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TimeOfDay",
                "otherPossibleNames": [],
                "logicalName": "TIMEOFDAY",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 46
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
                    "columnNum": 47
                },
                "fieldLength": 2,
                "expectedValues": ["01", "02", "03", "04", "05", "06", "07", ""],
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
                    "columnNum": 48
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
                    "columnNum": 49
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
                    "columnNum": 50
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
                    "columnNum": 51
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
                    "columnNum": 52
                },
                "fieldLength": 1,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "LargePrint",
                "otherPossibleNames": [],
                "logicalName": "LARGEPRINT",
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
                "scale": null
            },
            {
                "physicalName": "Braille",
                "otherPossibleNames": [],
                "logicalName": "BRAILLE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 54
                },
                "fieldLength": 2,
                "expectedValues": ["01", ""],
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
                    "columnNum": 55
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
                    "columnNum": 56
                },
                "fieldLength": 2,
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
                    "columnNum": 57
                },
                "fieldLength": 2,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ScribeforMathScienceandSocialStudies",
                "otherPossibleNames": [],
                "logicalName": "SCRIBEFORMATHEMATICS_SCIENCEANDSOCIALSTUDIES",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 58
                },
                "fieldLength": 2,
                "expectedValues": ["01", "02", "03", "04"],
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
                    "columnNum": 59
                },
                "fieldLength": 1,
                "expectedValues": ["Y", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "AdministrationDirectionsClarifiedinStudentsNativeLanguage",
                "otherPossibleNames": [],
                "logicalName": "ADMINISTRATIONDIRECTIONSCLARIFIEDINSTUDENTSNATIVELANGUAGE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 60
                },
                "fieldLength": 3,
                "expectedValues": ["SPA", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "NonEnglishResponse",
                "otherPossibleNames": [],
                "logicalName": "NON-ENGLISHRESPONSE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 61
                },
                "fieldLength": 2,
                "expectedValues": ["01", "02", "03", "04"],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "SpanishTransadaptationoftheAssessment",
                "otherPossibleNames": [],
                "logicalName": "SPANISHTRANSADAPTATIONOFTHE_ASSESSMENT",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 62
                },
                "fieldLength": 3,
                "expectedValues": ["SPA", ""],
                "dataTypes": "STRING",
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
                    "columnNum": 63
                },
                "fieldLength": 1,
                "expectedValues": ["Y", ""],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TextToSpeech",
                "otherPossibleNames": [],
                "logicalName": "TEXTTOSPEECH",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 64
                },
                "fieldLength": 2,
                "expectedValues": ["02", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "AuditoryPresentationOralScriptorSigner",
                "otherPossibleNames": [],
                "logicalName": "AUDITORYPRESENTATIONORALSCRIPTORSIGNER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 65
                },
                "fieldLength": 2,
                "expectedValues": ["01", "02", ""],
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
                    "columnNum": 66
                },
                "fieldLength": 1,
                "expectedValues": [],
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
                    "columnNum": 67
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
                    "columnNum": 68
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
                    "columnNum": 69
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
                    "columnNum": 70
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
                    "columnNum": 71
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
                    "columnNum": 72
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
                    "columnNum": 73
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
                    "columnNum": 74
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
                    "columnNum": 75
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
                    "columnNum": 76
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
                    "columnNum": 77
                },
                "fieldLength": 2,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Unit1NumberofAttemptedItems",
                "otherPossibleNames": [],
                "logicalName": "UNIT1NUMBEROFATTEMPTEDITEMS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 78
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
                    "columnNum": 79
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
                    "columnNum": 80
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
                    "columnNum": 81
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
                    "columnNum": 82
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
                    "columnNum": 83
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
                    "columnNum": 84
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
                    "columnNum": 85
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
                    "columnNum": 86
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
                    "columnNum": 87
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
                    "columnNum": 88
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
                    "columnNum": 89
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
                    "columnNum": 90
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
                    "columnNum": 91
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
                    "columnNum": 92
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
                    "columnNum": 93
                },
                "fieldLength": 2,
                "expectedValues": ["01", "02", "03", "04", "05", "06", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Unit1TestStartDateTime",
                "otherPossibleNames": [],
                "logicalName": "SECTION1ONLINETESTSTARTDATETIME",
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
                "physicalName": "Unit1TestEndDateTime",
                "otherPossibleNames": [],
                "logicalName": "SECTION1ONLINETESTENDDATETIME",
                "formatMask": "yyyy-MM-ddTHH:mm:ss",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 95
                },
                "fieldLength": 19,
                "expectedValues": [],
                "dataTypes": "DATETIME",
                "scale": null
            },
            {
                "physicalName": "Unit2TestStartDateTime",
                "otherPossibleNames": [],
                "logicalName": "SECTION2ONLINETESTSTARTDATETIME",
                "formatMask": "yyyy-MM-ddTHH:mm:ss",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 96
                },
                "fieldLength": 19,
                "expectedValues": [],
                "dataTypes": "DATETIME",
                "scale": null
            },
            {
                "physicalName": "Unit2TestEndDateTime",
                "otherPossibleNames": [],
                "logicalName": "SECTION2ONLINETESTENDDATETIME",
                "formatMask": "yyyy-MM-ddTHH:mm:ss",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 97
                },
                "fieldLength": 19,
                "expectedValues": [],
                "dataTypes": "DATETIME",
                "scale": null
            },
            {
                "physicalName": "Unit3TestStartDateTime",
                "otherPossibleNames": [],
                "logicalName": "SECTION3ONLINETESTSTARTDATETIME",
                "formatMask": "yyyy-MM-ddTHH:mm:ss",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 98
                },
                "fieldLength": 19,
                "expectedValues": [],
                "dataTypes": "DATETIME",
                "scale": null
            },
            {
                "physicalName": "Unit3TestEndDateTime",
                "otherPossibleNames": [],
                "logicalName": "SECTION3ONLINETESTENDDATETIME",
                "formatMask": "yyyy-MM-ddTHH:mm:ss",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 99
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
                    "columnNum": 100
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
                    "columnNum": 101
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
                    "columnNum": 102
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
                    "columnNum": 103
                },
                "fieldLength": 60,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "TestingSchoolName",
                "otherPossibleNames": [],
                "logicalName": "TESTING_SCHOOL_NAME",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 104
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
                    "columnNum": 105
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
                    "columnNum": 106
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
                    "columnNum": 107
                },
                "fieldLength": 2,
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
                    "columnNum": 108
                },
                "fieldLength": 2,
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
                    "columnNum": 109
                },
                "fieldLength": 2,
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
                    "columnNum": 110
                },
                "fieldLength": 2,
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
                    "columnNum": 111
                },
                "fieldLength": 2,
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
                    "columnNum": 112
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "CSEM",
                "otherPossibleNames": [],
                "logicalName": "CSEM_OVERALL",
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
                "physicalName": "PerfLVL",
                "otherPossibleNames": [],
                "logicalName": "PERF_LVL_OVERALL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 114
                },
                "fieldLength": 1,
                "expectedValues": ["1", "2", "3", "4", ""],
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
                    "columnNum": 115
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "PTS_POSS_OVERALL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 116
                },
                "fieldLength": 9,
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
                    "columnNum": 117
                },
                "fieldLength": 2,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std1SSCO",
                "otherPossibleNames": [],
                "logicalName": "STD1_SCALE_SCORE",
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
                "physicalName": "Std1CSEM",
                "otherPossibleNames": [],
                "logicalName": "STD1_CSEM",
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
                "physicalName": "Std1PerfLvl",
                "otherPossibleNames": [],
                "logicalName": "STD1_PERF_LVL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 120
                },
                "fieldLength": 1,
                "expectedValues": ["1", "2", "3", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_PTS_POSS",
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
                "physicalName": "Std2SSCO",
                "otherPossibleNames": [],
                "logicalName": "STD2_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 122
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2CSEM",
                "otherPossibleNames": [],
                "logicalName": "STD2_CSEM",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 123
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PerfLvl",
                "otherPossibleNames": [],
                "logicalName": "STD2_PERF_LVL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 124
                },
                "fieldLength": 1,
                "expectedValues": ["1", "2", "3", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 125
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3SSCO",
                "otherPossibleNames": [],
                "logicalName": "STD3_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 126
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3CSEM",
                "otherPossibleNames": [],
                "logicalName": "STD3_CSEM",
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
                "physicalName": "Std3PerfLvl",
                "otherPossibleNames": [],
                "logicalName": "STD3_PERF_LVL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 128
                },
                "fieldLength": 1,
                "expectedValues": ["1", "2", "3", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_PTS_POSS",
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
                "physicalName": "Std4SSCO",
                "otherPossibleNames": [],
                "logicalName": "STD4_SCALE_SCORE",
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
                "physicalName": "Std4CSEM",
                "otherPossibleNames": [],
                "logicalName": "STD4_CSEM",
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
                "physicalName": "Std4PerfLvl",
                "otherPossibleNames": [],
                "logicalName": "STD4_PERF_LVL",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 132
                },
                "fieldLength": 1,
                "expectedValues": ["1", "2", "3", ""],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD4_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 133
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PGC1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC1_RAW_SCORE",
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
                "physicalName": "Std1PGC1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC1_PTS_POSS",
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
                "physicalName": "Std1PGC1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC1_PCT_CORR",
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
                "physicalName": "Std1PGC2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC2_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PGC2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC2_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PGC2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC2_PCT_CORR",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PGC3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC3_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PGC3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC3_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1PGC3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_PGC3_PCT_CORR",
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
                    "columnNum": 143
                },
                "fieldLength": 24,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std2PGC1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC1_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC1_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC1_PCT_CORR",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC2_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC2_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC2_PCT_CORR",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC3_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC3_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC3_PCT_CORR",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC4RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC4_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC4PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC4_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2PGC4PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_PGC4_PCT_CORR",
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
                    "columnNum": 156
                },
                "fieldLength": 12,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std3PGC1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC1_RAW_SCORE",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC1_PTS_POSS",
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
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC1_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 159
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 160
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 161
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC2_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 162
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC3_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 163
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC3_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 164
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3PGC3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_PGC3_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 165
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
                    "columnNum": 166
                },
                "fieldLength": 24,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std4PGC1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD4_PGC1_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 167
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4PGC1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD4_PGC1_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 168
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4PGC1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD4_PGC1_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 169
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4PGC2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD4_PGC2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 170
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4PGC2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD4_PGC2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 171
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4PGC2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD4_PGC2_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 172
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
                    "columnNum": 173
                },
                "fieldLength": 36,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std1GLE1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE1_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 174
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE1_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 175
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE1_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 176
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 177
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 178
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE2_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 179
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE3_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 180
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE3_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 181
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE3_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 182
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE4RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE4_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 183
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE4PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE4_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 184
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE4PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE4_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 185
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE5RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE5_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 186
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE5PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE5_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 187
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE5PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE5_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 188
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE6RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE6_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 189
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE6PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE6_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 190
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std1GLE6PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD1_GLE6_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 191
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
                    "columnNum": 192
                },
                "fieldLength": 12,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std2GLE1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE1_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 193
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE1_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 194
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE1_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 195
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 196
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 197
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE2_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 198
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE3_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 199
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE3_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 200
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE3_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 201
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE4RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE4_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 202
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE4PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE4_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 203
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE4PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE4_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 204
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE5RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE5_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 205
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE5PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE5_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 206
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE5PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE5_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 207
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE6RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE6_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 208
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE6PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE6_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 209
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE6PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE6_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 210
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE7RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE7_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 211
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE7PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE7_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 212
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE7PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE7_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 213
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE8RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE8_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 214
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE8PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE8_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 215
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE8PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE8_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 216
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE9RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE9_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 217
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE9PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE9_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 218
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std2GLE9PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD2_GLE9_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 219
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
                    "columnNum": 220
                },
                "fieldLength": 12,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std3GLE1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE1_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 221
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE1_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 222
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE1_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 223
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 224
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 225
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE2_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 226
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE3_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 227
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE3_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 228
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE3_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 229
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE4RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE4_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 230
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE4PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE4_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 231
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE4PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE4_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 232
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE5RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE5_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 233
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE5PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE5_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 234
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE5PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE5_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 235
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE6RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE6_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 236
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE6PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE6_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 237
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE6PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE6_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 238
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE7RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE7_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 239
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE7PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE7_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 240
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std3GLE7PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD3_GLE7_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 241
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
                    "columnNum": 242
                },
                "fieldLength": 12,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Std4GLE1RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE1_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 243
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE1PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE1_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 244
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE1PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE1_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 245
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE2RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE2_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 246
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE2PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE2_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 247
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE2PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE2_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 248
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE3RawSc",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE3_RAW_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 249
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE3PtsPoss",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE3_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 250
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "Std4GLE3PctEarned",
                "otherPossibleNames": [],
                "logicalName": "STD4_GLE3_PCT_CORR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 251
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
                    "columnNum": 252
                },
                "fieldLength": 36,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "CRSSCO",
                "otherPossibleNames": [],
                "logicalName": "CR_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 253
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "CRCSEM",
                "otherPossibleNames": [],
                "logicalName": "CR_CSEM",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 254
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "CRPtsPoss",
                "otherPossibleNames": [],
                "logicalName": "CR_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 255
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "SRSSCO",
                "otherPossibleNames": [],
                "logicalName": "SR_SCALE_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 256
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "SRCSEM",
                "otherPossibleNames": [],
                "logicalName": "SR_CSEM",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 257
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "SRPtsPoss",
                "otherPossibleNames": [],
                "logicalName": "SR_PTS_POSS",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 258
                },
                "fieldLength": 3,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ScItem",
                "otherPossibleNames": [],
                "logicalName": "SC_ITEM",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 259
                },
                "fieldLength": 100,
                "expectedValues": ["0", "1", "2", "3", "4", "5", "6", ""],
                "dataTypes": "INTEGER",
                "scale": null
            }
        ]
    },
    "fileExtensions": [".csv"]
}