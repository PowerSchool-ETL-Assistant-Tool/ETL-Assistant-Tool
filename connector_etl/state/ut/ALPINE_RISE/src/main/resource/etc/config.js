var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "UTDOE",
        PRODUCT_NAME : "ALPINE_RISE",
        CONNECTOR_NAME: "state.ut.ALPINE_RISE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "UTDOE Alpine Rise",
                VENDOR_FOLDER_NAME: "UTDOE",
                PRODUCT_FOLDER_NAME: "ALPINE_RISE",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Alpine_Rise_30_Col.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
