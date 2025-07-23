var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "CEM",
        PRODUCT_NAME: "CEM_ALIS",
        CONNECTOR_NAME: "vendor.CEM.CEM_ALIS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CEM_ALIS",
                VENDOR_FOLDER_NAME: "CEM",
                PRODUCT_FOLDER_NAME: "CEM_ALIS",
                PERIODS:  ["ALL", "FALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CEM_ALIS_22_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());