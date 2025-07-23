var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "NM",
        PRODUCT_NAME: "SAT",
        CONNECTOR_NAME: "state.nm.NM_SAT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NM SAT",
                VENDOR_FOLDER_NAME: "NM",
                PRODUCT_FOLDER_NAME: "NM_SAT",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "NM_SAT_860_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
