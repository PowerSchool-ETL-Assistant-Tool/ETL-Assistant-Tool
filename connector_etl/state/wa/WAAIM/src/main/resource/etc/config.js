var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "WADOE",
        PRODUCT_NAME: "WAAIM",
        CONNECTOR_NAME: "state.wa.WAAIM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WADOE WAAIM",
                VENDOR_FOLDER_NAME: "WADOE",
                PRODUCT_FOLDER_NAME: "WAAIM",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "WAAIM_2015.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "WAAIM_2016.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "WAAIM_2017.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "WAAIM_2019.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
