var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "ELA",
        VENDOR_NAME: "OHDOE",
        PRODUCT_NAME: "ELA",
        CONNECTOR_NAME: "state.oh.ELA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "OHDOE ELA",
                VENDOR_FOLDER_NAME: "OHDOE",
                PRODUCT_FOLDER_NAME: "ELA",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ELA_2122.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());