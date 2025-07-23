var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CADOE",
        PRODUCT_NAME : "LAUSD_IREADY_SPANISH",
        CONNECTOR_NAME: "state.ca.LAUSD_IREADY_SPANISH",
        VENDOR_FTP_NAME: "CURRICULUM_ASSOCIATES",
        PRODUCT_FTP_NAME: "IREADY_SPANISH",
        UI_DISPLAY_NAME: "LAUSD_IREADY_SPANISH",
        PRODUCT_LIST: [
        {
            UI_DISPLAY_NAME: "LAUSD iReady Spanish",
            VENDOR_FOLDER_NAME: "CADOE",
            PRODUCT_FOLDER_NAME: "LAUSD_IREADY_SPANISH",
            PERIODS: ["ALL", "BOY", "MOY", "EOY", "FALL", "WINTER", "SPRING"],
            SIGNATURES: [
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LAUSD_iReady_Spanish_ELA_23_24.sig",
                    CLIENT_CODE: ["ALL"]
                },
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LAUSD_IREADY_SPANISH_MATH_69COLS.sig",
                    CLIENT_CODE: ["ALL"]
                }
            ]
        }
    ]
    }
}());
