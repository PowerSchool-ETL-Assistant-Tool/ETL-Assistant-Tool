var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "ATI",
        PRODUCT_NAME : "Galileo K12",
        CONNECTOR_NAME: "vendor.ati.galileo",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ATI Galileo",
                VENDOR_FOLDER_NAME: "ATI",
                PRODUCT_FOLDER_NAME: "GALILEO",
                PERIODS:  ["ADB1", "ADB2", "ADB3", "TEEL0", "TEEL1", "TEEM0", "TEEM1", "ALL", "Spring", "Fall","T3"],
                SIGNATURES: [
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GALILEO_K12.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GALILEO_2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GALILEO_2023.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GALILEO_24COLS_FW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GALILEO_33_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GALILEO_18_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
