var AppAssessmentConfig = (function() {
        return {
  VENDOR_SCHOOL_ID_TYPE: "",
  VENDOR_NAME: "NY",
  PRODUCT_NAME: "NYSITELL",
  CONNECTOR_NAME: "state.ny.NYSITELL",
  PRODUCT_LIST: [
    {
      UI_DISPLAY_NAME: "NY NYSITELL",
      VENDOR_FOLDER_NAME: "NY",
      PRODUCT_FOLDER_NAME: "NYSITELL",
      PERIODS: [
        "ALL",
        "FALL",
        "WINTER",
        "SPRING"
      ],
      SIGNATURES: [
        {
          YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
          SIGNATURE_FILE: "NYSITELL_12_1_COLS.sig",
          CLIENT_CODE: [
            "ALL"
          ]
        },
        {
          YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
          SIGNATURE_FILE: "NYSITELL_8COLS.sig",
          CLIENT_CODE: [
            "ALL"
          ]
        }
      ]
    }
  ]
} }());