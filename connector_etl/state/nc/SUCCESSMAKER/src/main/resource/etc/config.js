var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NCDPI",
        PRODUCT_NAME: "SUCCESSMAKER",
        CONNECTOR_NAME: "state.nc.SUCCESSMAKER",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NC SUCCESSMAKER",
                VENDOR_FOLDER_NAME: "NC",
                PRODUCT_FOLDER_NAME: "SUCCESSMAKER",
                PERIODS:  ["ALL","Beginning","Middle","End"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SuccessMaker_Math.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SuccessMaker_Reading.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
