var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CTDOE",
        PRODUCT_NAME : "SBA_CTAS",
        CONNECTOR_NAME: "state.ct.SBA_CTAS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CTDOE SBA_CTAS",
                VENDOR_FOLDER_NAME: "CTDOE",
                PRODUCT_FOLDER_NAME: "SBA_CTAS",
                PERIODS:  ["ALL", "FALL", "SPRING", "WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SBA_CTAS_ALL_GRADE.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
