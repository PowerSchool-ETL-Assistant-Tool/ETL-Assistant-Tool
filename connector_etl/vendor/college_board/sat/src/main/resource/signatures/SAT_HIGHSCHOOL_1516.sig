{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "quoteDelim": "\"",
    "fieldDelim": "^",
    "hasHeader": true,
    "formatName": "SAT_HIGHSCHOOL_1516",
    "naturalKey": [],
    "fields": [
      {
        "physicalName": "Attending Institution Code",
        "otherPossibleNames": [],
        "logicalName": "AI_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 1
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Short Name of Attending Institution",
        "otherPossibleNames": [],
        "logicalName": "AI_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler1",
        "otherPossibleNames": [],
        "logicalName": "FILLER_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Cohort Year",
        "otherPossibleNames": [],
        "logicalName": "COHORT_YEAR",
        "formatMask": "yyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "District Name",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Last or Surname",
        "otherPossibleNames": [],
        "logicalName": "NAME_LAST",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First Name",
        "otherPossibleNames": [],
        "logicalName": "NAME_FIRST",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Middle Initial",
        "otherPossibleNames": [],
        "logicalName": "NAME_MI",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Sex",
        "otherPossibleNames": [],
        "logicalName": "SEX",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 1,
        "expectedValues": ["M","F","U"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Race/Ethnicity Student Response: Cuban Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_CUBAN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Race/Ethnicity Student Response: Mexican Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_MEXICAN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RACE_ETH_ASIAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_ASIAN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Race/Ethnicity Student Response: ",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_PUERTORICAN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RACE_ETH_HAWAIIAN_PI",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_HAWAIIAN_PI",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RACE_ETH_WHITE",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_WHITE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RACE_ETH_OTHER",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_OTHER",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler2",
        "otherPossibleNames": [],
        "logicalName": "FILLER_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Derived Aggregate Race Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "DERIVED_AGGREGATE_RACE_ETH",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 2,
        "expectedValues": ["0","1","2","3","4","8","9","10","12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Date",
        "otherPossibleNames": [],
        "logicalName": "BIRTH_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Filler3",
        "otherPossibleNames": [],
        "logicalName": "FILLER_3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Security Number",
        "otherPossibleNames": [],
        "logicalName": "Social Security Number",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "College Board Student ID",
        "otherPossibleNames": [],
        "logicalName": "College Board Student ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Secondary School Student ID",
        "otherPossibleNames": [],
        "logicalName": "Secondary School Student ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 13,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Address Street Number and Name",
        "otherPossibleNames": [],
        "logicalName": "Address Street Number and Name",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Address Line 2 Text",
        "otherPossibleNames": [],
        "logicalName": "Address Line 2 Text",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Address City",
        "otherPossibleNames": [],
        "logicalName": "Address City",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Address State Abbreviation",
        "otherPossibleNames": [],
        "logicalName": "Address State Abbreviation",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "U.S. ZIP or International Post Code",
        "otherPossibleNames": [],
        "logicalName": "U.S. ZIP or International Post Code",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 17,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "County FIPS Code",
        "otherPossibleNames": [],
        "logicalName": "County FIPS Code",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Country Code",
        "otherPossibleNames": [],
        "logicalName": "Country Code",
        "formatMask": "yyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Province",
        "otherPossibleNames": [],
        "logicalName": "Province",
        "formatMask": "yyyyMM",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Telephone Number",
        "otherPossibleNames": [],
        "logicalName": "Telephone Number",
        "formatMask": "MMyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 24,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Email Address",
        "otherPossibleNames": [],
        "logicalName": "Email Address",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 128,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Projected Graduation Date",
        "otherPossibleNames": [],
        "logicalName": "Projected Graduation Date",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Geomarket",
        "otherPossibleNames": [],
        "logicalName": "Geomarket",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Foreign Address Indicator",
        "otherPossibleNames": [],
        "logicalName": "Foreign Address Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Home-Schooled Indicator",
        "otherPossibleNames": [],
        "logicalName": "Home-Schooled Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Assessment Date",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Assessment Date",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Grade Level When Assessed",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Grade Level When Assessed",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 2,
        "expectedValues": ["1","2","4","5","6","7","8","10","11","12","13"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Revised Score Indicator",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Revised Score Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["Z"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Total Score",
        "otherPossibleNames": [],
        "logicalName": "Scale Scores",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Evidence-Based Reading and Writing Section Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Evidence-Based Reading and Writing Section Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Math Section Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Math Section Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Reading Test Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Reading Test Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 44
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Writing and Language Test Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Writing and Language Test Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 45
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Math Test Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Math Test Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 46
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Analysis in Science Cross-Test Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Analysis in Science Cross-Test Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 47
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Analysis in History/Social Science Cross-Test Score",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Analysis in History/Social Science Cross-Test Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 48
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Relevant Words in Context Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Relevant Words in Context Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 49
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Command of Evidence Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Command of Evidence Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 50
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Expression of Ideas Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Expression of Ideas Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 51
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Standard English Conventions Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Standard English Conventions Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 52
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Heart of Algebra Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Heart of Algebra Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 53
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Passport to Advanced Mathematics Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Passport to Advanced Mathematics Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 54
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Latest SAT: Problem Solving and Data Analysis Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Problem Solving and Data Analysis Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 55
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Essay Reading Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Essay Reading Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Latest SAT: Essay Analysis Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Essay Analysis Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Essay Analysis Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Essay Analysis Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Latest SAT: Critical Reading Score (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Critical Reading Score (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 59
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Math Score (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Math Score (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 60
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Writing Subscore (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Writing Subscore (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 61
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Essay Subscore (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Essay Subscore (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 62
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Writing Multiple Choice Subscore",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Writing Multiple Choice Subscore",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 63
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Latest SAT: Essay Locator ID",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT: Essay Locator ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 64
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SAT Scores Admin. 2",
        "otherPossibleNames": [],
        "logicalName": "SAT Scores Admin. 2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 65
        },
        "fieldLength": 83,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SAT Scores Admin. 3",
        "otherPossibleNames": [],
        "logicalName": "SAT Scores Admin. 3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 66
        },
        "fieldLength": 83,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SAT Scores Admin. 4",
        "otherPossibleNames": [],
        "logicalName": "SAT Scores Admin. 4",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 67
        },
        "fieldLength": 83,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SAT Scores Admin. 5",
        "otherPossibleNames": [],
        "logicalName": "SAT Scores Admin. 5",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 68
        },
        "fieldLength": 83,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "SAT Scores Admin. 6",
        "otherPossibleNames": [],
        "logicalName": "SAT Scores Admin. 6",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 69
        },
        "fieldLength": 83,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest SAT Subject Assessment Date",
        "otherPossibleNames": [],
        "logicalName": "Latest SAT Subject Assessment Date",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum":70
        },
        "fieldLength": 10,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test Grade Level When Assessed",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test Grade Level When Assessed",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 71
        },
        "fieldLength": 2,
        "expectedValues": ["1","2","4","5","6","7","8","10","11","12","13"],
        "dataTypes": "INTEGER",
        "scale": null
      },{
        "physicalName": "Latest Subject Test Revised Score Indicator",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test Revised Score Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": ["Z"],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 1 Assessment Identifier",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 1 Assessment Identifier",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 83
        },
        "fieldLength": 2,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 1 Score",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 1 Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 74
        },
        "fieldLength": 3,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 1 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 1 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 75
        },
        "fieldLength": 2,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 1 Subscore 2",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 1 Subscore 2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 76
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 1 Subscore 3",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 1 Subscore 3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 77
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 2 Assessment Identifier",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 2 Assessment Identifier",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 2 Score",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 2 Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 79
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 2 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 2 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 80
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 2 Subscore 2",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 2 Subscore 2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 81
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 2 Subscore 3",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 2 Subscore 3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 82
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Assessment Identifier",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Assessment Identifier",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 83
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Score",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 84
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 2",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 85
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 86
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 3",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 87
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Previous Subject Test Scores Admin 2",
        "otherPossibleNames": [],
        "logicalName": "Previous Subject Test Scores Admin 2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 88
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Previous Subject Test Scores Admin 3",
        "otherPossibleNames": [],
        "logicalName": "Previous Subject Test Scores Admin 3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 89
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Previous Subject Test Scores Admin 4",
        "otherPossibleNames": [],
        "logicalName": "Previous Subject Test Scores Admin 4",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 90
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Previous Subject Test Scores Admin 5",
        "otherPossibleNames": [],
        "logicalName": "Previous Subject Test Scores Admin 5",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 91
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Previous Subject Test Scores Admin 6",
        "otherPossibleNames": [],
        "logicalName": "Previous Subject Test Scores Admin 6",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 92
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "National Total Score Percentile",
        "otherPossibleNames": [],
        "logicalName": "National Total Score Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 93
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "National Evidence-Based Reading and Writing Section Percentile",
        "otherPossibleNames": [],
        "logicalName": "National Evidence-Based Reading and Writing Section Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 94
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "National Math Section Percentile",
        "otherPossibleNames": [],
        "logicalName": "National Math Section Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 95
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "National Critical Reading Percentile(Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "National Critical Reading Percentile(Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 96
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "National Math Percentile (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "National Math Percentile (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 97
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "National Writing Percentile (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "National Writing Percentile (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 98
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Total Score Percentile",
        "otherPossibleNames": [],
        "logicalName": "State Total Score Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 99
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Evidence-Based Reading And Writing Percentile",
        "otherPossibleNames": [],
        "logicalName": "State Evidence-Based Reading And Writing Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 100
        },
        "fieldLength": 2,
        "expectedValues": ["                                                                                           "],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Math Percentile",
        "otherPossibleNames": [],
        "logicalName": "State Math Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 100
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Critical Reading (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "State Critical Reading (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 101
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Math Percentile (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "State Math Percentile (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 102
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Writing Percentile (Pre-2016 SAT)",
        "otherPossibleNames": [],
        "logicalName": "State Writing Percentile (Pre-2016 SAT)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 103
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 1 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 1 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 104
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 1 Subscore 1 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 1 Subscore 1 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 105
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 1 Subscore 2 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 1 Subscore 2 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 106
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 1 Subscore 3 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 1 Subscore 3 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 107
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 2 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 2 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 108
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 2 Subscore 1 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 2 Subscore 1 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Subject Test 2 Subscore 1 Percentile",
        "otherPossibleNames": [],
        "logicalName": "Subject Test 2 Subscore 1 Percentile",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1449,
          "offsetEnd": 1449,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1450,
          "offsetEnd": 1459,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1460,
          "offsetEnd": 1461,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Latest Subject Test 3 Subscore 1",
        "otherPossibleNames": [],
        "logicalName": "Latest Subject Test 3 Subscore 1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1418,
          "offsetEnd": 1419,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    "txt"
  ]
}