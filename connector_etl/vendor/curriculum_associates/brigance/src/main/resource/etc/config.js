var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "Curriculum Associates",
        PRODUCT_NAME: "Brigance",
        CONNECTOR_NAME: "vendor.curriculum_associates.brigance",
        VENDOR_FTP_NAME: "CURRICULUM_ASSOCIATES",
        PRODUCT_FTP_NAME: "BRIGANCE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Curriculum Associates Brigance",
                VENDOR_FOLDER_NAME: "CURRICULUM_ASSOCIATES",
                PRODUCT_FOLDER_NAME: "BRIGANCE",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "BRIGANCE_18_19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "BRIGANCE_19_20.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "BRIGANCE_19_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "BRIGANCE_23_24.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
