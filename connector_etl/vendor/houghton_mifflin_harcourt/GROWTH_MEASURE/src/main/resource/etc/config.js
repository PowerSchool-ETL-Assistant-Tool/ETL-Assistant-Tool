var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Houghton Mifflin Harcourt",
        PRODUCT_NAME: "GROWTH_MEASURE",
        CONNECTOR_NAME: "vendor.houghton_mifflin_harcourt.GROWTH_MEASURE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Houghton Mifflin Harcourt GROWTH_MEASURE",
                VENDOR_FOLDER_NAME: "HOUGHTON_MIFFLIN_HARCOURT",
                PRODUCT_FOLDER_NAME: "GROWTH_MEASURE",
                PERIODS:  ["ALL","EOY", "BOY", "MOY"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GM_59_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
