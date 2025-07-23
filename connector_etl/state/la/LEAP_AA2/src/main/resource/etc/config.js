var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "LEAP_AA2",
        VENDOR_NAME: "LADOE",
        PRODUCT_NAME: "LEAP_AA2",
        CONNECTOR_NAME: "state.la.LEAP_AA2",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE LEAP_AA2",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "LEAP_AA2",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2012-2013","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA2_1213.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2009-2010","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA2_SPRING_0910_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "LEAP_AA2_SPRING_1415_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
