var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ASVAB",
        PRODUCT_NAME : "ASVAB",
        CONNECTOR_NAME: "vendor.ASVAB.ASVAB",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ASVAB ASVAB",
                VENDOR_FOLDER_NAME: "ASVAB",
                PRODUCT_FOLDER_NAME: "ASVAB",
                PERIODS:  ["ALL","SPRING","FALL","WINTER"],
                SIGNATURES: [
                    {
                       YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "ASVAB20_21.sig",
                       CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
