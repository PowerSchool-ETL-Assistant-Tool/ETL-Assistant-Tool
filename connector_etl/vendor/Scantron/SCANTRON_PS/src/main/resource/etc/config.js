var AppAssessmentConfig = (function() {
        return {
  VENDOR_SCHOOL_ID_TYPE: "",
  VENDOR_NAME: "Scantron",
  PRODUCT_NAME: "SCANTRON_PS",
  CONNECTOR_NAME: "vendor.Scantron.SCANTRON_PS",
  PRODUCT_LIST: [
    {
      UI_DISPLAY_NAME: "Scantron SCANTRON_PS",
      VENDOR_FOLDER_NAME: "Scantron",
      PRODUCT_FOLDER_NAME: "SCANTRON_PS",
      PERIODS: [
        "ALL",
        "FALL",
        "SPRING",
        "WINTER"
      ],
      SIGNATURES: [
        {
          YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
          SIGNATURE_FILE: "SCANTRON_PS_25_1_COLS.sig",
          CLIENT_CODE: [
            "ALL"
          ]
        }
      ]
    }
  ]
} }());