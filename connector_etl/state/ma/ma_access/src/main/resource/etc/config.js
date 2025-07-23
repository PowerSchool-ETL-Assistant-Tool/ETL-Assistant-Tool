var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MA",
        PRODUCT_NAME: "MA_ACCESS",
        CONNECTOR_NAME: "state.ma.ma_access",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MADOE ACCESS",
                VENDOR_FOLDER_NAME: "MADOE",
                PRODUCT_FOLDER_NAME: "MA_ACCESS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MA_ACCESS_18.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MA_ACCESS_22.sig",
                         CLIENT_CODE: ["ALL"]
                     },
                     {
                         YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MA_ACCESS_74COLS.sig",
                         CLIENT_CODE: ["ALL"]
                     }
                ]
            }
        ]
    }
}());
