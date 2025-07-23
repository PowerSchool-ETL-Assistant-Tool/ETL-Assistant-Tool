var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "FL",
        PRODUCT_NAME: "FSA_3_8",
        CONNECTOR_NAME: "state.fl.FSA_3_8",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FL/FSA_3_8",
                VENDOR_FOLDER_NAME: "FL",
                PRODUCT_FOLDER_NAME: "FSA_3_8",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FSA_3_8.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FSA_3_8_COLS_12.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
