var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IDAHO",
        PRODUCT_NAME: "CIVICS",
        CONNECTOR_NAME: "state.id.CIVICS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ID CIVICS",
                VENDOR_FOLDER_NAME: "CIVICS",
                PRODUCT_FOLDER_NAME: "CIVICS",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CIVICS_9COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
