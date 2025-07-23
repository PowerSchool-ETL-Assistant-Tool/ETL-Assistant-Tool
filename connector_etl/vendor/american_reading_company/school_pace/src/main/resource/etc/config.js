var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AMERICAN_READING_COMPANY",
        PRODUCT_NAME: "SCHOOL_PACE",
        CONNECTOR_NAME: "vendor.american_reading_company.school_pace",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ARC SCHOOL_PACE",
                VENDOR_FOLDER_NAME: "AMERICAN_READING_COMPANY",
                PRODUCT_FOLDER_NAME: "SCHOOL_PACE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "schoolpace_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "schoolpace_21_22.sig",
                         CLIENT_CODE: ["ALL"]
                     },
                    {
                         YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "SCHOOLPACE_26COLS.sig",
                         CLIENT_CODE: ["ALL"]
                     }
                ]
            }
        ]
    }
}());
