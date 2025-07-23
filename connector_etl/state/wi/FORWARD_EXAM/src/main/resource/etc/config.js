var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "WIDOE",
        PRODUCT_NAME: "FORWARD_EXAM",
        CONNECTOR_NAME: "state.wi.FORWARD_EXAM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WI FORWARD_EXAM",
                VENDOR_FOLDER_NAME: "WIDOE",
                PRODUCT_FOLDER_NAME: "FORWARD_EXAM",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FE_370_COLS_DELIM.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
