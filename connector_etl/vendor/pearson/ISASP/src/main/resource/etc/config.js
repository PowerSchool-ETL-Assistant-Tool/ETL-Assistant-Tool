var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Pearson",
        PRODUCT_NAME: "ISASP",
        CONNECTOR_NAME: "vendor.pearson.ISASP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Pearson ISASP",
                VENDOR_FOLDER_NAME: "Pearson",
                PRODUCT_FOLDER_NAME: "ISASP",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "ISASP_19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISASP_21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISASP21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
