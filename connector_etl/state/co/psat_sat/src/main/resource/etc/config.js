var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "The College Board",
        PRODUCT_NAME: ["PSAT","SAT", "PSAT 8/9", "PSAT 10"],
        CONNECTOR_NAME: "state.co.psat_sat",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CODOE PSAT SAT",
                VENDOR_FOLDER_NAME: "CODOE",
                PRODUCT_FOLDER_NAME: "PSAT_SAT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CO_PSAT_SAT_2016.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CO_PSAT_SAT_2017_2019_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CO_PSAT_SAT_2020_2021_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CO_PSAT_SAT_2023_2024_111_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
