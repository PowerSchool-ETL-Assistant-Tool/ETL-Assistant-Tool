var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "UOregon",
        PRODUCT_NAME: "DIBELS 6th Edition",
        CONNECTOR_NAME: "vendor.university_of_oregon.dibels_6th",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "UOregon DIBELS 6th",
                VENDOR_FOLDER_NAME: "UOregon",
                PRODUCT_FOLDER_NAME: "DIBELS_6th",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "DIBELS_6TH_HISTORICAL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "DIBLES_6TH_MCADOO_EOY.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "DIBLES_6TH_MCADOO_MOY.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
