var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: ["CADOE", "SBA"],
        PRODUCT_NAME: ["CAASPP", "SBA"],
        CONNECTOR_NAME: "state.ca.caaspp_1415",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CADOE CAASPP 2014-2015 (and prior)",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "CAASPP_1415",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "CAASPP_FW_1415.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
