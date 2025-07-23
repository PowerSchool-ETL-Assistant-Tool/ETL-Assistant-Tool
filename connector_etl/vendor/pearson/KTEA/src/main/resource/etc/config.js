var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Pearson",
        PRODUCT_NAME: "KTEA",
        CONNECTOR_NAME: "vendor.pearson.KTEA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Pearson KTEA",
                VENDOR_FOLDER_NAME: "Pearson",
                PRODUCT_FOLDER_NAME: "KTEA",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "KTEA_346_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
