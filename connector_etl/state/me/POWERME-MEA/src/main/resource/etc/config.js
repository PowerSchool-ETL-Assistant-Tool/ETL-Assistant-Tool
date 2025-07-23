var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MAINE",
        PRODUCT_NAME: ["MEA","eMPowerME"],
        CONNECTOR_NAME: "state.me.POWERME-MEA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MEA/POWERME",
                VENDOR_FOLDER_NAME: "ME",
                PRODUCT_FOLDER_NAME: "ME",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ME.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());