var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "MNDOE",
        PRODUCT_NAME : "EARLY_LEARNING",
        CONNECTOR_NAME: "state.mn.EARLY_LEARNING",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MNDOE EARLY_LEARNING",
                VENDOR_FOLDER_NAME: "MNDOE",
                PRODUCT_FOLDER_NAME: "EARLY_LEARNING",
                PERIODS:  ["ALL","FALL","WINTER","SPRING","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "SLPS_408.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2025-2026","*"],
                        SIGNATURE_FILE: "SLPS_720.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());