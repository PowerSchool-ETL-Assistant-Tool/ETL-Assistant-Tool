var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "ELDA",
        VENDOR_NAME: "LADOE",
        PRODUCT_NAME: "ELDA",
        CONNECTOR_NAME: "state.la.ELDA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE ELDA",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "ELDA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "ELDA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2006-2007","2025-2026","*"],
                        SIGNATURE_FILE: "ELDA_2007_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "ELDA_2016_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "ELDA_2016_Fixed_Short.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "ELDA_2017_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
