var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "Scholastic",
        PRODUCT_NAME : "GRL",
        CONNECTOR_NAME: "vendor.scholastic.GRL",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Scholastic GRL",
                VENDOR_FOLDER_NAME: "SCHOLASTIC",
                PRODUCT_FOLDER_NAME: "GRL",
                PERIODS:  ["2200","2401","2403","2404","2405","2406","2500","2600","2603","2700","2701","2702","2703","2704","2709","2803","2804","2806","2903","ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "GRL.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
