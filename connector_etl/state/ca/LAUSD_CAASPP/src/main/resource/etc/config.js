var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IODS",
        PRODUCT_NAME: "CAASPP",
        CONNECTOR_NAME: "state.ca.LAUSD_CAASPP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CADOE LAUSD_CAASPP 2015-2016 (and later)",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "LAUSD_CAASPP",
                PERIODS:  ["ALL"],
                SIGNATURES: [

                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_DELIM_87_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "LAUSD_CAASPP_50C.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "CAASPP_CAA_73COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
