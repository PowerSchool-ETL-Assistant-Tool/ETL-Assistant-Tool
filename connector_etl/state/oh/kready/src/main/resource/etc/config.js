var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "KREADY",
        VENDOR_NAME: "OHDOE",
        PRODUCT_NAME: "KREADY",
        CONNECTOR_NAME: "state.oh.kready",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "OHDOE KREADY",
                VENDOR_FOLDER_NAME: "OHDOE",
                PRODUCT_FOLDER_NAME: "KREADY",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KREADY_20_21.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
