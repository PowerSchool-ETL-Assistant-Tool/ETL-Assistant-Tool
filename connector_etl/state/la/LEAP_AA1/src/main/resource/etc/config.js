var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "LEAP_AA1",
        VENDOR_NAME: "LADOE",
        PRODUCT_NAME: "LEAP_AA1",
        CONNECTOR_NAME: "state.la.LEAP_AA1",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE LEAP AA1",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "LEAP_AA1",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2009-2010","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA1_0910_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA1_1415_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA1_1516_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA1_1617_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA1_1819_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_AA1_1920_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
