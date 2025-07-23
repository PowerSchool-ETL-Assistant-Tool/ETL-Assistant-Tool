{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "quoteDelim": "\"",
    "fieldDelim": "^",
    "hasHeader": true,
    "formatName": "psat_dummy",
    "naturalKey": [],
    "fields": [
      {
        "physicalName": "Graduation Year Identifier",
        "otherPossibleNames": [],
        "logicalName": "Graduation Year Identifier",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 2,
          "columnNum": 1
        },
        "fieldLength": 2,
        "expectedValues": ["16"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Last Name",
        "otherPossibleNames": [],
        "logicalName": "Last Name",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 3,
          "offsetEnd": 27,
          "columnNum": 2
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First Name",
        "otherPossibleNames": [],
        "logicalName": "First Name",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 28,
          "offsetEnd": 43,
          "columnNum": 3
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Middle Initial",
        "otherPossibleNames": [],
        "logicalName": "Middle Initial",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 44,
          "offsetEnd": 44,
          "columnNum": 4
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Address",
        "otherPossibleNames": [],
        "logicalName": "Address",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 45,
          "offsetEnd": 84,
          "columnNum": 5
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Country Code",
        "otherPossibleNames": [],
        "logicalName": "Country Code",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 85,
          "offsetEnd": 86,
          "columnNum": 6
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gender (Numeric)",
        "otherPossibleNames": [],
        "logicalName": "Gender (Numeric)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 87,
          "offsetEnd": 87,
          "columnNum": 7
        },
        "fieldLength": 1,
        "expectedValues": ["4","6","-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gender (Alpha)",
        "otherPossibleNames": [],
        "logicalName": "Gender (Alpha)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 88,
          "offsetEnd": 88,
          "columnNum": 8
        },
        "fieldLength": 1,
        "expectedValues": ["M","F","-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade Level",
        "otherPossibleNames": [],
        "logicalName": "Grade Level",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 89,
          "offsetEnd": 90,
          "columnNum": 9
        },
        "fieldLength": 2,
        "expectedValues": ["07","08","09","10","11","12","13","14","15"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ACT ID",
        "otherPossibleNames": [],
        "logicalName": "ACT ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 91,
          "offsetEnd": 99,
          "columnNum": 10
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Phone Type",
        "otherPossibleNames": [],
        "logicalName": "Phone Type",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 100,
          "offsetEnd": 100,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Date of Birth",
        "otherPossibleNames": [],
        "logicalName": "Date of Birth",
        "formatMask": "MMddyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 101,
          "offsetEnd": 106,
          "columnNum": 12
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Phone Number",
        "otherPossibleNames": [],
        "logicalName": "Phone Number",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 107,
          "offsetEnd": 116,
          "columnNum": 13
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "City",
        "otherPossibleNames": [],
        "logicalName": "City",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 117,
          "offsetEnd": 141,
          "columnNum": 14
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "State (Numeric)",
        "otherPossibleNames": [],
        "logicalName": "State (Numeric)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 117,
          "offsetEnd": 141,
          "columnNum": 15
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "State (Alpha)",
        "otherPossibleNames": [],
        "logicalName": "State (Alpha)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 142,
          "offsetEnd": 143,
          "columnNum": 16
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ZIP Code",
        "otherPossibleNames": [],
        "logicalName": "ZIP Code",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 146,
          "offsetEnd": 154,
          "columnNum": 17
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Expanded Date of Birth",
        "otherPossibleNames": [],
        "logicalName": "Expanded Date of Birth",
        "formatMask": "yyyyMMdd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 155,
          "offsetEnd": 162,
          "columnNum": 18
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Combined English/Writing (EW) Score",
        "otherPossibleNames": [],
        "logicalName": "Combined English/Writing (EW) Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 163,
          "offsetEnd": 164,
          "columnNum": 19
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Writing Subscore (WR)",
        "otherPossibleNames": [],
        "logicalName": "Writing Subscore (WR)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 165,
          "offsetEnd": 166,
          "columnNum": 20
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11","12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Comments on Essay",
        "otherPossibleNames": [],
        "logicalName": "Comments on Essay",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 171,
          "offsetEnd": 178,
          "columnNum": 21
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "State-Assigned Student ID Number(13-characters)",
        "otherPossibleNames": [],
        "logicalName": "State-Assigned Student ID Number(13-characters)",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 192,
          "offsetEnd": 204,
          "columnNum": 22
        },
        "fieldLength": 13,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "High School Code",
        "otherPossibleNames": [],
        "logicalName": "High School Code",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 205,
          "offsetEnd": 210,
          "columnNum": 23
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "High School Grades: English",
        "otherPossibleNames": [],
        "logicalName": "High School Grades: English",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 211,
          "offsetEnd": 212,
          "columnNum": 24
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "High School Grades: Mathematics",
        "otherPossibleNames": [],
        "logicalName": "High School Grades: Mathematics",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 214,
          "columnNum": 25
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "High School Grades: Social Studies",
        "otherPossibleNames": [],
        "logicalName": "High School Grades: Social Studies",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 216,
          "columnNum": 26
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "High School Grades: Natural Sciences",
        "otherPossibleNames": [],
        "logicalName": "High School Grades: Natural Sciences",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 217,
          "offsetEnd": 218,
          "columnNum": 27
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "High School Average",
        "otherPossibleNames": [],
        "logicalName": "High School Average",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 220,
          "offsetEnd": 222,
          "columnNum": 28
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Year of HS Graduation",
        "otherPossibleNames": [],
        "logicalName": "Year of HS Graduation",
        "formatMask": "yyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 223,
          "offsetEnd": 226,
          "columnNum": 29
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Expanded Test Date",
        "otherPossibleNames": [],
        "logicalName": "Expanded Test Date",
        "formatMask": "yyyyMM",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 227,
          "offsetEnd": 232,
          "columnNum": 30
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Date",
        "otherPossibleNames": [],
        "logicalName": "Test Date",
        "formatMask": "MMyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 233,
          "offsetEnd": 236,
          "columnNum": 31
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "State Ranks: English",
        "otherPossibleNames": [],
        "logicalName": "State Ranks: English",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 237,
          "offsetEnd": 239,
          "columnNum": 32
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Ranks: Mathematics",
        "otherPossibleNames": [],
        "logicalName": "State Ranks: Mathematics",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 240,
          "offsetEnd": 242,
          "columnNum": 33
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Ranks: Reading",
        "otherPossibleNames": [],
        "logicalName": "State Ranks: Reading",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 243,
          "offsetEnd": 245,
          "columnNum": 34
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State Ranks: Science",
        "otherPossibleNames": [],
        "logicalName": "State Ranks: Science",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 248,
          "columnNum": 35
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Location",
        "otherPossibleNames": [],
        "logicalName": "Test Location",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 249,
          "offsetEnd": 249,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["","D","F","S","Z"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Canadian Province",
        "otherPossibleNames": [],
        "logicalName": "Canadian Province",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 250,
          "offsetEnd": 251,
          "columnNum": 37
        },
        "fieldLength": 2,
        "expectedValues": ["AB","BC","MB","NB","NL","NT","NS","NU","ON","PE","QC","SK","YT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Canadian Postal Code",
        "otherPossibleNames": [],
        "logicalName": "Canadian Postal Code",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 253,
          "offsetEnd": 259,
          "columnNum": 38
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Corrected Report Indicator",
        "otherPossibleNames": [],
        "logicalName": "Corrected Report Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 260,
          "offsetEnd": 260,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": ["R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Scores: English",
        "otherPossibleNames": [],
        "logicalName": "Scale Scores",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 261,
          "offsetEnd": 262,
          "columnNum": 40
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Scores: Mathematics",
        "otherPossibleNames": [],
        "logicalName": "Scale Scores: Mathematics",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 263,
          "offsetEnd": 264,
          "columnNum": 41
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Scores: Reading",
        "otherPossibleNames": [],
        "logicalName": "Scale Scores: Reading",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 265,
          "offsetEnd": 266,
          "columnNum": 42
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Scores: Science",
        "otherPossibleNames": [],
        "logicalName": "Scale Scores: Science",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 267,
          "offsetEnd": 268,
          "columnNum": 43
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Scores: Composite",
        "otherPossibleNames": [],
        "logicalName": "Scale Scores: Composite",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 269,
          "offsetEnd": 270,
          "columnNum": 44
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Sum of Scale Scores",
        "otherPossibleNames": [],
        "logicalName": "Sum of Scale Scores",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 272,
          "offsetEnd": 274,
          "columnNum": 45
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory Standard Scores: Science & Technology",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory Standard Scores: Science & Technology",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 281,
          "offsetEnd": 282,
          "columnNum": 46
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory Standard Scores: Arts",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory Standard Scores: Arts",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 286,
          "columnNum": 47
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory Standard Scores: Social Service",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory Standard Scores: Social Service",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 290,
          "columnNum": 48
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory Standard Scores: Administration & Sales",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory Standard Scores: Administration & Sales",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 293,
          "offsetEnd": 294,
          "columnNum": 49
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory Standard Scores: Business Operations",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory Standard Scores: Business Operations",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 297,
          "offsetEnd": 298,
          "columnNum": 50
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory Standard Scores: Technical",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory Standard Scores: Technical",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 301,
          "offsetEnd": 302,
          "columnNum": 51
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "World-of-Work Map Regions",
        "otherPossibleNames": [],
        "logicalName": "World-of-Work Map Regions",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 303,
          "offsetEnd": 308,
          "columnNum": 52
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Usage/Mechanics",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Usage/Mechanics",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 320,
          "offsetEnd": 321,
          "columnNum": 53
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Rhetorical Skills",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Rhetorical Skills",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 322,
          "offsetEnd": 323,
          "columnNum": 54
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Elementary Algebra",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Elementary Algebra",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 324,
          "offsetEnd": 325,
          "columnNum": 55
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Algebra/Coord Geom",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Algebra/Coord Geom",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 326,
          "offsetEnd": 327,
          "columnNum": 56
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Plane Geom/Trig",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Plane Geom/Trig",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 328,
          "offsetEnd": 329,
          "columnNum": 57
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Soc Studies/Science",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Soc Studies/Science",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 330,
          "offsetEnd": 331,
          "columnNum": 58
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Subscores–test events before 09/2016: Arts/Literature",
        "otherPossibleNames": [],
        "logicalName": "Scale Subscores–test events before 09/2016: Arts/Literature",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 332,
          "offsetEnd": 333,
          "columnNum": 59
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory – US Ranks: Science & Technology",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory – US Ranks: Science & Technology",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 369,
          "offsetEnd": 370,
          "columnNum": 60
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory – US Ranks: Arts",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory – US Ranks: Arts",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 371,
          "offsetEnd": 372,
          "columnNum": 61
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory – US Ranks: Social Service",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory – US Ranks: Social Service",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 373,
          "offsetEnd": 374,
          "columnNum": 62
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory – US Ranks: Administration & Sales",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory – US Ranks: Administration & Sales",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 375,
          "offsetEnd": 376,
          "columnNum": 63
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory – US Ranks: Business Operations",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory – US Ranks: Business Operations",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 377,
          "offsetEnd": 378,
          "columnNum": 64
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interest Inventory – US Ranks: Technical",
        "otherPossibleNames": [],
        "logicalName": "Interest Inventory – US Ranks: Technical",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 379,
          "offsetEnd": 380,
          "columnNum": 65
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Local ID Number",
        "otherPossibleNames": [],
        "logicalName": "Local ID Number",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 381,
          "offsetEnd": 390,
          "columnNum": 66
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Profile Section",
        "otherPossibleNames": [],
        "logicalName": "Student Profile Section",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 401,
          "offsetEnd": 550,
          "columnNum": 67
        },
        "fieldLength": 150,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "EOS Release",
        "otherPossibleNames": [],
        "logicalName": "EOS Release",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 605,
          "offsetEnd": 605,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "INTEGER",
        "scale": null
      },{
        "physicalName": "Religious Affiliation",
        "otherPossibleNames": [],
        "logicalName": "Religious Affiliation",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 606,
          "offsetEnd": 607,
          "columnNum": 69
        },
        "fieldLength": 2,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Courses Taken or Planned",
        "otherPossibleNames": [],
        "logicalName": "Courses Taken or Planned",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 631,
          "offsetEnd": 660,
          "columnNum": 70
        },
        "fieldLength": 30,
        "expectedValues": ["1","2","3"],
        "dataTypes": "INTEGER",
        "scale": null
      },{
        "physicalName": "Grades Earned",
        "otherPossibleNames": [],
        "logicalName": "Grades Earned",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 661,
          "offsetEnd": 690,
          "columnNum": 71
        },
        "fieldLength": 29,
        "expectedValues": ["0","1","2","3","4"],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "State-Assigned Student ID Number",
        "otherPossibleNames": [],
        "logicalName": "State-Assigned Student ID Number",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 691,
          "offsetEnd": 700,
          "columnNum": 72
        },
        "fieldLength": 10,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "College Choices",
        "otherPossibleNames": [],
        "logicalName": "College Choices",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 724,
          "columnNum": 73
        },
        "fieldLength": 24,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Writing Subject Score",
        "otherPossibleNames": [],
        "logicalName": "Writing Subject Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 791,
          "offsetEnd": 792,
          "columnNum": 74
        },
        "fieldLength": 2,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Writing Domain Scores: Ideas & Analysis",
        "otherPossibleNames": [],
        "logicalName": "Writing Domain Scores: Ideas & Analysis",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 796,
          "offsetEnd": 797,
          "columnNum": 75
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11","12" ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Writing Domain Scores: Development",
        "otherPossibleNames": [],
        "logicalName": "Writing Domain Scores: Development",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 798,
          "offsetEnd": 799,
          "columnNum": 76
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11","12" ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Writing Domain Scores: Organization",
        "otherPossibleNames": [],
        "logicalName": "Writing Domain Scores: Organization",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 800,
          "offsetEnd": 801,
          "columnNum": 77
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11","12" ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Writing Domain Scores: Language Use & Conventions",
        "otherPossibleNames": [],
        "logicalName": "Writing Domain Scores: Language Use & Conventions",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 802,
          "offsetEnd": 803,
          "columnNum": 78
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11","12" ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "ELA Score",
        "otherPossibleNames": [],
        "logicalName": "ELA Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 806,
          "offsetEnd": 807,
          "columnNum": 79
        },
        "fieldLength": 2,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "STEM Score",
        "otherPossibleNames": [],
        "logicalName": "STEM Score",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 813,
          "offsetEnd": 814,
          "columnNum": 80
        },
        "fieldLength": 2,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Understanding Complex Text Indicator",
        "otherPossibleNames": [],
        "logicalName": "Understanding Complex Text Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 820,
          "offsetEnd": 820,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["0","1","2","-"],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "Progress Toward Career Readiness Indicator",
        "otherPossibleNames": [],
        "logicalName": "Progress Toward Career Readiness Indicator",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 821,
          "offsetEnd": 821,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["0","1","2","3","-"],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    "txt"
  ]
}
