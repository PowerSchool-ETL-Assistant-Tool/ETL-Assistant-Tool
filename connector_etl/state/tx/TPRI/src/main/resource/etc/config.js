var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "Texas",
        PRODUCT_NAME : "TPRI",
        CONNECTOR_NAME: "state.tx.TPRI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Texas TPRI",
                VENDOR_FOLDER_NAME: "Texas",
                PRODUCT_FOLDER_NAME: "TPRI",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "TEJAS_COLS25.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "TRI_COLS31.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
