var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "VTDOE",
        PRODUCT_NAME: "VTSA_NGSS",
        CONNECTOR_NAME: "state.vt.VTSA_NGSS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "VTDOE VTSA_NGSS",
                VENDOR_FOLDER_NAME: "VTDOE",
                PRODUCT_FOLDER_NAME: "VTSA_NGSS",
                PERIODS:  ["ALL", "SPRING", "FALL", "WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "VTSA_NGSS_2122.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
