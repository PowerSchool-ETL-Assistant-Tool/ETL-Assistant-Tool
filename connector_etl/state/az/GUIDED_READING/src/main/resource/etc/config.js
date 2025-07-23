var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "AZDOE",
        PRODUCT_NAME : "GUIDED_READING",
        CONNECTOR_NAME: "state.az.GUIDED_READING",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "AZDOE GUIDED_READING",
                        VENDOR_FOLDER_NAME: "AZDOE",
                        PRODUCT_FOLDER_NAME: "GUIDED_READING",
                        PERIODS: ["ALL", "Beginning", "Middle", "End"],
                        SIGNATURES: [
                            {
                                YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                                SIGNATURE_FILE: "GUIDED_READING_2122_BOY.sig",
                                CLIENT_CODE: ["ALL"]
                            }
                        ]
                    }
                ]
            }
        }());