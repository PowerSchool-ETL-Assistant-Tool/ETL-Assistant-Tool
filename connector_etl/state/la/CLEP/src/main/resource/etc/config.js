var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "The College Board",
        PRODUCT_NAME : "CLEP",
        CONNECTOR_NAME: "state.la.CLEP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE CLEP",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "CLEP",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2013-2014","2014-2015","2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "CLEP_2013-2016.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CLEP_11_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
