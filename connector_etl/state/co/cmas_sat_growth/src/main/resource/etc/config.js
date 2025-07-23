var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CMAS_SAT_GROWTH",
        VENDOR_NAME: "CODOE",
        PRODUCT_NAME: "CMAS_SAT_GROWTH",
        CONNECTOR_NAME: "state.co.cmas_sat_growth",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CODOE CMAS SAT GROWTH",
                VENDOR_FOLDER_NAME: "CODOE",
                PRODUCT_FOLDER_NAME: "CMAS_SAT_GROWTH",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "CO_CMAS_SAT_GROWTH_2017_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "CO_CMAS_SAT_GROWTH_2018_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "CO_CMAS_SAT_GROWTH_2019_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CO_CMAS_SAT_GROWTH_20_21.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
