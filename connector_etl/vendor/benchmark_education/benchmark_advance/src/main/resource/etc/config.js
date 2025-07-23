var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Benchmark Education",
        PRODUCT_NAME: "Benchmark Advance",
        CONNECTOR_NAME: "vendor.benchmark_education.benchmark_advance",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Benchmark Education Benchmark Advance",
                VENDOR_FOLDER_NAME: "Benchmark_Education",
                PRODUCT_FOLDER_NAME: "BENCHMARK_ADVANCE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "BENCH_NO_RAW_SCORE.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "BENCH_NO_RAW_SCORE_W_NAME.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "BENCH_RAW_SCORE.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "BENCHMARK_24_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
