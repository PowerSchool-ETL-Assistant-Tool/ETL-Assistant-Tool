var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: ["CADOE", "SBA"],
        PRODUCT_NAME: ["CAASPP", "SBA"],
        CONNECTOR_NAME: "state.ca.caaspp_1516",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CADOE CAASPP 2015-2016 (and later)",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "CAASPP_1516",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1516.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1718_WITH_CAST.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1819_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1819_J20_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1920_CSA_CAAS_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1920_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_FW_1516.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_FW_1617.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1617_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CAASPP_DEL_2021_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_FW_1617_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_FW_1718_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_1718_CSV_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_FW_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CAASPP_DEL_2021_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_NEW_1516.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_1718_CSV_ALT_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_DEL_1819_J20_CSV_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2018-2019","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_DEL_1819_CSV_NEW.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_FW_1718.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2020-2021","2021-2022","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_FW_2021.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2020-2021","2021-2022","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_FW_2021_365_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2020-2021","2021-2022","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_FW_21_22.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "SBAC_ALL_18_19.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "SBAC_SCORES_17_18.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "CAASPP_DEL_2122_CSV.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "CAASPP_2021_365_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "CAASPP_363_1_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "CAASPP_FIXED_LENGTH_363_COL.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "CAASPP_364_1_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CAASPP_375_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "CAASPP_401_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
