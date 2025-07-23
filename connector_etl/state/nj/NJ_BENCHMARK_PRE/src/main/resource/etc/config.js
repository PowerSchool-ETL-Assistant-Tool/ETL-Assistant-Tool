var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NJDOE",
        PRODUCT_NAME : "NJ_BENCHMARK_PRE",
        CONNECTOR_NAME: "state.nj.NJ_BENCHMARK_PRE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NJ BENCHMARK_PRE",
                VENDOR_FOLDER_NAME: "NJDOE",
                PRODUCT_FOLDER_NAME: "NJ_BENCHMARK_PRE",
                PERIODS: ["ALL", "MP1", "MP2", "MP3", "MP4", "Summer", "PRE", "POST"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "NJ_LOCAL_GENERIC_49_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
