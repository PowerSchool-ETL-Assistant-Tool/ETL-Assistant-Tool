var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "SC",
        PRODUCT_NAME: "SCCRT",
        CONNECTOR_NAME: "state.sc.SCCRT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "SC SCCRT",
                VENDOR_FOLDER_NAME: "SC",
                PRODUCT_FOLDER_NAME: "SCCRT",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SCCRT_44_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
