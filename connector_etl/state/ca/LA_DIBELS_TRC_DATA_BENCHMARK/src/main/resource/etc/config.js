var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "LAUSD",
        PRODUCT_NAME: "LA_DIBELS_TRC_DATA_BENCHMARK",
        CONNECTOR_NAME: "state.ca.LA_DIBELS_TRC_DATA_BENCHMARK",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LAUSD DIBELS_TRC_DATA_BENCHMARK",
                VENDOR_FOLDER_NAME: "LAUSD",
                PRODUCT_FOLDER_NAME: "LA_DIBELS_TRC_DATA_BENCHMARK",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LA_DIBELS_TRC_DATA_BENCH_54C.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
