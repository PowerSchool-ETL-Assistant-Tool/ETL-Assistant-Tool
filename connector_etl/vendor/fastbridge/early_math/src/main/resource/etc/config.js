var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "FastBridge",
        PRODUCT_NAME: "early_math",
        CONNECTOR_NAME: "vendor.fastbridge.early_math",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FastBridge early_math",
                VENDOR_FOLDER_NAME: "FASTBRIDGE",
                PRODUCT_FOLDER_NAME: "EARLY_MATH",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                   {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "early_math.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "early_math_1.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
