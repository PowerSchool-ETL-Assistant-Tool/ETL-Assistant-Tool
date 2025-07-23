var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Canada",
        PRODUCT_NAME: "G9_MATH",
        CONNECTOR_NAME: "country.canada.G9_MATH",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country canada G9_MATH",
                VENDOR_FOLDER_NAME: "country_canada_G9_MATH",
                PRODUCT_FOLDER_NAME: "G9_MATH",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "G9_78_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "G9_75_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
