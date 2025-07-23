var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "ILDOE",
        PRODUCT_NAME: "CTP5",
        CONNECTOR_NAME: "state.il.CTP5",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "IL/CTP5",
                VENDOR_FOLDER_NAME: "ILDOE",
                PRODUCT_FOLDER_NAME: "CTP5",
                PERIODS:  ["ALL", "FALL", "SPRING", "WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AUTOMATION_30_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                   {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AUTOMATION_588_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());