{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "MILESTONES_EOG_1415_Fixed",
	"recordLength": 846,
    "naturalKey": ["GTID_RPT", "TESTDATE"],
    "fields": [{
      "physicalName": "GTID_RPT",
      "otherPossibleNames": [],
      "logicalName": "GTID_RPT",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "N",
      "fieldOffset": {
        "offsetStart": 1,
        "offsetEnd": 10,
        "columnNum": 1
      },
      "fieldLength": 10,
      "expectedValues": [],
      "dataTypes": "STRING",
      "scale": null
    },
      {
        "physicalName": "RESAName_RPT",
        "otherPossibleNames": [],
        "logicalName": "RESANAME_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 11,
          "offsetEnd": 30,
          "columnNum": 2
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 31,
          "offsetEnd": 40,
          "columnNum": 3
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SysCode_RPT",
        "otherPossibleNames": [],
        "logicalName": "SYSCODE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 41,
          "offsetEnd": 43,
          "columnNum": 4
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchCode_RPT",
        "otherPossibleNames": [],
        "logicalName": "SCHCODE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 44,
          "offsetEnd": 47,
          "columnNum": 5
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SysName_RPT",
        "otherPossibleNames": [],
        "logicalName": "SYSNAME_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 48,
          "offsetEnd": 82,
          "columnNum": 6
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchName_RPT",
        "otherPossibleNames": [],
        "logicalName": "SCHNAME_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 83,
          "offsetEnd": 117,
          "columnNum": 7
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CLSName_RPT",
        "otherPossibleNames": [],
        "logicalName": "CLSNAME_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 118,
          "offsetEnd": 141,
          "columnNum": 8
        },
        "fieldLength": 24,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuLastName_RPT",
        "otherPossibleNames": [],
        "logicalName": "STULASTNAME_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 142,
          "offsetEnd": 153,
          "columnNum": 9
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuFirstName_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUFIRSTNAME_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 154,
          "offsetEnd": 165,
          "columnNum": 10
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuMidInitial_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUMIDINITIAL_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 166,
          "offsetEnd": 166,
          "columnNum": 11
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
          "offsetStart": 167,
          "offsetEnd": 168,
          "columnNum": 12
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GISGrade_RPT",
        "otherPossibleNames": [],
        "logicalName": "GISGRADE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 169,
          "offsetEnd": 170,
          "columnNum": 13
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04", "05", "06", "07", "08"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuDOBMonth_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUDOBMONTH_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 171,
          "offsetEnd": 172,
          "columnNum": 14
        },
        "fieldLength": 2,
        "expectedValues": ["-", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuDOBDay_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUDOBDAY_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 173,
          "offsetEnd": 174,
          "columnNum": 15
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuDOBYear_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUDOBYEAR_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 175,
          "offsetEnd": 178,
          "columnNum": 16
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StuGender_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUGENDER_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 179,
          "offsetEnd": 179,
          "columnNum": 17
        },
        "fieldLength": 1,
        "expectedValues": ["F", "M", "", "-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EthnicityRace_RPT",
        "otherPossibleNames": [],
        "logicalName": "ETHNICITYRACE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 180,
          "offsetEnd": 180,
          "columnNum": 18
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC01_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC01_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 181,
          "offsetEnd": 181,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC02_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC02_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 182,
          "offsetEnd": 182,
          "columnNum": 20
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC03_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC03_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 183,
          "offsetEnd": 183,
          "columnNum": 21
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC04_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC04_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 184,
          "offsetEnd": 184,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC05_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC05_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 185,
          "offsetEnd": 185,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC06_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC06_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 186,
          "offsetEnd": 186,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC07_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC07_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 187,
          "offsetEnd": 187,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC08_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC08_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 188,
          "offsetEnd": 188,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC09_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC09_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 189,
          "offsetEnd": 189,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC10_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC10_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 190,
          "offsetEnd": 190,
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC11_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC11_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 191,
          "offsetEnd": 191,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC12_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC12_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 192,
          "offsetEnd": 192,
          "columnNum": 30
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC13_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC13_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 193,
          "offsetEnd": 193,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC14_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC14_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 194,
          "offsetEnd": 194,
          "columnNum": 32
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC15_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC15_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 195,
          "offsetEnd": 195,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC16_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC16_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 196,
          "offsetEnd": 196,
          "columnNum": 34
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC17_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC17_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 197,
          "offsetEnd": 197,
          "columnNum": 35
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC18_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC18_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 198,
          "offsetEnd": 198,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SRC19_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC19_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 199,
          "offsetEnd": 199,
          "columnNum": 37
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_RPT_ELA",
        "otherPossibleNames": [],
        "logicalName": "IR_RPT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 200,
          "offsetEnd": 200,
          "columnNum": 38
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_RPT_ELA",
        "otherPossibleNames": [],
        "logicalName": "IV_RPT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 201,
          "offsetEnd": 201,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_RPT_ELA",
        "otherPossibleNames": [],
        "logicalName": "PIV_RPT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 202,
          "offsetEnd": 202,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_RPT_ELA",
        "otherPossibleNames": [],
        "logicalName": "PTNA_RPT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 203,
          "offsetEnd": 203,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DNA_RPT_ELA",
        "otherPossibleNames": [],
        "logicalName": "DNA_RPT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 204,
          "offsetEnd": 204,
          "columnNum": 42
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "IR_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 205,
          "offsetEnd": 205,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "IV_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 206,
          "offsetEnd": 206,
          "columnNum": 44
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "PIV_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 207,
          "columnNum": 45
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "PTNA_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 208,
          "offsetEnd": 208,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DNA_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "DNA_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 209,
          "offsetEnd": 209,
          "columnNum": 47
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "IR_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 210,
          "offsetEnd": 210,
          "columnNum": 48
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "IV_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 211,
          "offsetEnd": 211,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "PIV_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 212,
          "offsetEnd": 212,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "PTNA_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 213,
          "columnNum": 51
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DNA_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "DNA_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 214,
          "offsetEnd": 214,
          "columnNum": 52
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "IR_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "IV_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 216,
          "offsetEnd": 216,
          "columnNum": 54
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "PIV_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 217,
          "offsetEnd": 217,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "PTNA_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 218,
          "offsetEnd": 218,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DNA_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "DNA_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 219,
          "offsetEnd": 219,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SWDFlag",
        "otherPossibleNames": [],
        "logicalName": "SWDFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 220,
          "offsetEnd": 220,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EIP_RPT",
        "otherPossibleNames": [],
        "logicalName": "EIP_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 221,
          "offsetEnd": 221,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 222,
          "offsetEnd": 222,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 223,
          "offsetEnd": 223,
          "columnNum": 61
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 224,
          "offsetEnd": 224,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SummaryRPTFlag_ELA",
        "otherPossibleNames": [],
        "logicalName": "SUMMARYRPTFLAG_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 225,
          "offsetEnd": 225,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SummaryRPTFlag_Math",
        "otherPossibleNames": [],
        "logicalName": "SUMMARYRPTFLAG_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 226,
          "offsetEnd": 226,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SummaryRPTFlag_Sci",
        "otherPossibleNames": [],
        "logicalName": "SUMMARYRPTFLAG_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 227,
          "offsetEnd": 227,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SummaryRPTFlag_Soc",
        "otherPossibleNames": [],
        "logicalName": "SUMMARYRPTFLAG_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 228,
          "offsetEnd": 228,
          "columnNum": 66
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 229,
          "offsetEnd": 229,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestFormScoring",
        "otherPossibleNames": [],
        "logicalName": "TESTFORMSCORING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 230,
          "offsetEnd": 231,
          "columnNum": 68
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestMode",
        "otherPossibleNames": [],
        "logicalName": "TESTMODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 232,
          "offsetEnd": 232,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": ["E", "P"],
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
          "offsetStart": 233,
          "offsetEnd": 262,
          "columnNum": 70
        },
        "fieldLength": 30,
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
          "offsetStart": 263,
          "offsetEnd": 272,
          "columnNum": 71
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FstYrEL_deferred_ELA",
        "otherPossibleNames": [],
        "logicalName": "FSTYREL_DEFERRED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 273,
          "offsetEnd": 273,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "IR_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 274,
          "offsetEnd": 274,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": ["", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "IV_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 275,
          "offsetEnd": 275,
          "columnNum": 74
        },
        "fieldLength": 1,
        "expectedValues": ["", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "PIV_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 276,
          "offsetEnd": 276,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": ["", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNAFlag_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "PTNAFLAG_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 277,
          "offsetEnd": 277,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 278,
          "offsetEnd": 282,
          "columnNum": 77
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondAdmin_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "CONDADMIN_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 283,
          "offsetEnd": 283,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "IR_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 284,
          "offsetEnd": 284,
          "columnNum": 79
        },
        "fieldLength": 1,
        "expectedValues": ["", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "IV_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 285,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "PIV_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 286,
          "offsetEnd": 286,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNAFlag_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "PTNAFLAG_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 287,
          "offsetEnd": 287,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 288,
          "offsetEnd": 292,
          "columnNum": 83
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondAdmin_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "CONDADMIN_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 293,
          "offsetEnd": 293,
          "columnNum": 84
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "IR_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 294,
          "offsetEnd": 294,
          "columnNum": 85
        },
        "fieldLength": 1,
        "expectedValues": ["", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "IV_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 295,
          "offsetEnd": 295,
          "columnNum": 86
        },
        "fieldLength": 1,
        "expectedValues": ["", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "PIV_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 296,
          "offsetEnd": 296,
          "columnNum": 87
        },
        "fieldLength": 1,
        "expectedValues": ["E", "P"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNAFlag_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "PTNAFLAG_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 297,
          "offsetEnd": 297,
          "columnNum": 88
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 298,
          "offsetEnd": 302,
          "columnNum": 89
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondAdmin_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "CONDADMIN_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 303,
          "offsetEnd": 303,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FstYrEL_deferred_Soc",
        "otherPossibleNames": [],
        "logicalName": "FSTYREL_DEFERRED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 304,
          "offsetEnd": 304,
          "columnNum": 91
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IR_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "IR_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 305,
          "offsetEnd": 305,
          "columnNum": 92
        },
        "fieldLength": 1,
        "expectedValues": ["", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "IV_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 306,
          "offsetEnd": 306,
          "columnNum": 93
        },
        "fieldLength": 1,
        "expectedValues": ["", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "PIV_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 307,
          "offsetEnd": 307,
          "columnNum": 94
        },
        "fieldLength": 1,
        "expectedValues": ["", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNAFlag_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "PTNAFLAG_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 308,
          "offsetEnd": 308,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 309,
          "offsetEnd": 313,
          "columnNum": 96
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondAdmin_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "CONDADMIN_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 314,
          "offsetEnd": 314,
          "columnNum": 97
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomIEP_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIEP_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 315,
          "offsetEnd": 315,
          "columnNum": 98
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomELTPC_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "ACCOMELTPC_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 316,
          "offsetEnd": 316,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accom504IAP_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "ACCOM504IAP_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 317,
          "offsetEnd": 317,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 318,
          "offsetEnd": 318,
          "columnNum": 101
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 319,
          "offsetEnd": 319,
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 320,
          "offsetEnd": 320,
          "columnNum": 103
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 321,
          "offsetEnd": 321,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 322,
          "offsetEnd": 322,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 323,
          "offsetEnd": 323,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 324,
          "offsetEnd": 324,
          "columnNum": 107
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 325,
          "offsetEnd": 325,
          "columnNum": 108
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 326,
          "offsetEnd": 326,
          "columnNum": 109
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 327,
          "offsetEnd": 327,
          "columnNum": 110
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 328,
          "offsetEnd": 328,
          "columnNum": 111
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 329,
          "offsetEnd": 329,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 330,
          "offsetEnd": 330,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 331,
          "offsetEnd": 331,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 332,
          "offsetEnd": 332,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 333,
          "offsetEnd": 333,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ScreenReader",
        "otherPossibleNames": [],
        "logicalName": "SCREENREADER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 334,
          "offsetEnd": 334,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LargeFont",
        "otherPossibleNames": [],
        "logicalName": "LARGEFONT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 335,
          "offsetEnd": 335,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FontColor",
        "otherPossibleNames": [],
        "logicalName": "FONTCOLOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 336,
          "offsetEnd": 336,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BackgroundColor",
        "otherPossibleNames": [],
        "logicalName": "BACKGROUNDCOLOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 337,
          "offsetEnd": 337,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EIP_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "EIP_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 338,
          "offsetEnd": 338,
          "columnNum": 121
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding1",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 339,
          "offsetEnd": 339,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "5", "6", "7", "8", "9", "-"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding2",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 340,
          "offsetEnd": 340,
          "columnNum": 123
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "5", "6", "7", "8", "9", "-"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding3",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 341,
          "offsetEnd": 341,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "5", "6", "7", "8", "9", "-"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding4",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 342,
          "offsetEnd": 342,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "5", "6", "7", "8", "9", "-"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUA_GNTS_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "SDUA_GNTS_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 343,
          "offsetEnd": 344,
          "columnNum": 126
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SS_ELA",
        "otherPossibleNames": [],
        "logicalName": "SS_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 345,
          "offsetEnd": 347,
          "columnNum": 127
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHLevel_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACHLEVEL_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 348,
          "offsetEnd": 348,
          "columnNum": 128
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM_ELA",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 349,
          "offsetEnd": 351,
          "columnNum": 129
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMHigh_ELA",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMHIGH_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 352,
          "offsetEnd": 354,
          "columnNum": 130
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMLow_ELA",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMLOW_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 355,
          "offsetEnd": 357,
          "columnNum": 131
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lexile",
        "otherPossibleNames": [],
        "logicalName": "LEXILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 358,
          "offsetEnd": 361,
          "columnNum": 132
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LexileL",
        "otherPossibleNames": [],
        "logicalName": "LEXILEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 362,
          "offsetEnd": 367,
          "columnNum": 133
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LexileLow",
        "otherPossibleNames": [],
        "logicalName": "LEXILELOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 368,
          "offsetEnd": 373,
          "columnNum": 134
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LexileHigh",
        "otherPossibleNames": [],
        "logicalName": "LEXILEHIGH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 374,
          "offsetEnd": 379,
          "columnNum": 135
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EXTWRTGenre",
        "otherPossibleNames": [],
        "logicalName": "EXTWRTGENRE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 380,
          "offsetEnd": 380,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EXTWRT1Score",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT1SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 381,
          "offsetEnd": 381,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EXTWRT2Score",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT2SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 382,
          "offsetEnd": 382,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EXTWRT1CondCode",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT1CONDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 383,
          "offsetEnd": 383,
          "columnNum": 139
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EXTWRT2CondCode",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT2CONDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 384,
          "offsetEnd": 384,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NARRWRTScore",
        "otherPossibleNames": [],
        "logicalName": "NARRWRTSCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 385,
          "offsetEnd": 385,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NARRWRTCondCode",
        "otherPossibleNames": [],
        "logicalName": "NARRWRTCONDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 386,
          "offsetEnd": 386,
          "columnNum": 142
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 387,
          "offsetEnd": 387,
          "columnNum": 143
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom2_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM2_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 388,
          "offsetEnd": 388,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom3_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM3_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 389,
          "offsetEnd": 389,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom4_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM4_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 390,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom5_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM5_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 391,
          "offsetEnd": 391,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom6_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM6_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 392,
          "offsetEnd": 392,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom7_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM7_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 393,
          "offsetEnd": 393,
          "columnNum": 149
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom8_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM8_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 394,
          "offsetEnd": 394,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NP_ELA",
        "otherPossibleNames": [],
        "logicalName": "NRT_NP_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 395,
          "offsetEnd": 396,
          "columnNum": 151
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NPRange_ELA",
        "otherPossibleNames": [],
        "logicalName": "NRT_NPRANGE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 397,
          "offsetEnd": 401,
          "columnNum": 152
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NRT_NCE_ELA",
        "otherPossibleNames": [],
        "logicalName": "NRT_NCE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 402,
          "offsetEnd": 403,
          "columnNum": 153
        },
        "fieldLength": 2,
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
          "offsetStart": 404,
          "offsetEnd": 418,
          "columnNum": 154
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SS_Math",
        "otherPossibleNames": [],
        "logicalName": "SS_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 419,
          "offsetEnd": 421,
          "columnNum": 155
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHLevel_Math",
        "otherPossibleNames": [],
        "logicalName": "ACHLEVEL_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 422,
          "offsetEnd": 422,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3", "4"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CondSEM_Math",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 423,
          "offsetEnd": 425,
          "columnNum": 157
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMHigh_Math",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMHIGH_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 426,
          "offsetEnd": 428,
          "columnNum": 158
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMLow_Math",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMLOW_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 429,
          "offsetEnd": 431,
          "columnNum": 159
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 432,
          "offsetEnd": 432,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom2_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM2_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 433,
          "offsetEnd": 433,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom3_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM3_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 434,
          "offsetEnd": 434,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom4_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM4_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 435,
          "offsetEnd": 435,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom5_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM5_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 436,
          "offsetEnd": 436,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom6_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM6_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 437,
          "offsetEnd": 437,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom7_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM7_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 438,
          "offsetEnd": 438,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom8_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM8_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 439,
          "offsetEnd": 439,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NP_Math",
        "otherPossibleNames": [],
        "logicalName": "NRT_NP_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 441,
          "columnNum": 168
        },
        "fieldLength": 2,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NPRange_Math",
        "otherPossibleNames": [],
        "logicalName": "NRT_NPRANGE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 442,
          "offsetEnd": 446,
          "columnNum": 169
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NRT_NCE_Math",
        "otherPossibleNames": [],
        "logicalName": "NRT_NCE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 447,
          "offsetEnd": 448,
          "columnNum": 170
        },
        "fieldLength": 2,
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
          "offsetStart": 449,
          "offsetEnd": 463,
          "columnNum": 171
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SS_Sci",
        "otherPossibleNames": [],
        "logicalName": "SS_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 464,
          "offsetEnd": 466,
          "columnNum": 172
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHLevel_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACHLEVEL_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 467,
          "offsetEnd": 467,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM_Sci",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 468,
          "offsetEnd": 470,
          "columnNum": 174
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMHigh_Sci",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMHIGH_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 471,
          "offsetEnd": 473,
          "columnNum": 175
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMLow_Sci",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMLOW_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 474,
          "offsetEnd": 476,
          "columnNum": 176
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 477,
          "offsetEnd": 477,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom2_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM2_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 478,
          "columnNum": 178
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom3_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM3_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 479,
          "offsetEnd": 479,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom4_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM4_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 480,
          "offsetEnd": 480,
          "columnNum": 180
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom5_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM5_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 481,
          "offsetEnd": 481,
          "columnNum": 181
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom6_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM6_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 482,
          "offsetEnd": 482,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom7_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM7_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 483,
          "offsetEnd": 483,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom8_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM8_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 484,
          "offsetEnd": 484,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NP_Sci",
        "otherPossibleNames": [],
        "logicalName": "NRT_NP_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 485,
          "offsetEnd": 486,
          "columnNum": 185
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NPRange_Sci",
        "otherPossibleNames": [],
        "logicalName": "NRT_NPRANGE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 487,
          "offsetEnd": 491,
          "columnNum": 186
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NRT_NCE_Sci",
        "otherPossibleNames": [],
        "logicalName": "NRT_NCE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 492,
          "offsetEnd": 493,
          "columnNum": 187
        },
        "fieldLength": 2,
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
          "offsetStart": 494,
          "offsetEnd": 508,
          "columnNum": 188
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SS_Soc",
        "otherPossibleNames": [],
        "logicalName": "SS_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 509,
          "offsetEnd": 511,
          "columnNum": 189
        },
        "fieldLength": 3,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHLevel_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACHLEVEL_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 512,
          "offsetEnd": 512,
          "columnNum": 190
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM_Soc",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 513,
          "offsetEnd": 515,
          "columnNum": 191
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMHigh_Soc",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMHIGH_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 516,
          "offsetEnd": 518,
          "columnNum": 192
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMLow_Soc",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMLOW_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 519,
          "offsetEnd": 521,
          "columnNum": 193
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 522,
          "offsetEnd": 522,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom2_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM2_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 523,
          "offsetEnd": 523,
          "columnNum": 195
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom3_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM3_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 524,
          "offsetEnd": 524,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom4_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM4_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 525,
          "offsetEnd": 525,
          "columnNum": 197
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom5_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM5_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 526,
          "offsetEnd": 526,
          "columnNum": 198
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom6_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM6_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 527,
          "offsetEnd": 527,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom7_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM7_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 528,
          "offsetEnd": 528,
          "columnNum": 200
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom8_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM8_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 529,
          "offsetEnd": 529,
          "columnNum": 201
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NP_Soc",
        "otherPossibleNames": [],
        "logicalName": "NRT_NP_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 530,
          "offsetEnd": 531,
          "columnNum": 202
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NPRange_Soc",
        "otherPossibleNames": [],
        "logicalName": "NRT_NPRANGE_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 532,
          "offsetEnd": 536,
          "columnNum": 203
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NRT_NCE_Soc",
        "otherPossibleNames": [],
        "logicalName": "NRT_NCE_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 537,
          "offsetEnd": 538,
          "columnNum": 204
        },
        "fieldLength": 2,
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
          "offsetStart": 539,
          "offsetEnd": 553,
          "columnNum": 205
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestAdmin",
        "otherPossibleNames": [],
        "logicalName": "TESTADMIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 554,
          "offsetEnd": 568,
          "columnNum": 206
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestDate",
        "otherPossibleNames": [],
        "logicalName": "TESTDATE",
        "formatMask": "MMddyy",
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 569,
          "offsetEnd": 574,
          "columnNum": 207
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AdminInd",
        "otherPossibleNames": [],
        "logicalName": "ADMININD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 575,
          "offsetEnd": 575,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FileRunType",
        "otherPossibleNames": [],
        "logicalName": "FILERUNTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 576,
          "offsetEnd": 579,
          "columnNum": 209
        },
        "fieldLength": 4,
        "expectedValues": ["MAIN", "RTST", "STRG", "INVL", "RSCR"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EOR",
        "otherPossibleNames": [],
        "logicalName": "EOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 580,
          "offsetEnd": 580,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": ["X"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 600,
          "columnNum": 211
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 626,
          "columnNum": 212
        },
        "fieldLength": 26,
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
          "offsetStart": 627,
          "offsetEnd": 627,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 628,
          "offsetEnd": 628,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 629,
          "offsetEnd": 638,
          "columnNum": 215
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 639,
          "offsetEnd": 640,
          "columnNum": 216
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 641,
          "offsetEnd": 647,
          "columnNum": 217
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 648,
          "offsetEnd": 649,
          "columnNum": 218
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 650,
          "offsetEnd": 656,
          "columnNum": 219
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 657,
          "offsetEnd": 682,
          "columnNum": 220
        },
        "fieldLength": 26,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 683,
          "offsetEnd": 684,
          "columnNum": 221
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 685,
          "offsetEnd": 691,
          "columnNum": 222
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 692,
          "offsetEnd": 717,
          "columnNum": 223
        },
        "fieldLength": 26,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 718,
          "offsetEnd": 719,
          "columnNum": 224
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 720,
          "offsetEnd": 726,
          "columnNum": 225
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 727,
          "offsetEnd": 752,
          "columnNum": 226
        },
        "fieldLength": 26,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CTB Use Only",
        "otherPossibleNames": [],
        "logicalName": "CTB USE ONLY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 753,
          "offsetEnd": 846,
          "columnNum": 227
        },
        "fieldLength": 94,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".txt"]
}