var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "IRI",
        VENDOR_NAME : "IDDOE",
        PRODUCT_NAME : "IRI",
        CONNECTOR_NAME: "state.id.IRI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ID IRI",
                VENDOR_FOLDER_NAME: "IDDOE",
                PRODUCT_FOLDER_NAME: "IRI",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IRI_EXECUTIVE_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IRI_EXECUTIVE_19_20.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IRI_18_19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IRI_22_23.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                   {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IRI_28_COLS_23_24.sig",
                        CLIENT_CODE: ["ALL", "FALL", "WINTER", "SPRING"]
                    }

                ]
            }
        ]
    }
}());