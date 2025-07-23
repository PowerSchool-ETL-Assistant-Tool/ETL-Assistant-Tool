var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "VTDOE",
        PRODUCT_NAME: "SBA",
        CONNECTOR_NAME: "state.vt.SBA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "VTDOE SBA",
                VENDOR_FOLDER_NAME: "VTDOE",
                PRODUCT_FOLDER_NAME: "SBA",
                PERIODS:  ["ALL", "SPRING", "FALL", "WINTER", "SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SBA_2122.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
