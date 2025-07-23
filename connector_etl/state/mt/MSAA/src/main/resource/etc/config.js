var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "COGNIA",
        PRODUCT_NAME: "MT_MSAA",
        CONNECTOR_NAME: "state.mt.MSAA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "COGNIA MSAA",
                VENDOR_FOLDER_NAME: "COGNIA",
                PRODUCT_FOLDER_NAME: "MT_MSAA",
                PERIODS: ["ALL","SPRING","WINTER","FALL","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MSAA_101_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());