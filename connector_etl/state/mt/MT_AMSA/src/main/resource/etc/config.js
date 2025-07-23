var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Cambium",
        PRODUCT_NAME: "MT_AMSA",
        CONNECTOR_NAME: "state.mt.MT_AMSA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Cambium AMSA",
                VENDOR_FOLDER_NAME: "Cambium",
                PRODUCT_FOLDER_NAME: "MT_AMSA",
                PERIODS: ["ALL","SPRING","WINTER","FALL","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AMSA_124_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());