var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IN",
        PRODUCT_NAME: "ISTEP",
        CONNECTOR_NAME: "state.in.ISTEP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ISTEP",
                VENDOR_FOLDER_NAME: "IN",
                PRODUCT_FOLDER_NAME: "ISTEP",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISTEP_20_21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISTEP_18_19.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());