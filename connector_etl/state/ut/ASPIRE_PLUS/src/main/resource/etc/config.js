var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "UTDOE",
        PRODUCT_NAME: "ASPIRE_PLUS",
        CONNECTOR_NAME: "state.ut.ASPIRE_PLUS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "UTDOE ASPIRE_PLUS",
                VENDOR_FOLDER_NAME: "UTDOE",
                PRODUCT_FOLDER_NAME: "ASPIRE_PLUS",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "UT_UTAH_ASPIRE18.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "UT_UTAH_ASPIRE21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ASPIRE_33_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
