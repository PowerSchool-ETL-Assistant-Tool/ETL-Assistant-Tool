var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "FL",
        PRODUCT_NAME: "NGSSS",
        CONNECTOR_NAME: "state.fl.NGSSS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FL/NGSSS",
                VENDOR_FOLDER_NAME: "FL",
                PRODUCT_FOLDER_NAME: "NGSSS",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "NGSSS_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "NGSSS_SCI_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
