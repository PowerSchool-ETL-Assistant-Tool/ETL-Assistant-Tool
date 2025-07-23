var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ILDOE",
        PRODUCT_NAME : "PRESCHOOL-DRDP",
        CONNECTOR_NAME: "state.il.PRESCHOOL-DRDP",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "IL/PRESCHOOL-DRDP",
                        VENDOR_FOLDER_NAME: "IL",
                        PRODUCT_FOLDER_NAME: "PRESCHOOL-DRDP",
                        PERIODS:  ["ALL", "WINTER", "SPRING", "FALL"],
                        SIGNATURES: [
                            {
                                YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "PRESCHOOL-DRDP.sig",
                                CLIENT_CODE: ["ALL"]
                            }
                        ]
                    }
                ]
    }
}());
