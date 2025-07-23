var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "RENAISSANCE",
        PRODUCT_NAME: "MKAS_3_READING",
        CONNECTOR_NAME: "state.ms.MKAS_3_READING",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "RENAISSANCE MKAS_3_READING",
                VENDOR_FOLDER_NAME: "RENAISSANCE",
                PRODUCT_FOLDER_NAME: "MKAS_3_READING",
                PERIODS: ["ALL","FALL","SPRING","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MKAS_3_READING_11_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());