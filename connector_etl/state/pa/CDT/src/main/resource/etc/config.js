var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "PADOE",
        PRODUCT_NAME: "CDT",
        CONNECTOR_NAME: "state.pa.CDT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "PADOE CDT",
                VENDOR_FOLDER_NAME: "PADOE",
                PRODUCT_FOLDER_NAME: "CDT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CDT.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
