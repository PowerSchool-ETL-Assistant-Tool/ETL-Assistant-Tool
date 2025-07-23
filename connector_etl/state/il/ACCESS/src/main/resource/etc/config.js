var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IL_WIDA",
        PRODUCT_NAME: "IL_ACCESS",
        CONNECTOR_NAME: "state.il.ACCESS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "IL ACCESS",
                VENDOR_FOLDER_NAME: "IL_WIDA",
                PRODUCT_FOLDER_NAME: "IL_ACCESS",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACCESS_42COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    };
})();
