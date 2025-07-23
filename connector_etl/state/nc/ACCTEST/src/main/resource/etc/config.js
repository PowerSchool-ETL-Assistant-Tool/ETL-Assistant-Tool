var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NC",
        PRODUCT_NAME: "ACCTEST",
        CONNECTOR_NAME: "state.nc.ACCTEST",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NC ACCTEST",
                VENDOR_FOLDER_NAME: "NC",
                PRODUCT_FOLDER_NAME: "ACCTEST",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACCTEST_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
