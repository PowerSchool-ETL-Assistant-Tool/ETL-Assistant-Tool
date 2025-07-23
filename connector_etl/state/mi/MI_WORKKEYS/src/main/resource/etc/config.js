var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MI",
        PRODUCT_NAME: "MI_WORKKEYS",
        CONNECTOR_NAME: "state.mi.MI_WORKKEYS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MI MI_WORKKEYS",
                VENDOR_FOLDER_NAME: "MI",
                PRODUCT_FOLDER_NAME: "MI_WORKKEYS",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MI_WORKKEYS_48COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());