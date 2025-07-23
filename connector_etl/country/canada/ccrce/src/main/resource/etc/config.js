var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Canada",
        PRODUCT_NAME: "CCRCE",
        CONNECTOR_NAME: "country.canada.CCRCE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country canada CCRCE",
                VENDOR_FOLDER_NAME: "country_canada_CCRCE",
                PRODUCT_FOLDER_NAME: "CCRCE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LITRACY_COL29.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MATH_COL_30.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
