var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "KEEP",
        VENDOR_NAME : "USBE",
        PRODUCT_NAME : "KEEP",
        CONNECTOR_NAME: "state.ut.keep",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "USBE KEEP",
                        VENDOR_FOLDER_NAME: "USBE",
                        PRODUCT_FOLDER_NAME: "KEEP",
                        PERIODS: ["ALL","Entry","Exit"],
                        SIGNATURES: [
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                                SIGNATURE_FILE: "KEEP.sig",
                                CLIENT_CODE: ["ALL"]
                            }
                        ]
                    }
                ]
            }
        }());
