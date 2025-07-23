var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "CA",
        PRODUCT_NAME: "LITERABLY_ORF",
        CONNECTOR_NAME: "state.ca.LITERABLY_ORF",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CA LITERABLY ORF",
                VENDOR_FOLDER_NAME: "CA",
                PRODUCT_FOLDER_NAME: "LITERABLY_ORF",
                PERIODS:  ["ALL", "FALL", "SPRING", "WINTER", "BOY"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LITERABLY_ORF_28_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());