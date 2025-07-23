var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "FL",
        PRODUCT_NAME: "FSA_EOC",
        CONNECTOR_NAME: "state.fl.FSA_EOC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FL/FSA_EOC",
                VENDOR_FOLDER_NAME: "FL",
                PRODUCT_FOLDER_NAME: "FSA_EOC",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FSA_EOC.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FSA_ALG_Marion.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FSA_ELA_Marion.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "FSA_MATH_Marion.sig",
                       CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
