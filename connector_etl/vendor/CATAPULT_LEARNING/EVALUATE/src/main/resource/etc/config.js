var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "CATAPULT_LEARNING",
        PRODUCT_NAME: "EVALUATE",
        CONNECTOR_NAME: "vendor.CATAPULT_LEARNING.EVALUATE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CATAPULT_LEARNING EVALUATE",
                VENDOR_FOLDER_NAME: "CATAPULT_LEARNING",
                PRODUCT_FOLDER_NAME: "EVALUATE",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EVALUATE_13COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());