var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Amplify",
        PRODUCT_NAME: "MCLASS_LECTURA",
        CONNECTOR_NAME: "vendor.amplify.MCLASS_LECTURA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Amplify MCLASS LECTURA",
                VENDOR_FOLDER_NAME: "Amplify",
                PRODUCT_FOLDER_NAME: "MCLASS_LECTURA",
                PERIODS: ["ALL","BOY","FALL","MOY","WINTER","EOY","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCLASS_LECTURA_1_84_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCLASS_LECTURA_56COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCLASS_LECTURA_121_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCLASS_LECTURA_57COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
