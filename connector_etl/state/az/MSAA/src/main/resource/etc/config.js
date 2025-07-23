var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AZDOE",
        PRODUCT_NAME: "MSAA",
        CONNECTOR_NAME: "state.az.MSAA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AZDOE MSAA",
                VENDOR_FOLDER_NAME: "AZDOE",
                PRODUCT_FOLDER_NAME: "MSAA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MSAA.sig" ,
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MSAA_92_COLS.sig" ,
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
