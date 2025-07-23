var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: ["CADOE","CAASPP_PRELIMINARY","SBA"],
        PRODUCT_NAME: ["CAASPP","CAASPP_PRELIMINARY", "IAB","ICA","SBA"],
        CONNECTOR_NAME: "state.ca.caaspp_interim_and_summative",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CADOE CAASPP Interim and Summative",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "CAASPP_INTERIM_AND_SUMMATIVE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_INT_SUM_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_INT_SUM_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_INT_SUM_IAB.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_INTSUMM_ELA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_INTSUMM_MA.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
