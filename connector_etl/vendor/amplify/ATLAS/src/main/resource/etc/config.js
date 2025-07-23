var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Amplify",
        PRODUCT_NAME: "ATLAS",
        CONNECTOR_NAME: "vendor.amplify.ATLAS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Amplify ATLAS",
                VENDOR_FOLDER_NAME: "Amplify",
                PRODUCT_FOLDER_NAME: "ATLAS",
                PERIODS: ["ALL","SPRING","FALL","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ATLAS_53_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
