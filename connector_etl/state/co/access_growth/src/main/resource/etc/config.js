var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CODOE",
        PRODUCT_NAME: "ACCESS_GROWTH",
        CONNECTOR_NAME: "state.co.access_growth",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WIDA ACCESS GROWTH",
                VENDOR_FOLDER_NAME: "CODOE",
                PRODUCT_FOLDER_NAME: "ACCESS_GROWTH",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACCESS_GROWTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACCESS_GROWTH_2.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
