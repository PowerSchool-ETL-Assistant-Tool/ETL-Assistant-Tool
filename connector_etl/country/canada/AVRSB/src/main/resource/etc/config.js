var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Canada",
        PRODUCT_NAME: "AVRSB",
        CONNECTOR_NAME: "country.canada.AVRSB",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country canada AVRSB",
                VENDOR_FOLDER_NAME: "country_canada_AVRSB",
                PRODUCT_FOLDER_NAME: "AVRSB",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ENGLISH_COL_32.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MATH_COL_32.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
