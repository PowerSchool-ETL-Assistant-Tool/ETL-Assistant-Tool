var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "PARCC_SUMMATIVE",
        VENDOR_NAME : "CODOE",
        PRODUCT_NAME : "PARCC",
        CONNECTOR_NAME: "state.co.parcc_summative",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CADOE PARCC SUMMATIVE",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "PARCC_SUMMATIVE",
                PERIODS:  ["Spring"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "PARCC_SUM_1617_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
