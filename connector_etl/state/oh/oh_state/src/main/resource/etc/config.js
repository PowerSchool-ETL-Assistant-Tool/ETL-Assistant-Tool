var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "OH-STATE",
        PRODUCT_NAME: ["OH-ACT","OH-AP","OH-CTE","OH-IBDP","OH-OELPA","OH-OST","OH-SAT"],
        CONNECTOR_NAME: "state.oh.OH_STATE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "OH_STATE",
                VENDOR_FOLDER_NAME: "OH-STATE",
                PRODUCT_FOLDER_NAME: "OH_STATE",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "OH_STATE_COL18.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
