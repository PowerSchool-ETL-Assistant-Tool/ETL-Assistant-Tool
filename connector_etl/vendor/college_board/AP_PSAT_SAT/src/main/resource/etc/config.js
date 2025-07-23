var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "CEEB",
        VENDOR_NAME: "The College Board",
        PRODUCT_NAME: ["PSAT","SAT", "AP Potential", "PSAT 8/9", "PSAT 10","AP","AP PSAT SAT"],
        CONNECTOR_NAME: "vendor.college_board.AP_PSAT_SAT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "The College Board AP_PSAT_SAT",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "AP_PSAT_SAT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "ap_psat_sat_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "ap_psat_sat_2018_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                       SIGNATURE_FILE: "ap_psat_sat_2019_2020.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "AP_Assessment_Scores_2122.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "AP_SCHOOL_ORGANIZATION_SCORE_ROSTER_ALLYEAR.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "AP_26_COLS_22_23.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "AP_PSAT_185_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());