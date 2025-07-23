var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CTE",
        VENDOR_NAME: "CTECS",
        PRODUCT_NAME: "CTE",
        CONNECTOR_NAME: "state.id.CTE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ID CTE",
                VENDOR_FOLDER_NAME: "CTECS",
                PRODUCT_FOLDER_NAME: "CTE",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CTE_12_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
