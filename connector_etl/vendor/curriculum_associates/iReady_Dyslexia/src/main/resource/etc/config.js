var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "Curriculum Associates",
        PRODUCT_NAME: "iReady_Dyslexia",
        CONNECTOR_NAME: "vendor.curriculum_associates.IREADY_DYSLEXIA",
        VENDOR_FTP_NAME: "CURRICULUM_ASSOCIATES",
        PRODUCT_FTP_NAME: "IREADY_DYSLEXIA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Curriculum Associates iReady_Dyslexia",
                VENDOR_FOLDER_NAME: "CURRICULUM_ASSOCIATES",
                PRODUCT_FOLDER_NAME: "IREADY_DYSLEXIA",
                PERIODS: ["ALL", "Fall", "Spring", "Winter"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IREADY_DX_30_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
