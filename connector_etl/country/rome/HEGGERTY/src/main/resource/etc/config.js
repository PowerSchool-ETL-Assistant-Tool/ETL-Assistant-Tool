var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Rome",
        PRODUCT_NAME: "HEGGERTY",
        CONNECTOR_NAME: "country.rome.HEGGERTY",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country HEGGERTY",
                VENDOR_FOLDER_NAME: "country_HEGGERTY",
                PRODUCT_FOLDER_NAME: "HEGGERTY",
                PERIODS:  ["ALL", "FALL", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Heggerty.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Heggerty_26_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());