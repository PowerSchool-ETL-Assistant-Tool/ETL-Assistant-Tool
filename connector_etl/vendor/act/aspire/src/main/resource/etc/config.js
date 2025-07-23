var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "ACT",
        PRODUCT_NAME: "ASPIRE",
        CONNECTOR_NAME: "vendor.act.aspire",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ACT ASPIRE",
                VENDOR_FOLDER_NAME: "ACT",
                PRODUCT_FOLDER_NAME: "ASPIRE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_ASPIRE_2017-2018.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_ASPIRE_2018-2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_ASPIRE_2019-2020.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_ASPIRE_2020-2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_ASPIRE_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
