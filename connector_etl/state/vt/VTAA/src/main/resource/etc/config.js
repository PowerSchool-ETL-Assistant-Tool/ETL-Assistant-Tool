var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "VTDOE",
        PRODUCT_NAME: "VTAA",
        CONNECTOR_NAME: "state.vt.VTAA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "VTDOE VTAA",
                VENDOR_FOLDER_NAME: "VTDOE",
                PRODUCT_FOLDER_NAME: "VTAA",
                PERIODS:  ["ALL", "SPRING", "FALL", "WINTER", "SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "VTAA.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
