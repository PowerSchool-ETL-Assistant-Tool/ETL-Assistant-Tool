var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "VADOE",
        PRODUCT_NAME: "VALLSS",
        CONNECTOR_NAME: "state.va.VALLSS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "VADOE VALLSS",
                VENDOR_FOLDER_NAME: "VADOE",
                PRODUCT_FOLDER_NAME: "VALLSS",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "VALLSS_65_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "VALLS_46_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
