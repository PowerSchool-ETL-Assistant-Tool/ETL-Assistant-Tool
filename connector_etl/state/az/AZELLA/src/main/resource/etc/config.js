var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Pearson",
        PRODUCT_NAME: "Azella",
        CONNECTOR_NAME: "state.az.AZELLA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Pearson AZELLA",
                VENDOR_FOLDER_NAME: "Pearson",
                PRODUCT_FOLDER_NAME: "AZELLA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2014_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2015_2016_2017_ALT2.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2016_2017_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2017_2018_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2020_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2020_2021_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2017_SP.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2022_2023.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_txt_2022_2023_COL120.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZELLA_2023_2024.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
