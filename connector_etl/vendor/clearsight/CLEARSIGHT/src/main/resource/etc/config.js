var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ClearSight",
        PRODUCT_NAME : "CLEARSIGHT",
        CONNECTOR_NAME: "vendor.clearsight.CLEARSIGHT",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "ClearSight CLEARSIGHT",
                        VENDOR_FOLDER_NAME: "ClearSight",
                        PRODUCT_FOLDER_NAME: "CLEARSIGHT",
                        PERIODS:  ["ALL"],
                        SIGNATURES: [
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                                SIGNATURE_FILE: "IN_FALL_WINTER_2022-23.sig",
                                CLIENT_CODE: ["ALL"]
                            },
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                                SIGNATURE_FILE: "IN_SPRING_2022-23.sig",
                                CLIENT_CODE: ["ALL"]
                            }
                        ]
                    }
                ]
            }
        }());

