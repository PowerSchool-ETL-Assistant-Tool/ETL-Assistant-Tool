var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "FastBridge",
        PRODUCT_NAME: "AUTOReading",
        CONNECTOR_NAME: "vendor.fastbridge.AUTOReading",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FastBridge Auto Reading",
                VENDOR_FOLDER_NAME: "FASTBRIDGE",
                PRODUCT_FOLDER_NAME: "AUTOREADING",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AUTO_2022.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
