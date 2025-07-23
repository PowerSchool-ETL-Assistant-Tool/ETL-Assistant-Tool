var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Pearson",
        PRODUCT_NAME: "WRMT",
        CONNECTOR_NAME: "vendor.pearson.WRMT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Pearson WRMT",
                VENDOR_FOLDER_NAME: "Pearson",
                PRODUCT_FOLDER_NAME: "WRMT",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "WRMT_2223.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
