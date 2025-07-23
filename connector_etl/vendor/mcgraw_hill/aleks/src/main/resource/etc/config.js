var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "McGraw Hill",
        PRODUCT_NAME: "ALEKS",
        CONNECTOR_NAME: "vendor.mcgraw_hill.aleks",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MCGRAW-HILL ALEKS",
                VENDOR_FOLDER_NAME: "MCGRAW_HILL",
                PRODUCT_FOLDER_NAME: "ALEKS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "aleks2018.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ALEKS_28_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
