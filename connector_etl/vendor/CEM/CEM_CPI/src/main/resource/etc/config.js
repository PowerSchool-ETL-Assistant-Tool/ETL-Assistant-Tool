var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "CEM",
        PRODUCT_NAME: "CEM_CPI",
        CONNECTOR_NAME: "vendor.CEM.CEM_CPI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CEM_CPI",
                VENDOR_FOLDER_NAME: "CEM",
                PRODUCT_FOLDER_NAME: "CEM_CPI",
                PERIODS:  ["ALL", "Fall"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CEM_CPI_67_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
