var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "NDDPI",
        PRODUCT_NAME: "ND_APLUS",
        CONNECTOR_NAME: "state.nd.ND_APLUS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ND ND_APLUS",
                VENDOR_FOLDER_NAME: "ND",
                PRODUCT_FOLDER_NAME: "ND_APLUS",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ND_APLUS_108_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ND_APLUS_146_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());