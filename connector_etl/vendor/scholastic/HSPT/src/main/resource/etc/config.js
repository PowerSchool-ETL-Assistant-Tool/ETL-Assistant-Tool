var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "Scholastic",
        PRODUCT_NAME : "HSPT",
        CONNECTOR_NAME: "vendor.scholastic.HSPT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Scholastic HSPT",
                VENDOR_FOLDER_NAME: "SCHOLASTIC",
                PRODUCT_FOLDER_NAME: "HSPT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AUTOMATION_10_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "HSPT_44_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
