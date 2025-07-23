var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "FastBridge",
        PRODUCT_NAME: "Comprehension Question",
        CONNECTOR_NAME: "vendor.fastbridge.comprehension_question",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FastBridge Comprehension Question",
                VENDOR_FOLDER_NAME: "FASTBRIDGE",
                PRODUCT_FOLDER_NAME: "COMPREHENSION_QUESTION",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "comp_2022.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Comprehension_Question_201_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Comprehension_Question_121_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
