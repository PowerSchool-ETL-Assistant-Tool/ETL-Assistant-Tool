{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "MILESTONES_EOC_Fixed_Long_X",
    "recordLength": 766,
    "naturalKey": ["CONTENTAREACODE","GTID_RPT","STUDENTID_DRCUSE", "TESTDATE"],
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
        "canBeNull": "Y",
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
        "physicalName": "StuGrade_RPT",
        "otherPossibleNames": [],
        "logicalName": "STUGRADE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 167,
          "offsetEnd": 168,
          "columnNum": 12
        },
        "fieldLength": 2,
        "expectedValues": ["04", "05", "06", "07", "08", "09", "10", "11", "12", "", "-"],
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
          "offsetStart": 169,
          "offsetEnd": 170,
          "columnNum": 13
        },
        "fieldLength": 2,
        "expectedValues": [],
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
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", ""],
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 195,
          "offsetEnd": 195,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SRC16_RPT",
        "otherPossibleNames": [],
        "logicalName": "SRC16_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "canBeNull": "N",
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
        "physicalName": "SDUA_GAVS_RPT",
        "otherPossibleNames": [],
        "logicalName": "SDUA_GAVS_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 200,
          "offsetEnd": 201,
          "columnNum": 38
        },
        "fieldLength": 2,
        "expectedValues": ["", "30"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EOCPurpose_RPT",
        "otherPossibleNames": [],
        "logicalName": "EOCPURPOSE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 202,
          "offsetEnd": 202,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RetestFlag",
        "otherPossibleNames": [],
        "logicalName": "RETESTFLAG",
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
        "physicalName": "TestOutFlag",
        "otherPossibleNames": [],
        "logicalName": "TESTOUTFLAG",
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
        "physicalName": "IR_RPT",
        "otherPossibleNames": [],
        "logicalName": "IR_RPT",
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
        "physicalName": "IV_RPT",
        "otherPossibleNames": [],
        "logicalName": "IV_RPT",
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
        "physicalName": "PIV_RPT",
        "otherPossibleNames": [],
        "logicalName": "PIV_RPT",
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
        "physicalName": "PTNA_RPT",
        "otherPossibleNames": [],
        "logicalName": "PTNA_RPT",
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
        "physicalName": "DNA_RPT",
        "otherPossibleNames": [],
        "logicalName": "DNA_RPT",
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
        "physicalName": "SWDFlag",
        "otherPossibleNames": [],
        "logicalName": "SWDFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 210,
          "offsetEnd": 210,
          "columnNum": 47
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EIP",
        "otherPossibleNames": [],
        "logicalName": "EIP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 211,
          "offsetEnd": 211,
          "columnNum": 48
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
          "offsetStart": 212,
          "offsetEnd": 212,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "VideoSignLang",
        "otherPossibleNames": [],
        "logicalName": "VIDEOSIGNLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 213,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 214,
          "offsetEnd": 214,
          "columnNum": 51
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SummaryRPTFlag",
        "otherPossibleNames": [],
        "logicalName": "SUMMARYRPTFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 52
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
          "offsetEnd": 218,
          "columnNum": 53
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 219,
          "offsetEnd": 221,
          "columnNum": 54
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 222,
          "offsetEnd": 222,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["E", "P"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_RPT",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_RPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 223,
          "offsetEnd": 227,
          "columnNum": 56
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DupInvalid",
        "otherPossibleNames": [],
        "logicalName": "DUPINVALID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 228,
          "offsetEnd": 228,
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
          "offsetStart": 229,
          "offsetEnd": 252,
          "columnNum": 58
        },
        "fieldLength": 24,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CourseSec_PREID",
        "otherPossibleNames": [],
        "logicalName": "COURSESEC_PREID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 253,
          "offsetEnd": 255,
          "columnNum": 59
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CourseNum_PREID",
        "otherPossibleNames": [],
        "logicalName": "COURSENUM_PREID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 256,
          "offsetEnd": 265,
          "columnNum": 60
        },
        "fieldLength": 10,
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
          "offsetStart": 266,
          "offsetEnd": 271,
          "columnNum": 61
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 272,
          "offsetEnd": 272,
          "columnNum": 62
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
          "offsetStart": 273,
          "offsetEnd": 273,
          "columnNum": 63
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
          "offsetStart": 274,
          "offsetEnd": 274,
          "columnNum": 64
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
          "offsetStart": 275,
          "offsetEnd": 275,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "IR_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "IR_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 276,
          "offsetEnd": 276,
          "columnNum": 66
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "IV_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "IV_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 277,
          "offsetEnd": 277,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PIV_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "PIV_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 278,
          "offsetEnd": 278,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PTNAFlag_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "PTNAFLAG_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 279,
          "offsetEnd": 279,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SDUBCode_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "SDUBCODE_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 280,
          "offsetEnd": 284,
          "columnNum": 70
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CondAdmin_COLLECTED",
        "otherPossibleNames": [],
        "logicalName": "CONDADMIN_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 285,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomIEP",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIEP_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 286,
          "offsetEnd": 286,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomELTPC",
        "otherPossibleNames": [],
        "logicalName": "ACCOMELTPC_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 287,
          "offsetEnd": 287,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomIAP",
        "otherPossibleNames": [],
        "logicalName": "ACCOMIAP_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 288,
          "offsetEnd": 288,
          "columnNum": 74
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomST",
        "otherPossibleNames": [],
        "logicalName": "ACCOMST_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 289,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomPRS",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPRS_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 290,
          "offsetEnd": 290,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomRSP",
        "otherPossibleNames": [],
        "logicalName": "ACCOMRSP_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 77
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AccomSCH",
        "otherPossibleNames": [],
        "logicalName": "ACCOMSCH_COLLECTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 292,
          "offsetEnd": 292,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Audio",
        "otherPossibleNames": [],
        "logicalName": "AUDIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 293,
          "offsetEnd": 293,
          "columnNum": 79
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ColorChooser",
        "otherPossibleNames": [],
        "logicalName": "COLORCHOOSER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 294,
          "offsetEnd": 294,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContrastingColor",
        "otherPossibleNames": [],
        "logicalName": "CONTRASTINGCOLOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 295,
          "offsetEnd": 295,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AudioPassages",
        "otherPossibleNames": [],
        "logicalName": "AUDIOPASSAGES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 296,
          "offsetEnd": 296,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HumanReader",
        "otherPossibleNames": [],
        "logicalName": "HUMANREADER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 297,
          "offsetEnd": 297,
          "columnNum": 83
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Masking",
        "otherPossibleNames": [],
        "logicalName": "MASKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 298,
          "offsetEnd": 298,
          "columnNum": 84
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContentArea",
        "otherPossibleNames": [],
        "logicalName": "CONTENTAREA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 299,
          "offsetEnd": 334,
          "columnNum": 85
        },
        "fieldLength": 36,
        "expectedValues": ["Ninth Grade Literature & Composition", "American Literature & Composition", "Coordinate Algebra", "Analytic Geometry", "Biology", "Physical Science", "United States History", "Econ/Business/Free Enterprise-GPS", "Economics/Business/Free Enterprise", "Algebra I", "Geometry"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ContentAreaCode",
        "otherPossibleNames": [],
        "logicalName": "CONTENTAREACODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 335,
          "offsetEnd": 336,
          "columnNum": 86
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"],
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
          "offsetStart": 337,
          "offsetEnd": 338,
          "columnNum": 87
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
          "offsetStart": 339,
          "offsetEnd": 340,
          "columnNum": 88
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SS",
        "otherPossibleNames": [],
        "logicalName": "SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 341,
          "offsetEnd": 343,
          "columnNum": 89
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHLevel",
        "otherPossibleNames": [],
        "logicalName": "ACHLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 344,
          "offsetEnd": 344,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEM",
        "otherPossibleNames": [],
        "logicalName": "CONDSEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 345,
          "offsetEnd": 347,
          "columnNum": 91
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMHigh",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMHIGH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 348,
          "offsetEnd": 350,
          "columnNum": 92
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CondSEMLow",
        "otherPossibleNames": [],
        "logicalName": "CONDSEMLOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 351,
          "offsetEnd": 353,
          "columnNum": 93
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GCS",
        "otherPossibleNames": [],
        "logicalName": "GCS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 354,
          "offsetEnd": 356,
          "columnNum": 94
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
          "offsetStart": 357,
          "offsetEnd": 360,
          "columnNum": 95
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
          "offsetStart": 361,
          "offsetEnd": 366,
          "columnNum": 96
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
          "offsetStart": 367,
          "offsetEnd": 371,
          "columnNum": 97
        },
        "fieldLength": 5,
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
          "offsetStart": 372,
          "offsetEnd": 376,
          "columnNum": 98
        },
        "fieldLength": 5,
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
          "offsetStart": 377,
          "offsetEnd": 377,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "STRING",
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
          "offsetStart": 378,
          "offsetEnd": 378,
          "columnNum": 100
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
          "offsetStart": 379,
          "offsetEnd": 379,
          "columnNum": 101
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
          "offsetStart": 380,
          "offsetEnd": 380,
          "columnNum": 102
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 381,
          "offsetEnd": 381,
          "columnNum": 103
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 382,
          "offsetEnd": 382,
          "columnNum": 104
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
          "offsetStart": 383,
          "offsetEnd": 383,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["", "A", "B", "C", "D", "E", "F", "G"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StretchBand",
        "otherPossibleNames": [],
        "logicalName": "STRETCHBAND",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 384,
          "offsetEnd": 384,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
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
          "offsetStart": 385,
          "offsetEnd": 387,
          "columnNum": 107
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
          "offsetStart": 388,
          "offsetEnd": 396,
          "columnNum": 108
        },
        "fieldLength": 9,
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
          "offsetStart": 397,
          "offsetEnd": 405,
          "columnNum": 109
        },
        "fieldLength": 9,
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
          "offsetStart": 406,
          "offsetEnd": 415,
          "columnNum": 110
        },
        "fieldLength": 10,
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
          "offsetStart": 416,
          "offsetEnd": 439,
          "columnNum": 111
        },
        "fieldLength": 24,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ReadingStatus",
        "otherPossibleNames": [],
        "logicalName": "READINGSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 440,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom1",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 441,
          "offsetEnd": 441,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom2",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 442,
          "offsetEnd": 442,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom3",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 443,
          "offsetEnd": 443,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom4",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 444,
          "offsetEnd": 444,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom5",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 445,
          "offsetEnd": 445,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom6",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 446,
          "offsetEnd": 446,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom7",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 447,
          "offsetEnd": 447,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MasteryCategoryDom8",
        "otherPossibleNames": [],
        "logicalName": "MASTERYCATEGORYDOM8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 448,
          "offsetEnd": 448,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NP",
        "otherPossibleNames": [],
        "logicalName": "NRT_NP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 449,
          "offsetEnd": 450,
          "columnNum": 121
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NPRange",
        "otherPossibleNames": [],
        "logicalName": "NRT_NPRANGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 451,
          "offsetEnd": 455,
          "columnNum": 122
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NRT_NCE",
        "otherPossibleNames": [],
        "logicalName": "NRT_NCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 456,
          "offsetEnd": 457,
          "columnNum": 123
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
          "offsetStart": 458,
          "offsetEnd": 472,
          "columnNum": 124
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
          "offsetStart": 473,
          "offsetEnd": 487,
          "columnNum": 125
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
          "offsetStart": 488,
          "offsetEnd": 493,
          "columnNum": 126
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
          "offsetStart": 494,
          "offsetEnd": 494,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5"],
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
          "offsetStart": 495,
          "offsetEnd": 495,
          "columnNum": 128
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
          "offsetStart": 496,
          "offsetEnd": 499,
          "columnNum": 129
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
          "offsetStart": 500,
          "offsetEnd": 500,
          "columnNum": 130
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 501,
          "offsetEnd": 520,
          "columnNum": 131
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
          "offsetStart": 521,
          "offsetEnd": 540,
          "columnNum": 132
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DocumentID_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENTID_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 541,
          "offsetEnd": 560,
          "columnNum": 133
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestEventID_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "TESTEVENTID_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 561,
          "offsetEnd": 580,
          "columnNum": 134
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 600,
          "columnNum": 135
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 610,
          "columnNum": 136
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 611,
          "offsetEnd": 613,
          "columnNum": 137
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ContentAreaSort_DRCUse",
        "otherPossibleNames": [],
        "logicalName": "CONTENTAREASORT_DRCUSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 614,
          "offsetEnd": 615,
          "columnNum": 138
        },
        "fieldLength": 2,
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
          "offsetStart": 616,
          "offsetEnd": 765,
          "columnNum": 139
        },
        "fieldLength": 150,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
,
      {
        "physicalName": "Padded_X",
        "otherPossibleNames": [],
        "logicalName": "PADDED_X",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 766,
          "offsetEnd": 766,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": ["X"],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".txt"]
}