var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "PADOE",
        PRODUCT_NAME: ["GLOSS", "IKAN"],
        CONNECTOR_NAME: "state.pa.GLOSS_IKAN",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "PADOE GLOSS/IKAN",
                VENDOR_FOLDER_NAME: "PADOE",
                PRODUCT_FOLDER_NAME: "GLOSS_IKAN",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "GLOSS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "IKAN.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
