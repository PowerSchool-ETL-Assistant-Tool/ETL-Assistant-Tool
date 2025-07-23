var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "RENAISSANCE",
        PRODUCT_NAME: "FUNDAMENTALS",
        CONNECTOR_NAME: "state.tx.REN_FUNDAMENTALS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "REN_FUNDAMENTALS",
                VENDOR_FOLDER_NAME: "RENAISSANCE",
                PRODUCT_FOLDER_NAME: "FUNDAMENTALS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "REN_FUND_26_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
