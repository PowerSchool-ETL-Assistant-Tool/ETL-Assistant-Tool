var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Curriculum Associates",
        PRODUCT_NAME: "I-Ready Literacy Tasks",
        CONNECTOR_NAME: "vendor.curriculum_associates.IREADY_LIT_TASKS",
        VENDOR_FTP_NAME: "CURRICULUM_ASSOCIATES",
        PRODUCT_FTP_NAME: "IREADY_LIT_TASKS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Curriculum Associates IREADY_LIT_TASKS",
                VENDOR_FOLDER_NAME: "CURRICULUM_ASSOCIATES",
                PRODUCT_FOLDER_NAME: "IREADY_LIT_TASKS",
                PERIODS: ["ALL", "Fall", "Spring", "Winter"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IREADY_LIT_TASKS_30C_2.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IREADY_LIT_TASKS_30COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IREADY_LIT_TASKS_39COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
