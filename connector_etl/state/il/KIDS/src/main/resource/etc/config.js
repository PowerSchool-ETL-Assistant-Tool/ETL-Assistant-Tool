var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ILDOE",
        PRODUCT_NAME : "KIDS",
        CONNECTOR_NAME: "state.il.KIDS",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "IL/KIDS",
                        VENDOR_FOLDER_NAME: "IL",
                        PRODUCT_FOLDER_NAME: "KIDS",
                        PERIODS:  ["ALL", "FALL", "SPRING", "WINTER"],
                        SIGNATURES: [
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "KIDS.sig",
                                CLIENT_CODE: ["ALL"]
                            },
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "KIDS_2020.sig",
                                CLIENT_CODE: ["ALL"]
                            },
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "KIDS_2018_V4.sig",
                                CLIENT_CODE: ["ALL"]
                            }
                        ]
                    }
                ]
    }
}());
