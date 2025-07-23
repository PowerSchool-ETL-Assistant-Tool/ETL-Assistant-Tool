var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "ALDOE",
        PRODUCT_NAME: ["ISTATION","IREADY","MCLASS","AIMSWEB","STAR","NWEA","EDMENTUM"],
        CONNECTOR_NAME: "state.al.LITERACY_ACT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AL LITERACY ACT",
                VENDOR_FOLDER_NAME: "AL",
                PRODUCT_FOLDER_NAME: "LITERACY_ACT",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LITERACY_ACT.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
