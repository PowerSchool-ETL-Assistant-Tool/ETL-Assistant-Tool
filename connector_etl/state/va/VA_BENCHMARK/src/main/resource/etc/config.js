var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "VADOE",
        PRODUCT_NAME: "VA_BENCHMARK",
        CONNECTOR_NAME: "state.va.VA_BENCHMARK",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "VADOE VA_BENCHMARK",
                VENDOR_FOLDER_NAME: "VADOE",
                PRODUCT_FOLDER_NAME: "VA_BENCHMARK",
                PERIODS:  ["ALL", "FALL", "SPRING", "WINTER", "SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "VA_BENCHMARK_11COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "VA_BENCHMARK_24COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
