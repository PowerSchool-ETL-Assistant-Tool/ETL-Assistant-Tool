var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "FastBridge",
        PRODUCT_NAME: "SAEBRS",
        CONNECTOR_NAME: "vendor.fastbridge.SAEBRS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FastBridge SAEBRS",
                VENDOR_FOLDER_NAME: "FASTBRIDGE",
                PRODUCT_FOLDER_NAME: "SAEBRS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SAEBRS_Student.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SAEBRS_126_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
