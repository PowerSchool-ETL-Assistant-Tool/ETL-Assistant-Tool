var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "COGNIA",
        PRODUCT_NAME: "IMSSA",
        CONNECTOR_NAME: "state.nm.IMSSA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "COGNIA IMSSA",
                VENDOR_FOLDER_NAME: "Cognia",
                PRODUCT_FOLDER_NAME: "IMSSA",
                PERIODS: ["ALL","BOY","MOY","EOY"],
                SIGNATURES: [
                     {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "IMSSA_20_21_22_23.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
