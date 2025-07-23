var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "VADOE",
        PRODUCT_NAME: "MASTERY_CONNECT_VA",
        CONNECTOR_NAME: "state.va.MASTERY_CONNECT_VA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "VADOE MASTERY_CONNECT_VA",
                VENDOR_FOLDER_NAME: "VADOE",
                PRODUCT_FOLDER_NAME: "MASTERY_CONNECT_VA",
                PERIODS:  ["ALL", "Quarter1", "Quarter2"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MASTERY_CONNECT_VA_COL96.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MASTERY_CONNECT_VA_COL145.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
