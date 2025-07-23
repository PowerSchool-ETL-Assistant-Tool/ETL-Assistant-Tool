var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "EDMENTUM",
        PRODUCT_NAME: "EXACT_PATH",
        CONNECTOR_NAME: "vendor.edmentum.EXACT_PATH",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "EDMENTUM EXACT_PATH",
                VENDOR_FOLDER_NAME: "EDMENTUM",
                PRODUCT_FOLDER_NAME: "EXACT_PATH",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EXACT_PATH_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EXACTPATH_42COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
