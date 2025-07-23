var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "UTDOE",
        PRODUCT_NAME: "SAGE",
        CONNECTOR_NAME: "state.ut.sage",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "UTDOE Sage",
                VENDOR_FOLDER_NAME: "UTDOE",
                PRODUCT_FOLDER_NAME: "SAGE",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SAGE.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
