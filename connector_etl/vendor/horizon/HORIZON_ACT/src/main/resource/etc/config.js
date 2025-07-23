var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "HORIZON",
        PRODUCT_NAME: "HORIZON-ACT",
        CONNECTOR_NAME: "vendor.horizon.HORIZON_ACT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "HORIZON HORIZON-ACT",
                VENDOR_FOLDER_NAME: "HORIZON",
                PRODUCT_FOLDER_NAME: "HORIZON_ACT",
                PERIODS: ["ALL","SPRING","FALL","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "HORIZON_ENGLISH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "HORIZON_MATH.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "HORIZON_READING.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "HORIZON_SCIENCE.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
