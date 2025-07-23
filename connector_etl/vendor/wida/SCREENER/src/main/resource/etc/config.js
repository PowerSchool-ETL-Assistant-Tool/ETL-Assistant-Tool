var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "WIDA",
        PRODUCT_NAME: "SCREENER",
        CONNECTOR_NAME: "vendor.wida.SCREENER",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WIDA SCREENER",
                VENDOR_FOLDER_NAME: "WIDA",
                PRODUCT_FOLDER_NAME: "SCREENER",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "WIDA_SCREENER_2024-2025.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "2024-2025_EL_SCREENER.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
