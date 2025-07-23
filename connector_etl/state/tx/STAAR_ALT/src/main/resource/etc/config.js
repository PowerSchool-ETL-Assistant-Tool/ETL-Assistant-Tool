var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "TXDOE",
        PRODUCT_NAME: "STAAR_ALT",
        CONNECTOR_NAME: "state.tx.STAAR_ALT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Texas STAAR ALT",
                VENDOR_FOLDER_NAME: "Texas",
                PRODUCT_FOLDER_NAME: "STAAR_ALT",
                PERIODS:  ["ALL", "Spring"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ALT_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_ALT_121_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_ALT_60_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
