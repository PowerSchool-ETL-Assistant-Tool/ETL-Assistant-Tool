var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MODOE",
        PRODUCT_NAME: "MAP_STUDENT_TEST_ITEM",
        CONNECTOR_NAME: "state.mo.MAP_STUDENT_TEST_ITEM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MODOE MAP_STUDENT_TEST_ITEM",
                VENDOR_FOLDER_NAME: "MODOE",
                PRODUCT_FOLDER_NAME: "MAP_STUDENT_TEST_ITEM",
                PERIODS:  ["ALL","Fall","Winter","Spring"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "MAP_STUDENT_TEST_ITEM_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_STUDENT_TEST_ITEM_2018.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_STUDENT_TEST_ITEM_2017.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());