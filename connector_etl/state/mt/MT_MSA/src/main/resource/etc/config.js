var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Cambium",
        PRODUCT_NAME: "MT_MSA",
        CONNECTOR_NAME: "state.mt.MT_MSA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Cambium MSA",
                VENDOR_FOLDER_NAME: "Cambium",
                PRODUCT_FOLDER_NAME: "MT_MSA",
                PERIODS: ["ALL","SPRING","WINTER","FALL","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MSA_131_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());