var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "KSDOE",
        PRODUCT_NAME: "SRSS_IE",
        CONNECTOR_NAME: "state.ks.SRSS_IE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "KS SRSS_IE",
                VENDOR_FOLDER_NAME: "KS",
                PRODUCT_FOLDER_NAME: "SRSS_IE",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SRSS_IE_12_1.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
