var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IL",
        PRODUCT_NAME: "PARCC",
        CONNECTOR_NAME: "state.il.PARCC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "IL/PARCC",
                VENDOR_FOLDER_NAME: "IL",
                PRODUCT_FOLDER_NAME: "IL_PARCC",
                PERIODS:  ["ALL", "FALL", "SPRING", "WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IL_PARCC.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());