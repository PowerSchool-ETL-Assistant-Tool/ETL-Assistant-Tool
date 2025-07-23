var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "AZDOE",
        PRODUCT_NAME: "A-F_STATIC_FILE",
        CONNECTOR_NAME: "state.az.A-F_STATIC_FILE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "A-F static file",
                VENDOR_FOLDER_NAME: "A-F_STATIC_FILE",
                PRODUCT_FOLDER_NAME: "A-F_STATIC_FILE",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SUSD_STATICDATAFILE_16-17.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SUSD_STATICDATAFILE_18_19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SUSD_STATICDATAFILE_20_21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SUSD_STATICDATAFILE_22_23.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
