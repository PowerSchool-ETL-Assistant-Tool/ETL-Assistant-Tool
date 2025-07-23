var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Rome",
        PRODUCT_NAME: "Rome WTW",
        CONNECTOR_NAME: "country.rome.ROME_WTW",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country Rome WTW",
                VENDOR_FOLDER_NAME: "country_rome_WTW",
                PRODUCT_FOLDER_NAME: "ROME_WTW",
                PERIODS:  ["ALL","FALL","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ROME_WTW_KINDERGARTEN.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ROME_WTW_PRIMARY_ELEMENTARY.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
