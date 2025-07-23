var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CADOE",
        PRODUCT_NAME : "SBAC_DETAIL",
        CONNECTOR_NAME: "state.ca.CA_SBAC_DETAIL",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CA SBAC_DETAIL",
                VENDOR_FOLDER_NAME: "CA",
                PRODUCT_FOLDER_NAME: "CA_SBAC_DETAIL",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SBAC_DETAIL_23_24_LAUSD_103_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "SBAC_DETAIL_LAUSD_IAB_47_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());