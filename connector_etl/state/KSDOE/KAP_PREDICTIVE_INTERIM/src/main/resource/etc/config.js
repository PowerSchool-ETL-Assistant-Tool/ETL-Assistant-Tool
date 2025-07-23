var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "KSDOE",
        PRODUCT_NAME: "KAP_PREDICTIVE_INTERIM",
        CONNECTOR_NAME: "state.KSDOE.KAP_PREDICTIVE_INTERIM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "KSDOE KAP",
                VENDOR_FOLDER_NAME: "KSDOE",
                PRODUCT_FOLDER_NAME: "KAP_PREDICTIVE_INTERIM",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "KSDOE_KAP_COL_17.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "KSDOE_KAP_COL_23.sig",
                        CLIENT_CODE: ["ALL"]
                    },
               ]
            }
        ]
    }
}());
