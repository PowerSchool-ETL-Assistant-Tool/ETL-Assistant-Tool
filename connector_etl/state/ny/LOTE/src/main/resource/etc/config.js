var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NY",
        PRODUCT_NAME : "LOTE",
        CONNECTOR_NAME: "state.ny.LOTE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NY LOTE LOTE",
                VENDOR_FOLDER_NAME: "NY",
                PRODUCT_FOLDER_NAME: "LOTE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LOTE_10_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
