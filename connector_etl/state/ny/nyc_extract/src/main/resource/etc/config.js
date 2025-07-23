var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NY",
        PRODUCT_NAME : "NYC_EXTRACT",
        CONNECTOR_NAME: "state.ny.nyc_extract",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NYDOE NYC EXTRACT",
                VENDOR_FOLDER_NAME: "NYDOE",
                PRODUCT_FOLDER_NAME: "NYC_EXTRACT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "NYC_EXTRACT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "NYC_EXTRACT_35_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());

