var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AL",
        PRODUCT_NAME: "ACAP_ALTERNATE",
        CONNECTOR_NAME: "state.al.ACAP_ALTERNATE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AL ACAP ALTERNATE",
                VENDOR_FOLDER_NAME: "AL",
                PRODUCT_FOLDER_NAME: "ACAP_ALTERNATE",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACAP_ALT_20_21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACAP_ALT_002.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
