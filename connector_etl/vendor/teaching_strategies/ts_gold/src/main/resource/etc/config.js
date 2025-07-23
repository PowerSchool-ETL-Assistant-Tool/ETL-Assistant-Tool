var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "Teaching Strategies",
        PRODUCT_NAME : "TS Gold",
        CONNECTOR_NAME: "vendor.teaching_strategies.ts_gold",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Teaching Strategies TS Gold",
                VENDOR_FOLDER_NAME: "TEACHING_STRATEGIES",
                PRODUCT_FOLDER_NAME: "TS_GOLD",
                PERIODS:  ["Spring","Winter","Fall"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "TS_GOLD.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "TS_GOLD_LDOE_WINTER.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "TS_GOLD_LDOE_FALL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "TS_GOLD_LDOE_SPRING.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "TS_GOLD_WINTER_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "TS_GOLD_FALL_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "TS_GOLD_SPRING_2021.sig",
                        CLIENT_CODE: ["Spring"]
                    },
                    {
                         YEARS: ["2017-2018","2025-2026","*"],
                         SIGNATURE_FILE: "TS_GOLD_1718.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2018-2019","2025-2026","*"],
                         SIGNATURE_FILE: "TS_GOLD_1819.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2019-2020","2025-2026","*"],
                         SIGNATURE_FILE: "TS_GOLD_1920.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_2021.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_WINTER_2022.sig",
                         CLIENT_CODE: ["Winter"]
                    },
                    {
                         YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_FALL_2022.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_FALL_2021.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_FALL_20_21.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2021-2022","2025-2026","*"],
                         SIGNATURE_FILE: "TS_GOLD_FALL_2122.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2021-2022","2025-2026","*"],
                         SIGNATURE_FILE: "TS_GOLD_WINTER_2122.sig",
                         CLIENT_CODE: ["Winter"]
                    },
                    {
                         YEARS: ["2020-2021","2025-2026","*"],
                         SIGNATURE_FILE: "TSGOLD_2021_FALL_LONG.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2020-2021","2025-2026","*"],
                         SIGNATURE_FILE: "TSGOLD_SPRING_2021_LONG.sig",
                         CLIENT_CODE: ["Spring"]
                    },
                    {
                         YEARS: ["2020-2021","2025-2026","*"],
                         SIGNATURE_FILE: "TSGOLD_WINTER_2021_LONG.sig",
                         CLIENT_CODE: ["Winter"]
                    },
                    {
                         YEARS: ["2021-2022","2025-2026","*"],
                         SIGNATURE_FILE: "TSGOLD_FALL_2122_LONG.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2021-2022","2025-2026","*"],
                         SIGNATURE_FILE: "TSGOLD_WINTER_2122_LONG.sig",
                         CLIENT_CODE: ["Winter"]
                    },
                    {
                         YEARS: ["2021-2022","2025-2026","*"],
                         SIGNATURE_FILE: "TSGOLD_2122_SPRING_LONG.sig",
                         CLIENT_CODE: ["Spring"]
                    },
                    {
                         YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_FALL_2017_22.sig",
                         CLIENT_CODE: ["Fall"]
                    },
                    {
                         YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "TS_GOLD_WINTER_2017_22.sig",
                         CLIENT_CODE: ["Winter"]
                    },
                    {
                          YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                          SIGNATURE_FILE: "TS_GOLD_SPRING_2017_22.sig",
                          CLIENT_CODE: ["Spring"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "TSGOLD_Spring_2324.sig",
                        CLIENT_CODE: ["Fall"]
                    },
                    {
                          YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                          SIGNATURE_FILE: "TSGOLD_Fall_2324.sig",
                          CLIENT_CODE: ["Fall"]
                    },
                    {
                          YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                          SIGNATURE_FILE: "TSGOLD_WINTER_23-24.sig",
                          CLIENT_CODE: ["Winter"]
                    },
                    {
                          YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                          SIGNATURE_FILE: "TS_GOLD_QTR_ALL.sig",
                          CLIENT_CODE: ["Spring","Winter","Fall"]
                    },
                    {
                          YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                          SIGNATURE_FILE: "TSGOLD_WINTER_24-25.sig",
                          CLIENT_CODE: ["Winter"]
                    },
                    {
                          YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                          SIGNATURE_FILE: "TS_GOLD_274COLS.sig",
                          CLIENT_CODE: ["Winter"]
                    }
                ]
            }
        ]
    }
}());
