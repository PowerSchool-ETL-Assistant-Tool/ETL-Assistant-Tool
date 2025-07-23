var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "LA_DIBELS",
        PRODUCT_NAME: "LA_DIBELS",
        CONNECTOR_NAME: "state.ca.LA_DIBELS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LA DIBELS",
                VENDOR_FOLDER_NAME: "LA_DIBELS",
                PRODUCT_FOLDER_NAME: "LA_DIBELS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                   {
                       YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "LA_DIBELS_COL_106.sig",
                       CLIENT_CODE: ["ALL"]
                   }
                ]
            }
        ]
    }
}());
