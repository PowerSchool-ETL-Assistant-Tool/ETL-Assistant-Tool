var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "CEEB",
        VENDOR_NAME : "The College Board",
        PRODUCT_NAME : "SAT",
        CONNECTOR_NAME: "state.ct.ct_sat",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CT SAT",
                VENDOR_FOLDER_NAME: "ct",
                PRODUCT_FOLDER_NAME: "CT_SAT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CT_SAT_AllYear.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CT_SAT.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
