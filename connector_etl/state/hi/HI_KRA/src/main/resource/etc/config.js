var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "KRA",
        VENDOR_NAME: "HIDOE",
        PRODUCT_NAME: "HI_KRA",
        CONNECTOR_NAME: "state.hi.HI_KRA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "HIDOE HI_KRA",
                VENDOR_FOLDER_NAME: "HI",
                PRODUCT_FOLDER_NAME: "HI_KRA",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "HI_KRA_81_COLS_1.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());