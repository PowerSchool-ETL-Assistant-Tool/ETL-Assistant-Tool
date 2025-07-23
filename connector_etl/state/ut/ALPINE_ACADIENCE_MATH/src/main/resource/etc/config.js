var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "UTDOE",
        PRODUCT_NAME : "ALPINE_ACADIENCE_MATH",
        CONNECTOR_NAME: "state.ut.ALPINE_ACADIENCE_MATH",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "UTDOE Alpine Acadience Math",
                VENDOR_FOLDER_NAME: "UTDOE",
                PRODUCT_FOLDER_NAME: "ALPINE_ACADIENCE_MATH",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ALPINE_ACADIENCE_23_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
