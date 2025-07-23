var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "CEEB",
        VENDOR_NAME: "The College Board",
        PRODUCT_NAME: ["PSAT","SAT", "AP Potential", "PSAT 8/9", "PSAT 10"],
        CONNECTOR_NAME: "vendor.college_board.psat",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "The College Board PSAT (<2015)",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "PSAT_OLD",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "psat_dummy.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());