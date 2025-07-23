var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "FastBridge",
        PRODUCT_NAME: "CBMR-Spanish",
        CONNECTOR_NAME: "vendor.fastbridge.CBMR-Spanish",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FastBridge CBMR-Spanish",
                VENDOR_FOLDER_NAME: "FASTBRIDGE",
                PRODUCT_FOLDER_NAME: "CBMR_SPANISH",
                PERIODS:  ["ALL", "FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CBMR_Spanish.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
