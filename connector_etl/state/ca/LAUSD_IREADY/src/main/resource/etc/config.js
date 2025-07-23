var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CADOE",
        PRODUCT_NAME : "LAUSD_IREADY",
        CONNECTOR_NAME: "state.ca.LAUSD_IREADY",
        VENDOR_FTP_NAME: "CURRICULUM_ASSOCIATES",
        PRODUCT_FTP_NAME: "IREADY",
        UI_DISPLAY_NAME: "LAUSD_IREADY",
        PRODUCT_LIST: [
        {
            UI_DISPLAY_NAME: "LAUSD iReady",
            VENDOR_FOLDER_NAME: "CADOE",
            PRODUCT_FOLDER_NAME: "LAUSD_IREADY",
            PERIODS: ["ALL", "BOY", "MOY", "EOY", "FALL", "WINTER", "SPRING"],
            SIGNATURES: [
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LA_iReady_23_24_Spanish_ELA.sig",
                    CLIENT_CODE: ["ALL"]
                },
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LA_IREADY_ELA_82COLS.sig",
                    CLIENT_CODE: ["ALL"]
                },
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LA_IREADY_MATH_69COLS.sig",
                    CLIENT_CODE: ["ALL"]
                },
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LAUSD_iReadyELA0SS.sig",
                    CLIENT_CODE: ["ALL"]
                },
                {
                    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                    SIGNATURE_FILE: "LAUSD_iReadyMATH0SS.sig",
                    CLIENT_CODE: ["ALL"]
                }
            ]
        }
    ]
    }
}());
