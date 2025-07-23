var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Rome",
        PRODUCT_NAME: "DRA",
        CONNECTOR_NAME: "country.rome.ROME_DRA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country Rome DRA",
                VENDOR_FOLDER_NAME: "country_rome_DRA",
                PRODUCT_FOLDER_NAME: "ROME_DRA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ROME_DRA.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
