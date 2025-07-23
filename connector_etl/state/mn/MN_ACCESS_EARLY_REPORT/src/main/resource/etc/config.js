var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "WIDA",
        PRODUCT_NAME : ["ACCESS", "ACCESS 2.0", "ALTERNATE_ACCESS"],
        CONNECTOR_NAME: "state.mn.MN_ACCESS_EARLY_REPORT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MNDOE WIDA ACCESS EARLY REPORT",
                VENDOR_FOLDER_NAME: "MNDOE",
                PRODUCT_FOLDER_NAME: "MN_ACCESS_EARLY_REPORT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MN_ACCESS_EARLY_REPORT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MN_ACCESS_EARLY_REPORT_2122.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
