var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "SC",
        PRODUCT_NAME: "PASS",
        CONNECTOR_NAME: "state.sc.PASS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "SC PASS",
                VENDOR_FOLDER_NAME: "SC",
                PRODUCT_FOLDER_NAME: "PASS",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "SC_PASS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "1601_DARLINGTON_SCPASS_Spring_ALL_YEARS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());