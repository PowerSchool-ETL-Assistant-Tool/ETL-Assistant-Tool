var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "CEM",
        PRODUCT_NAME: "CEM_BASE",
        CONNECTOR_NAME: "vendor.CEM.CEM_BASE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CEM_BASE",
                VENDOR_FOLDER_NAME: "CEM",
                PRODUCT_FOLDER_NAME: "CEM_BASE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CEM_BASE_32_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
