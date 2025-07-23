var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "LADOE",
        PRODUCT_NAME: "ELPA21",
        CONNECTOR_NAME: "state.la.AIR_ELPT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE AIR ELPT",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "AIR_ELPT",
                PERIODS:  ["ALL","SPRING","FALL","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "ELPA_2017-2018.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ELPA_2018_2019_Extended.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "ELPA_2019_2020_Extended.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ELPA_2020_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
