var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "ACT",
        PRODUCT_NAME: "ACT_PLUS",
        CONNECTOR_NAME: "vendor.act.act_plus",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ACT ACT_PLUS",
                VENDOR_FOLDER_NAME: "ACT",
                PRODUCT_FOLDER_NAME: "ACT_PLUS",
                PERIODS:  ["ALL","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_PLUS_18-21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ACT_17_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                ]
            }
        ]
    }
}());
