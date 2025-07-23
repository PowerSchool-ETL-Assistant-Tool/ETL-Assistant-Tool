var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "TNDOE",
        PRODUCT_NAME: ["EOC","MSAA","TN Ready","Achievement","ALT_SCI", "WIDA ACCESS"],
        CONNECTOR_NAME: "state.tn.STUDENT_LEVEL",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "TNDOE Student Level",
                VENDOR_FOLDER_NAME: "TNDOE",
                PRODUCT_FOLDER_NAME: "STUDENT_LEVEL",
                PERIODS:  ["ALL","Fall","Spring"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "TN_SLA_1516.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "TN_SLA_1617.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "TN_SLA_1718.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "TN_SLA_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
