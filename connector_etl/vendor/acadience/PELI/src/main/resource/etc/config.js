var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME: "ACADIENCE",
        PRODUCT_NAME: "PELI",
        CONNECTOR_NAME: "vendor.acadience.PELI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ACADIENCE PELI",
                VENDOR_FOLDER_NAME: "ACADIENCE",
                PRODUCT_FOLDER_NAME: "PELI",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "PELI_23_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
