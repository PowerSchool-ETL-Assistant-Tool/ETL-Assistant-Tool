var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "ELPAC",
        VENDOR_NAME: "CADOE",
        PRODUCT_NAME: "LA_ELPAC",
        CONNECTOR_NAME: "state.ca.LAUSD_ELPAC_SUMM_INI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LA_CADOE ELPAC",
                VENDOR_FOLDER_NAME: "CADOE",
                PRODUCT_FOLDER_NAME: "LA_ELPAC",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ELPAC_TO_MISIS_COL_56_LAUSD.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
