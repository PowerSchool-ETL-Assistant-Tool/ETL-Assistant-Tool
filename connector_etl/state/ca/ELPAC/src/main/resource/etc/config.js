var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "ELPAC",
        VENDOR_NAME: "CADOE",
        PRODUCT_NAME: "ELPAC",
        CONNECTOR_NAME: "state.ca.ELPAC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CADOE ELPAC",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "ELPAC",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2020-2021","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_1718.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_1819_SPACES.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_FIXEDWIDTH_1718.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_FIXEDWIDTH_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_SE_DELIMITED_1920.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_SE_DELIMITED_LONGDASH_1920.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_SE_DELIMITED_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_SE_DELIMITED_2021_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_FIXED_LENGTH_21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_COMMA_21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_DELIMETED_18_19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_DELIMITED_SUMMATIVE_21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_SE_COMMA_DELIMITED_1920.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_FIXED_LENGTH_22_23.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_370_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_39_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_36_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_32_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "ELPAC_TO_MISIS_COL_56.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
