var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "INSTRUCTURE",
        PRODUCT_NAME: ["GAP", "BENCHMARK"],
        CONNECTOR_NAME: "vendor.instructure.GAP_BENCHMARK",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "INSTRUCTURE/GAP",
                VENDOR_FOLDER_NAME: "instructure",
                PRODUCT_FOLDER_NAME: "GAP",
                PERIODS: ["ALL","FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GAP_BENCHMARK.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            },
            {
                UI_DISPLAY_NAME: "INSTRUCTURE/BENCHMARK",
                VENDOR_FOLDER_NAME: "instructure",
                PRODUCT_FOLDER_NAME: "BENCHMARK",
                PERIODS: ["ALL","FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GAP_BENCHMARK.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
