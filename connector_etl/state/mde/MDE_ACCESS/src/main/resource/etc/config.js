var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "MDE",
        PRODUCT_NAME : ["MDE_ACCESS","MDE_ALTERNATE_ACCESS"],
        CONNECTOR_NAME: "state.mde.MDE_ACCESS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MDE ACCESS",
                VENDOR_FOLDER_NAME: "MDE",
                PRODUCT_FOLDER_NAME: "MDE_ACCESS",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MDE_COLS_160.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
