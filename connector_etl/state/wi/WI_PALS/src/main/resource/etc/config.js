var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "WIDOE",
        PRODUCT_NAME: "WI_PALS",
        CONNECTOR_NAME: "state.wi.WI_PALS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WI WI_PALS",
                VENDOR_FOLDER_NAME: "WIDOE",
                PRODUCT_FOLDER_NAME: "WI_PALS",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "WI_PALS_48COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());

