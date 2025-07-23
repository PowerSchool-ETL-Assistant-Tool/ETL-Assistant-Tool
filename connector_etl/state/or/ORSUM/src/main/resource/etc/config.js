var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ORDOE",
        PRODUCT_NAME : "OR Summative",
        CONNECTOR_NAME: "state.or.ORSUM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ORDOE Summative Assessment",
                VENDOR_FOLDER_NAME: "ORDOE",
                PRODUCT_FOLDER_NAME: "ORSUM",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ORSUM.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
