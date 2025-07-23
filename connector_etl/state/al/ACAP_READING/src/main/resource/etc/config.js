var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AL",
        PRODUCT_NAME: ["ACAP_READING", "ACAP_READING_SUPPLEMENT"],
        CONNECTOR_NAME: "state.al.ACAP_READING",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AL ACAP_READING",
                VENDOR_FOLDER_NAME: "AL",
                PRODUCT_FOLDER_NAME: "ACAP_READING",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACAP_READING_19_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACAP_READING_SUPPLIMENT_38C.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
