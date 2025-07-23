var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Lexia Learning",
        PRODUCT_NAME: "Lexia Core5 Reading",
        CONNECTOR_NAME: "vendor.westerville.lexia",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Westerville Lexia",
                VENDOR_FOLDER_NAME: "Westerville",
                PRODUCT_FOLDER_NAME: "LEXIA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "LexiaSig2019.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
