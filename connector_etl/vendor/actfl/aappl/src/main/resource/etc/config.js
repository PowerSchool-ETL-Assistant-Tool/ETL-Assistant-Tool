var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ACTFL",
        PRODUCT_NAME : "AAPPL",
        CONNECTOR_NAME: "vendor.actfl.aappl",
        PRODUCT_LIST: [
          {
             UI_DISPLAY_NAME: "ACTFL/AAPPL",
             VENDOR_FOLDER_NAME: "ACTFL",
             PRODUCT_FOLDER_NAME: "AAPPL",
             PERIODS: ["ALL"],
             SIGNATURES: [
                 {
                     YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                     SIGNATURE_FILE: "aappl.sig",
                     CLIENT_CODE: ["ALL"]
                 },
                {
                     YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                     SIGNATURE_FILE: "aappl_21_22.sig",
                     CLIENT_CODE: ["ALL"]
                 },
                 {
                     YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                     SIGNATURE_FILE: "AAPPL_COL_12.sig",
                     CLIENT_CODE: ["ALL"]
                 }
             ]
          }
        ]
    }
}());
