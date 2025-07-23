var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "The College Board",
        PRODUCT_NAME: ["PSAT", "SAT", "AP Potential", "PSAT 8/9", "PSAT 10"],
        CONNECTOR_NAME: "vendor.college_board.psat_sat_redesign",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "The College Board PSAT_SAT_REDESIGN",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "PSAT_SAT_REDESIGN",
                PERIODS: ["ALL","SPRING","WINTER","FALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_REDESIGN_DELIMITED_NEW_2018_2019_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_NEW_REDESIGNED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_NEW_REDESIGNED_18_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_NEW_REDESIGNED_18_2019_redisigned.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_NEW_REDESIGNED_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "PSAT_BELL_15.sig",
                        CLIENT_CODE: ["BSD"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSATNMSQT_PSAT10_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSATNMSQT_PSAT10_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_1415_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_BELL_16.sig",
                        CLIENT_CODE: ["BSD"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_BELL_17.sig",
                        CLIENT_CODE: ["BSD"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_FIXEDWIDTH_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_2020_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_1920.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_DELIMITED_202021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_GENDER_2020_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "PSAT_2018-2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "PSAT_2018_2019_GRD11.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_BJSHS_MVHS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_82_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "PSAT_90_1_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                    YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                    SIGNATURE_FILE: "PSAT_18_19.sig",
                    CLIENT_CODE: ["ALL"]
                    },
                    {
                    YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                    SIGNATURE_FILE: "PSAT_348_1_COLS.sig",
                    CLIENT_CODE: ["ALL"]
                    },
                    {
                    YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                    SIGNATURE_FILE: "PSAT_65_1_COLS.sig",
                    CLIENT_CODE: ["ALL"]
                    },
                    {
                    YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                    SIGNATURE_FILE: "PSAT_72_1_COLS.sig",
                    CLIENT_CODE: ["ALL"]
                    }
                ]
            },
            {
                UI_DISPLAY_NAME: "The College Board PSAT",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "PSAT",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "PSAT_BELL_15.sig",
                        CLIENT_CODE: ["BSD"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSATNMSQT_PSAT10_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "PSATNMSQT_PSAT10_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            },
            {
                UI_DISPLAY_NAME: "The College Board PSAT 8/9",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "PSAT_8_9",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_60_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            },
            {
                UI_DISPLAY_NAME: "The College Board PSAT 10",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "PSAT_10",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSATNMSQT_PSAT10_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "PSATNMSQT_PSAT10_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            },
            {
                UI_DISPLAY_NAME: "The College Board SAT",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "SAT",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_1415_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_BELL_16.sig",
                        CLIENT_CODE: ["BSD"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_BELL_17.sig",
                        CLIENT_CODE: ["BSD"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_REDESIGN_FIXEDWIDTH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_DELIMITED_202021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_GENDER_2020_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_1920.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_DELIMITED_2020_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "SAT_2019_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_ROSTER.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_REDESIGN_76COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "SAT_114_COLS_2022_2023.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "PSAT_870_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "SAT_84_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_870_COLS_1.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PSAT89_65_COLS_2324.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SAT_220_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
