var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MODOE",
        PRODUCT_NAME: "MAP_VAM_COMM_ARTS",
        CONNECTOR_NAME: "state.mo.MAP_VAM_COMM_ARTS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MODOE MAP_VAM_COMM_ARTS",
                VENDOR_FOLDER_NAME: "MODOE",
                PRODUCT_FOLDER_NAME: "MAP_VAM_COMM_ARTS",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "MAP_VAM_ARTS_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_VAM_ARTS_OLD.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());