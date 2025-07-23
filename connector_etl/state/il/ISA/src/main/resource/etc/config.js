var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IL",
        PRODUCT_NAME: "ISA",
        CONNECTOR_NAME: "state.il.ISA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "IL/ISA",
                VENDOR_FOLDER_NAME: "IL",
                PRODUCT_FOLDER_NAME: "ISA",
                PERIODS:  ["ALL", "FALL", "SPRING", "WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISA_OVERALL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISA_STRANDS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISA_201_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());