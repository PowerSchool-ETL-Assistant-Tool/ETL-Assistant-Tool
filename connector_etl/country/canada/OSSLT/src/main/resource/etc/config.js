var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Canada",
        PRODUCT_NAME: "OSSLT",
        CONNECTOR_NAME: "country.canada.OSSLT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country canada OSSLT",
                VENDOR_FOLDER_NAME: "country_canada_OSSLT",
                PRODUCT_FOLDER_NAME: "OSSLT",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "OSSLT_17_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "OSSLT_98COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "OSSLT_90COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "OSSLT_89COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
