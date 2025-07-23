var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "uae",
        PRODUCT_NAME: "EMSAT",
        CONNECTOR_NAME: "country.uae.EMSAT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country uae EMSAT",
                VENDOR_FOLDER_NAME: "country_uae_EMSAT",
                PRODUCT_FOLDER_NAME: "uae",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EMSAT_RESULTS_15_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EMSAT_RESULTS_11_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
