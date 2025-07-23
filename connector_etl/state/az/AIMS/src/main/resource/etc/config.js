var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AZDOE",
        PRODUCT_NAME: "AIMS",
        CONNECTOR_NAME: "state.az.AIMS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AZDOE AIMS",
                VENDOR_FOLDER_NAME: "AZDOE",
                PRODUCT_FOLDER_NAME: "AIMS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2014_2015.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2015_2016.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2016_2017.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2017_2018.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2018_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2019_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2017_2018_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AIMS_2018_2019_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "AIMS_2016_2017_NEW.sig",
                         CLIENT_CODE: ["ALL"]
                     },
                     {
                         YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "AIMS_2015_2016_NEW.sig",
                         CLIENT_CODE: ["ALL"]
                     }
                ]
            }
        ]
    }
}());
