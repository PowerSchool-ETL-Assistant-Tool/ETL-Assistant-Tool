{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "MILESTONES_EOG_1617_Fixed",
    "recordLength": 1233,
    "hasHeader": true,
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
        "physicalName": "TestedGrade_RPT",
        "otherPossibleNames": [],
        "logicalName": "TESTEDGRADE_RPT",
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
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 200,
          "offsetEnd": 201,
          "columnNum": 38
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
          "offsetStart": 202,
          "offsetEnd": 202,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RetestFlag_ELA",
        "otherPossibleNames": [],
        "logicalName": "RETESTFLAG_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 203,
          "offsetEnd": 203,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RetestFlag_Math",
        "otherPossibleNames": [],
        "logicalName": "RETESTFLAG_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 204,
          "offsetEnd": 204,
          "columnNum": 41
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 205,
          "offsetEnd": 205,
          "columnNum": 42
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 206,
          "offsetEnd": 206,
          "columnNum": 43
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 207,
          "columnNum": 44
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 208,
          "offsetEnd": 208,
          "columnNum": 45
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 209,
          "offsetEnd": 209,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_RPT_ELA",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_RPT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 210,
          "offsetEnd": 214,
          "columnNum": 47
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DupInvalid_ELA",
        "otherPossibleNames": [],
        "logicalName": "DUPINVALID_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 48
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
          "offsetStart": 216,
          "offsetEnd": 225,
          "columnNum": 49
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EOC_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "EOC_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 226,
          "offsetEnd": 226,
          "columnNum": 50
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
          "offsetStart": 227,
          "offsetEnd": 227,
          "columnNum": 51
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
          "offsetStart": 228,
          "offsetEnd": 228,
          "columnNum": 52
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
          "offsetStart": 229,
          "offsetEnd": 229,
          "columnNum": 53
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
          "offsetStart": 230,
          "offsetEnd": 230,
          "columnNum": 54
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
          "offsetStart": 231,
          "offsetEnd": 231,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_RPT_Math",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_RPT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 232,
          "offsetEnd": 236,
          "columnNum": 56
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DupInvalid_Math",
        "otherPossibleNames": [],
        "logicalName": "DUPINVALID_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 237,
          "offsetEnd": 237,
          "columnNum": 57
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
          "offsetStart": 238,
          "offsetEnd": 247,
          "columnNum": 58
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EOC_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "EOC_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 248,
          "offsetEnd": 248,
          "columnNum": 59
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 249,
          "offsetEnd": 249,
          "columnNum": 60
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 250,
          "offsetEnd": 250,
          "columnNum": 61
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 251,
          "offsetEnd": 251,
          "columnNum": 62
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 252,
          "offsetEnd": 252,
          "columnNum": 63
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 253,
          "offsetEnd": 253,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_RPT_Sci",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_RPT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 254,
          "offsetEnd": 258,
          "columnNum": 65
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DupInvalid_Sci",
        "otherPossibleNames": [],
        "logicalName": "DUPINVALID_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 259,
          "offsetEnd": 259,
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
          "offsetStart": 260,
          "offsetEnd": 269,
          "columnNum": 67
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "IR_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "IR_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 270,
          "offsetEnd": 270,
          "columnNum": 68
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 271,
          "offsetEnd": 271,
          "columnNum": 69
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 272,
          "offsetEnd": 272,
          "columnNum": 70
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 273,
          "offsetEnd": 273,
          "columnNum": 71
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 274,
          "offsetEnd": 274,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_RPT_Soc",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_RPT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 275,
          "offsetEnd": 279,
          "columnNum": 73
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DupInvalid_Soc",
        "otherPossibleNames": [],
        "logicalName": "DUPINVALID_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 280,
          "offsetEnd": 280,
          "columnNum": 74
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
          "offsetStart": 281,
          "offsetEnd": 290,
          "columnNum": 75
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SWDFlag",
        "otherPossibleNames": [],
        "logicalName": "SWDFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 76
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
          "offsetStart": 292,
          "offsetEnd": 292,
          "columnNum": 77
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
          "offsetStart": 293,
          "offsetEnd": 293,
          "columnNum": 78
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
          "offsetStart": 294,
          "offsetEnd": 294,
          "columnNum": 79
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
          "offsetStart": 295,
          "offsetEnd": 295,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 297,
          "offsetEnd": 297,
          "columnNum": 82
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
          "offsetStart": 298,
          "offsetEnd": 298,
          "columnNum": 83
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
          "offsetStart": 299,
          "offsetEnd": 299,
          "columnNum": 84
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
          "offsetStart": 300,
          "offsetEnd": 300,
          "columnNum": 85
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
          "offsetStart": 305,
          "offsetEnd": 334,
          "columnNum": 88
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },

      {
        "physicalName": "TestFormScoring",
        "otherPossibleNames": [],
        "logicalName": "TESTFORMSCORING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 301,
          "offsetEnd": 303,
          "columnNum": 86
        },
        "fieldLength": 3,
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
          "offsetStart": 304,
          "offsetEnd": 304,
          "columnNum": 87
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
          "offsetStart": 305,
          "offsetEnd": 334,
          "columnNum": 88
        },
        "fieldLength": 30,
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 335,
          "offsetEnd": 335,
          "columnNum": 89
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 336,
          "offsetEnd": 336,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 337,
          "offsetEnd": 337,
          "columnNum": 91
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 338,
          "offsetEnd": 338,
          "columnNum": 92
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 339,
          "offsetEnd": 343,
          "columnNum": 93
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PTNA_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "PTNA_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 344,
          "offsetEnd": 344,
          "columnNum": 94
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_CALCULATED_ELA",
        "otherPossibleNames": [],
        "logicalName": "PTNA_CALCULATED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 345,
          "offsetEnd": 345,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 346,
          "offsetEnd": 346,
          "columnNum": 96
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
          "offsetStart": 347,
          "offsetEnd": 351,
          "columnNum": 97
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EOC_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "EOC_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 352,
          "offsetEnd": 352,
          "columnNum": 98
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 353,
          "offsetEnd": 353,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "IV_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 354,
          "offsetEnd": 354,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "PIV_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 355,
          "offsetEnd": 355,
          "columnNum": 101
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 356,
          "offsetEnd": 360,
          "columnNum": 102
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PTNA_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "PTNA_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 361,
          "offsetEnd": 361,
          "columnNum": 103
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_CALCULATED_Math",
        "otherPossibleNames": [],
        "logicalName": "PTNA_CALCULATED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 362,
          "offsetEnd": 362,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 363,
          "offsetEnd": 363,
          "columnNum": 105
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
          "offsetStart": 364,
          "offsetEnd": 368,
          "columnNum": 106
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EOC_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "EOC_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 369,
          "offsetEnd": 369,
          "columnNum": 107
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
          "offsetStart": 370,
          "offsetEnd": 370,
          "columnNum": 108
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 371,
          "offsetEnd": 371,
          "columnNum": 109
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 372,
          "offsetEnd": 372,
          "columnNum": 110
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 373,
          "offsetEnd": 377,
          "columnNum": 111
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PTNA_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "PTNA_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 378,
          "offsetEnd": 378,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_CALCULATED_Sci",
        "otherPossibleNames": [],
        "logicalName": "PTNA_CALCULATED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 379,
          "offsetEnd": 379,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 380,
          "offsetEnd": 380,
          "columnNum": 114
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
          "offsetStart": 381,
          "offsetEnd": 385,
          "columnNum": 115
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FstYrEL_deferred_Soc",
        "otherPossibleNames": [],
        "logicalName": "FSTYREL_DEFERRED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 386,
          "offsetEnd": 386,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 387,
          "offsetEnd": 387,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 388,
          "offsetEnd": 388,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 389,
          "offsetEnd": 389,
          "columnNum": 119
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 394,
          "columnNum": 120
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PTNA_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "PTNA_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 395,
          "offsetEnd": 395,
          "columnNum": 121
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNA_CALCULATED_Soc",
        "otherPossibleNames": [],
        "logicalName": "PTNA_CALCULATED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 396,
          "offsetEnd": 396,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 397,
          "offsetEnd": 397,
          "columnNum": 123
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
          "offsetStart": 398,
          "offsetEnd": 402,
          "columnNum": 124
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AccomIEP_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIEP_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 403,
          "offsetEnd": 403,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomELTPC_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMELTPC_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 404,
          "offsetEnd": 404,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accom504IAP_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOM504IAP_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 405,
          "offsetEnd": 405,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 406,
          "offsetEnd": 406,
          "columnNum": 128
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 407,
          "offsetEnd": 407,
          "columnNum": 129
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 408,
          "offsetEnd": 408,
          "columnNum": 130
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_COLLECTED_ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_COLLECTED_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 409,
          "offsetEnd": 409,
          "columnNum": 131
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Braille_ELA",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 410,
          "offsetEnd": 410,
          "columnNum": 132
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LargePrint_ELA",
        "otherPossibleNames": [],
        "logicalName": "LARGEPRINT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 411,
          "offsetEnd": 411,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Audio_ELA",
        "otherPossibleNames": [],
        "logicalName": "AUDIO_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 412,
          "offsetEnd": 412,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AudioPassages_ELA",
        "otherPossibleNames": [],
        "logicalName": "AUDIOPASSAGES_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 413,
          "offsetEnd": 413,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HumanReader_ELA",
        "otherPossibleNames": [],
        "logicalName": "HUMANREADER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 414,
          "offsetEnd": 414,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ColorChooser_ELA",
        "otherPossibleNames": [],
        "logicalName": "COLORCHOOSER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 415,
          "offsetEnd": 415,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContrastingColor_ELA",
        "otherPossibleNames": [],
        "logicalName": "CONTRASTINGCOLOR_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 416,
          "offsetEnd": 416,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Masking_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASKING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 417,
          "offsetEnd": 417,
          "columnNum": 139
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
          "offsetStart": 419,
          "offsetEnd": 427,
          "columnNum": 141
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AccomIEP_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIEP_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 428,
          "offsetEnd": 428,
          "columnNum": 142
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomELTPC_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMELTPC_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 429,
          "offsetEnd": 429,
          "columnNum": 143
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accom504IAP_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOM504IAP_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 430,
          "offsetEnd": 430,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 431,
          "offsetEnd": 431,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 432,
          "offsetEnd": 432,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 433,
          "offsetEnd": 433,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_COLLECTED_Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_COLLECTED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 434,
          "offsetEnd": 434,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Braille_Math",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 435,
          "offsetEnd": 435,
          "columnNum": 149
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LargePrint_Math",
        "otherPossibleNames": [],
        "logicalName": "LARGEPRINT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 436,
          "offsetEnd": 436,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Audio_Math",
        "otherPossibleNames": [],
        "logicalName": "AUDIO_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 437,
          "offsetEnd": 437,
          "columnNum": 151
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AudioPassages_Math",
        "otherPossibleNames": [],
        "logicalName": "AUDIOPASSAGES_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 438,
          "offsetEnd": 438,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HumanReader_Math",
        "otherPossibleNames": [],
        "logicalName": "HUMANREADER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 439,
          "offsetEnd": 439,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ColorChooser_Math",
        "otherPossibleNames": [],
        "logicalName": "COLORCHOOSER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 440,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContrastingColor_Math",
        "otherPossibleNames": [],
        "logicalName": "CONTRASTINGCOLOR_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 441,
          "offsetEnd": 441,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Masking_Math",
        "otherPossibleNames": [],
        "logicalName": "MASKING_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 442,
          "offsetEnd": 442,
          "columnNum": 156
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
          "offsetStart": 444,
          "offsetEnd": 452,
          "columnNum": 158
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AccomIEP_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIEP_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 453,
          "offsetEnd": 453,
          "columnNum": 159
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomELTPC_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMELTPC_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 454,
          "offsetEnd": 454,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accom504IAP_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOM504IAP_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 455,
          "offsetEnd": 455,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 456,
          "offsetEnd": 456,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 457,
          "offsetEnd": 457,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 458,
          "offsetEnd": 458,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_COLLECTED_Sci",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_COLLECTED_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 459,
          "offsetEnd": 459,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Braille_Sci",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 460,
          "offsetEnd": 460,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LargePrint_Sci",
        "otherPossibleNames": [],
        "logicalName": "LARGEPRINT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 461,
          "offsetEnd": 461,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Audio_Sci",
        "otherPossibleNames": [],
        "logicalName": "AUDIO_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 462,
          "offsetEnd": 462,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AudioPassages_Sci",
        "otherPossibleNames": [],
        "logicalName": "AUDIOPASSAGES_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 463,
          "offsetEnd": 463,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HumanReader_Sci",
        "otherPossibleNames": [],
        "logicalName": "HUMANREADER_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 464,
          "offsetEnd": 464,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ColorChooser_Sci",
        "otherPossibleNames": [],
        "logicalName": "COLORCHOOSER_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 465,
          "offsetEnd": 465,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContrastingColor_Sci",
        "otherPossibleNames": [],
        "logicalName": "CONTRASTINGCOLOR_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 466,
          "offsetEnd": 466,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Masking_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASKING_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 467,
          "offsetEnd": 467,
          "columnNum": 173
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
          "offsetStart": 469,
          "offsetEnd": 477,
          "columnNum": 175
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AccomIEP_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIEP_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 478,
          "columnNum": 176
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomELTPC_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMELTPC_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 479,
          "offsetEnd": 479,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accom504IAP_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOM504IAP_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 480,
          "offsetEnd": 480,
          "columnNum": 178
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 481,
          "offsetEnd": 481,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 482,
          "offsetEnd": 482,
          "columnNum": 180
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 483,
          "offsetEnd": 483,
          "columnNum": 181
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH_COLLECTED_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_COLLECTED_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 484,
          "offsetEnd": 484,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Braille_Soc",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 485,
          "offsetEnd": 485,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LargePrint_Soc",
        "otherPossibleNames": [],
        "logicalName": "LARGEPRINT_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 486,
          "offsetEnd": 486,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Audio_Soc",
        "otherPossibleNames": [],
        "logicalName": "AUDIO_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 487,
          "offsetEnd": 487,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AudioPassages_Soc",
        "otherPossibleNames": [],
        "logicalName": "AUDIOPASSAGES_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 488,
          "offsetEnd": 488,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HumanReader_Soc",
        "otherPossibleNames": [],
        "logicalName": "HUMANREADER_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 489,
          "offsetEnd": 489,
          "columnNum": 187
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ColorChooser_Soc",
        "otherPossibleNames": [],
        "logicalName": "COLORCHOOSER_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 490,
          "offsetEnd": 490,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContrastingColor_Soc",
        "otherPossibleNames": [],
        "logicalName": "CONTRASTINGCOLOR_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 491,
          "offsetEnd": 491,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Masking_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASKING_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 492,
          "offsetEnd": 492,
          "columnNum": 190
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
          "offsetStart": 494,
          "offsetEnd": 507,
          "columnNum": 192
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 508,
          "offsetEnd": 508,
          "columnNum": 193
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 509,
          "offsetEnd": 509,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding2",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 510,
          "offsetEnd": 510,
          "columnNum": 195
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding3",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 511,
          "offsetEnd": 511,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LocalOptCoding4",
        "otherPossibleNames": [],
        "logicalName": "LOCALOPTCODING4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 512,
          "offsetEnd": 512,
          "columnNum": 197
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
          "offsetStart": 514,
          "offsetEnd": 514,
          "columnNum": 198
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
          "offsetStart": 516,
          "offsetEnd": 516,
          "columnNum": 199
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 517,
          "offsetEnd": 519,
          "columnNum": 200
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 520,
          "offsetEnd": 520,
          "columnNum": 201
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 523,
          "offsetEnd": 523,
          "columnNum": 202
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 526,
          "offsetEnd": 526,
          "columnNum": 203
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 529,
          "offsetEnd": 529,
          "columnNum": 204
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
          "offsetStart": 532,
          "offsetEnd": 532,
          "columnNum": 205
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Lexile",
        "otherPossibleNames": [],
        "logicalName": "LEXILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 536,
          "offsetEnd": 536,
          "columnNum": 206
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 542,
          "offsetEnd": 542,
          "columnNum": 207
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LexileLow",
        "otherPossibleNames": [],
        "logicalName": "LEXILELOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 548,
          "offsetEnd": 548,
          "columnNum": 208
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 554,
          "offsetEnd": 554,
          "columnNum": 209
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StretchBand",
        "otherPossibleNames": [],
        "logicalName": "STRETCHBAND",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 555,
          "offsetEnd": 555,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ReadingStatus",
        "otherPossibleNames": [],
        "logicalName": "READINGSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 556,
          "offsetEnd": 556,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EXTWRTGenre",
        "otherPossibleNames": [],
        "logicalName": "EXTWRTGENRE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 557,
          "offsetEnd": 557,
          "columnNum": 212
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 558,
          "offsetEnd": 558,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EXTWRT2Score",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT2SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 559,
          "offsetEnd": 559,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3"],
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
          "offsetStart": 560,
          "offsetEnd": 560,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EXTWRT1CondCode",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT1CONDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 561,
          "offsetEnd": 561,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E", "F", "G"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EXTWRT2CondCode",
        "otherPossibleNames": [],
        "logicalName": "EXTWRT2CONDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 562,
          "offsetEnd": 562,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E", "F", "G"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NARRWRTScore",
        "otherPossibleNames": [],
        "logicalName": "NARRWRTSCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 563,
          "offsetEnd": 563,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NARRWRTCondCode",
        "otherPossibleNames": [],
        "logicalName": "NARRWRTCONDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 564,
          "offsetEnd": 564,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E", "F", "G"],
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
          "offsetStart": 565,
          "offsetEnd": 567,
          "columnNum": 220
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_ELA",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 568,
          "offsetEnd": 568,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 569,
          "offsetEnd": 569,
          "columnNum": 222
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
          "offsetStart": 570,
          "offsetEnd": 570,
          "columnNum": 223
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
          "offsetStart": 571,
          "offsetEnd": 571,
          "columnNum": 224
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
          "offsetStart": 572,
          "offsetEnd": 572,
          "columnNum": 225
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
          "offsetStart": 573,
          "offsetEnd": 573,
          "columnNum": 226
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
          "offsetStart": 574,
          "offsetEnd": 574,
          "columnNum": 227
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
          "offsetStart": 575,
          "offsetEnd": 575,
          "columnNum": 228
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 576,
          "offsetEnd": 577,
          "columnNum": 229
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 578,
          "offsetEnd": 582,
          "columnNum": 230
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NCE_ELA",
        "otherPossibleNames": [],
        "logicalName": "NRT_NCE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 583,
          "offsetEnd": 584,
          "columnNum": 231
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
          "offsetStart": 585,
          "offsetEnd": 599,
          "columnNum": 232
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 600,
          "offsetEnd": 602,
          "columnNum": 233
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 603,
          "offsetEnd": 603,
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM_Math",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 604,
          "offsetEnd": 606,
          "columnNum": 235
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 607,
          "offsetEnd": 609,
          "columnNum": 236
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 610,
          "offsetEnd": 612,
          "columnNum": 237
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
          "offsetStart": 613,
          "offsetEnd": 614,
          "columnNum": 238
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_Math",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 615,
          "offsetEnd": 615,
          "columnNum": 239
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 616,
          "offsetEnd": 616,
          "columnNum": 240
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 617,
          "offsetEnd": 617,
          "columnNum": 241
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 618,
          "offsetEnd": 618,
          "columnNum": 242
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 619,
          "offsetEnd": 619,
          "columnNum": 243
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
          "offsetStart": 620,
          "offsetEnd": 620,
          "columnNum": 244
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
          "offsetStart": 621,
          "offsetEnd": 621,
          "columnNum": 245
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
          "offsetStart": 622,
          "offsetEnd": 622,
          "columnNum": 246
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 623,
          "offsetEnd": 624,
          "columnNum": 247
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NPRange_Math",
        "otherPossibleNames": [],
        "logicalName": "NRT_NPRANGE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 625,
          "offsetEnd": 629,
          "columnNum": 248
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 630,
          "offsetEnd": 631,
          "columnNum": 249
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
          "offsetStart": 632,
          "offsetEnd": 646,
          "columnNum": 250
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 647,
          "offsetEnd": 649,
          "columnNum": 251
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 650,
          "offsetEnd": 650,
          "columnNum": 252
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM_Sci",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 651,
          "offsetEnd": 653,
          "columnNum": 253
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 654,
          "offsetEnd": 656,
          "columnNum": 254
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 657,
          "offsetEnd": 659,
          "columnNum": 255
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
          "offsetStart": 660,
          "offsetEnd": 662,
          "columnNum": 256
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_Sci",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 663,
          "offsetEnd": 663,
          "columnNum": 257
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 664,
          "offsetEnd": 664,
          "columnNum": 258
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 665,
          "offsetEnd": 665,
          "columnNum": 259
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 666,
          "columnNum": 260
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 667,
          "offsetEnd": 667,
          "columnNum": 261
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
          "offsetStart": 668,
          "offsetEnd": 668,
          "columnNum": 262
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
          "offsetStart": 669,
          "offsetEnd": 669,
          "columnNum": 263
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
          "offsetStart": 670,
          "offsetEnd": 670,
          "columnNum": 264
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 671,
          "offsetEnd": 672,
          "columnNum": 265
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 673,
          "offsetEnd": 677,
          "columnNum": 266
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 678,
          "offsetEnd": 679,
          "columnNum": 267
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
          "offsetStart": 680,
          "offsetEnd": 694,
          "columnNum": 268
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 697,
          "columnNum": 269
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHLevel_Soc",
        "otherPossibleNames": [],
        "logicalName": "ACHLEVEL_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 698,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM_Soc",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 701,
          "columnNum": 271
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 702,
          "offsetEnd": 704,
          "columnNum": 272
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 707,
          "columnNum": 273
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
          "offsetStart": 708,
          "offsetEnd": 710,
          "columnNum": 274
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1_Soc",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 711,
          "columnNum": 275
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 276
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 713,
          "offsetEnd": 713,
          "columnNum": 277
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 714,
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
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
          "offsetStart": 715,
          "offsetEnd": 715,
          "columnNum": 279
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
          "offsetStart": 716,
          "offsetEnd": 716,
          "columnNum": 280
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
          "offsetStart": 717,
          "offsetEnd": 717,
          "columnNum": 281
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
          "offsetStart": 718,
          "offsetEnd": 718,
          "columnNum": 282
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 719,
          "offsetEnd": 720,
          "columnNum": 283
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 721,
          "offsetEnd": 725,
          "columnNum": 284
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
          "offsetStart": 726,
          "offsetEnd": 727,
          "columnNum": 285
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
          "offsetStart": 728,
          "offsetEnd": 742,
          "columnNum": 286
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
          "offsetStart": 743,
          "offsetEnd": 757,
          "columnNum": 287
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
          "offsetStart": 758,
          "offsetEnd": 763,
          "columnNum": 288
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
          "offsetStart": 764,
          "offsetEnd": 764,
          "columnNum": 289
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
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
          "offsetStart": 765,
          "offsetEnd": 765,
          "columnNum": 290
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 766,
          "offsetEnd": 769,
          "columnNum": 291
        },
        "fieldLength": 4,
        "expectedValues": ["MAIN", "STRG", "INVL", "RSCR"],
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
          "offsetStart": 770,
          "offsetEnd": 770,
          "columnNum": 292
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
          "offsetStart": 771,
          "offsetEnd": 790,
          "columnNum": 293
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentID_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "STUDENTID_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 791,
          "offsetEnd": 810,
          "columnNum": 294
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DocumentID_DRCUse_ELA",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENTID_DRCUSE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 811,
          "offsetEnd": 830,
          "columnNum": 295
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DocumentID_DRCUse_Math",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENTID_DRCUSE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 831,
          "offsetEnd": 850,
          "columnNum": 296
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DocumentID_DRCUse_Sci",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENTID_DRCUSE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 851,
          "offsetEnd": 870,
          "columnNum": 297
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DocumentID_DRCUse_Soc",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENTID_DRCUSE_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 871,
          "offsetEnd": 890,
          "columnNum": 298
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestEventID_DRCUse_ELA",
        "otherPossibleNames": [],
        "logicalName": "TESTEVENTID_DRCUSE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 891,
          "offsetEnd": 910,
          "columnNum": 299
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestEventID_DRCUse_Math",
        "otherPossibleNames": [],
        "logicalName": "TESTEVENTID_DRCUSE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 911,
          "offsetEnd": 930,
          "columnNum": 300
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestEventID_DRCUse_Sci",
        "otherPossibleNames": [],
        "logicalName": "TESTEVENTID_DRCUSE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 931,
          "offsetEnd": 950,
          "columnNum": 301
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestEventID_DRCUse_Soc",
        "otherPossibleNames": [],
        "logicalName": "TESTEVENTID_DRCUSE_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 951,
          "offsetEnd": 970,
          "columnNum": 302
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ClassID_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "CLASSID_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 971,
          "offsetEnd": 990,
          "columnNum": 303
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ClassID_DRCUse_ELA",
        "otherPossibleNames": [],
        "logicalName": "CLASSID_DRCUSE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 991,
          "offsetEnd": 1010,
          "columnNum": 304
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ClassID_DRCUse_Math",
        "otherPossibleNames": [],
        "logicalName": "CLASSID_DRCUSE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1011,
          "offsetEnd": 1030,
          "columnNum": 305
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ClassID_DRCUse_Sci",
        "otherPossibleNames": [],
        "logicalName": "CLASSID_DRCUSE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1031,
          "offsetEnd": 1050,
          "columnNum": 306
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ClassID_DRCUse_Soc",
        "otherPossibleNames": [],
        "logicalName": "CLASSID_DRCUSE_SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1051,
          "offsetEnd": 1070,
          "columnNum": 307
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CharterSchoolID_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "CHARTERSCHOOLID_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1071,
          "offsetEnd": 1080,
          "columnNum": 308
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ResaCode_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "RESACODE_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1081,
          "offsetEnd": 1083,
          "columnNum": 309
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Other_Fields_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "OTHER_FIELDS_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1084,
          "offsetEnd": 1233,
          "columnNum": 310
        },
        "fieldLength": 150,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".txt", ".dat"]
}