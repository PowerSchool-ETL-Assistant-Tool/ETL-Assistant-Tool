var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "WY",
        PRODUCT_NAME: "WYACT",
        CONNECTOR_NAME: "state.wy.ACT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WY ACT",
                VENDOR_FOLDER_NAME: "WY",
                PRODUCT_FOLDER_NAME: "WYACT",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "2019_ACTWY_67COL.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
