var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "Curriculum Associates",
        PRODUCT_NAME: "I-Ready Instructional Usage",
        CONNECTOR_NAME: "vendor.curriculum_associates.iready_instructional_usage",
        VENDOR_FTP_NAME: "CURRICULUM_ASSOCIATES",
        PRODUCT_FTP_NAME: "IREADY",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "iReady Instructional Usage",
                VENDOR_FOLDER_NAME: "CURRICULUM_ASSOCIATES",
                PRODUCT_FOLDER_NAME: "IREADY_INSTRUCTIONAL_USAGE",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "iReady_instructional_usage_21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "iREADY_ELA_INST_131C.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "iREADY_MATH_INST_123C.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IREADY_INST_ELA_115COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IREADY_INST_MATH_107COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
