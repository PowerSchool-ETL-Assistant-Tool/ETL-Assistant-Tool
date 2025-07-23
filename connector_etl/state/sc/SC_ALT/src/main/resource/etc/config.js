var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "SC",
        PRODUCT_NAME: "SC_ALT",
        CONNECTOR_NAME: "state.sc.SC_ALT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "SC ALT",
                VENDOR_FOLDER_NAME: "SC",
                PRODUCT_FOLDER_NAME: "SC_ALT",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SC_ALT_25_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
