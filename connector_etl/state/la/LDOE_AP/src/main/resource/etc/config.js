var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "The College Board",
        PRODUCT_NAME: "AP",
        CONNECTOR_NAME: "state.la.LDOE_AP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LDOE The College Board AP",
                VENDOR_FOLDER_NAME: "LDOE_The_College_Board",
                PRODUCT_FOLDER_NAME: "LDOE_AP",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "LDOE_AP_ROWID_1617.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "LDOE_AP_ROWID.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "LDOE_AP_RECORDID.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
