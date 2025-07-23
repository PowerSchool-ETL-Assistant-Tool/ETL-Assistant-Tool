var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME: "Renaissance Learning",
        PRODUCT_NAME: ["STAR_V2_STATE Grade 3","STAR_V2_STATE Classic","STAR_V2_STATE Non-Enterprise","STAR_V2_STATE Progress Monitoring","STAR_V2_STATE Unknown","STAR_V2_STATE Geometry","STAR_V2_STATE Algebra","STAR_V2_STATE Enterprise"],
        CONNECTOR_NAME: "vendor.ren_learning.STAR_V2_STATE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Renaissance Learning STAR_V2_STATE",
                VENDOR_FOLDER_NAME: "Renaissance_Learning",
                PRODUCT_FOLDER_NAME: "STAR_V2_STATE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "REN_LEARNING_SM_118_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "REN_LEARNING_COMBINED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "REN_LEARNING_SEL_118_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
