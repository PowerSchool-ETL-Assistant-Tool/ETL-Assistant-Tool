var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MEDOE",
        PRODUCT_NAME: "ME_SCIENCE",
        CONNECTOR_NAME: "state.me.ME_SCIENCE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MEDOE ME_SCIENCE",
                VENDOR_FOLDER_NAME: "MEDOE",
                PRODUCT_FOLDER_NAME: "ME_SCIENCE",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Maine_science_26_cols.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());