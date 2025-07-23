var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "NY",
        PRODUCT_NAME: "NY_EASY_CBM",
        CONNECTOR_NAME: "state.ny.NY_EASY_CBM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NYDOE NY_EASY_CBM",
                VENDOR_FOLDER_NAME: "NYDOE",
                PRODUCT_FOLDER_NAME: "NY_EASY_CBM",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EASY_CBM_512C.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
