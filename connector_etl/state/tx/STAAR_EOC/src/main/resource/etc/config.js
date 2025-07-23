var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "TXDOE",
        PRODUCT_NAME : "STAAR",
        CONNECTOR_NAME: "state.tx.STAAR_EOC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Texas STAAR EOC",
                VENDOR_FOLDER_NAME: "Texas",
                PRODUCT_FOLDER_NAME: "STAAR_EOC",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_2016_EOC.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_2018_EOC.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2017.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2018.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2018_UNDERSCORED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2018_SUBJ.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2019_UNDERSCORED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2019_SUBJ.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2020_UNDERSCORED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_EOC_2022.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_2023_118_COL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2022-2023","2025-2026","*"],
                        SIGNATURE_FILE: "STAAR_2023_EOC.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
