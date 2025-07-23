var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME: "PADOE",
        PRODUCT_NAME: "PASA",
        CONNECTOR_NAME: "state.pa.PASA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "PADOE PASA",
                VENDOR_FOLDER_NAME: "PADOE",
                PRODUCT_FOLDER_NAME: "PASA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PASA_2017.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PASA_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PASA_2019_NoScience.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
