var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "Pearson",
        PRODUCT_NAME : "BASC",
        CONNECTOR_NAME: "vendor.pearson.BASC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Pearson BASC",
                VENDOR_FOLDER_NAME: "Pearson",
                PRODUCT_FOLDER_NAME: "BASC",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "BASC_COL446.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());