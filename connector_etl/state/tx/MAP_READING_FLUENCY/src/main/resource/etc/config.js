var AppAssessmentConfig = (function() {
    return {
        VENDOR_NAME : "Texas",
        PRODUCT_NAME : "MAP_READING_FLUENCY",
        CONNECTOR_NAME: "state.tx.MAP_READING_FLUENCY",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Texas MAP Reading Fluency",
                VENDOR_FOLDER_NAME: "Texas",
                PRODUCT_FOLDER_NAME: "MAP_READING_FLUENCY",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_READING_FLUENCY.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_READING_FLUENCY_1.sig",
                        CLIENT_CODE: ["ALL, FALL, WINTER"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_READING_FLUENCY_2.sig",
                        CLIENT_CODE: ["ALL, FALL, WINTER"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_READING_FLUENCY_54_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
