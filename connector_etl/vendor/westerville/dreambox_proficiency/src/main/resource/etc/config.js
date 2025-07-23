var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Dreambox Learning",
        PRODUCT_NAME: "Dreambox Proficiency",
        CONNECTOR_NAME: "vendor.westerville.dreambox_proficiency",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Westerville Dreambox Proficiency",
                VENDOR_FOLDER_NAME: "Dreambox_Learning",
                PRODUCT_FOLDER_NAME: "DREAMBOX_PROFICIENCY",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "dreambox_proficiency.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
