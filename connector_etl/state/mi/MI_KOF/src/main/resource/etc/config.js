var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MI",
        PRODUCT_NAME: "MI_KOF",
        CONNECTOR_NAME: "state.mi.MI_KOF",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MI MI_KOF",
                VENDOR_FOLDER_NAME: "MI",
                PRODUCT_FOLDER_NAME: "MI_KOF",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MI_KOF_82COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MI_KOF_38COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());