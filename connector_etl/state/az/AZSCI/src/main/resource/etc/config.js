var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AZDOE",
        PRODUCT_NAME: "AZSCI",
        CONNECTOR_NAME: "state.az.AZSCI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AZDOE AZSCI",
                VENDOR_FOLDER_NAME: "AZDOE",
                PRODUCT_FOLDER_NAME: "AZSCI",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZSCI_2022_SPRING.sig",
                        CLIENT_CODE: ["SPRING"]
                    },
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZSCI_2023_SPRING.sig",
                        CLIENT_CODE: ["SPRING"]
                    },
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZSCI_SPRING_COL221.sig",
                        CLIENT_CODE: ["SPRING"]
                    }
                ]
            }
        ]
    }
}());
