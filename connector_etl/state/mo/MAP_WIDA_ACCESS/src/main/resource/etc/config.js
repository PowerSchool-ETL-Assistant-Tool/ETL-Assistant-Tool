var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "MODOE",
        PRODUCT_NAME : "MAP_WIDA_ACCESS",
        CONNECTOR_NAME: "state.mo.MAP_WIDA_ACCESS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MODOE WIDA ACCESS",
                VENDOR_FOLDER_NAME: "MODOE",
                PRODUCT_FOLDER_NAME: "MAP_WIDA_ACCESS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_WIDA.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
