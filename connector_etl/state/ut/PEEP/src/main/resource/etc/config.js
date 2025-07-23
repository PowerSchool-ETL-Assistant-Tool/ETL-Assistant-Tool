var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "PEEP",
        VENDOR_NAME : "USBE",
        PRODUCT_NAME : "PEEP",
        CONNECTOR_NAME: "state.ut.PEEP",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "USBE PEEP",
                        VENDOR_FOLDER_NAME: "USBE",
                        PRODUCT_FOLDER_NAME: "PEEP",
                        PERIODS: ["ALL","Entry","Exit"],
                        SIGNATURES: [
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                                SIGNATURE_FILE: "PEEP.sig",
                                CLIENT_CODE: ["ALL"]
                            },
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                                SIGNATURE_FILE: "PEEP_2122.sig",
                                CLIENT_CODE: ["ALL"]
                            }
                        ]
                    }
                ]
            }
        }());
