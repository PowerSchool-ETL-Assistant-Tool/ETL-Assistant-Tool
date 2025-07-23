var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CA",
        PRODUCT_NAME : "DRDP",
        CONNECTOR_NAME: "state.ca.DRDP",
        PRODUCT_LIST: [
                    {
                        UI_DISPLAY_NAME: "CA/DRDP",
                        VENDOR_FOLDER_NAME: "CA",
                        PRODUCT_FOLDER_NAME: "DRDP",
                        PERIODS:  ["ALL", "WINTER", "SPRING"],
                        SIGNATURES: [
                            {
                                YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_2019-2020.sig",
                                CLIENT_CODE: ["ALL"]
                            },
                            {
                                YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_2020-2021.sig",
                                CLIENT_CODE: ["ALL"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_18192021_1.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_18192021_2.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_18192021_3.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_18192021_4.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_2021.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_PRESCHOOL_2021.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            },
                            {
                                YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                                SIGNATURE_FILE: "DRDP_2122_NEW.sig",
                                CLIENT_CODE: ["ALL", "WINTER", "SPRING"]
                            }
                        ]
                    }
                ]
    }
}());
