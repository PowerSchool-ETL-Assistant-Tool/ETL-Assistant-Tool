var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "CADOE",
        PRODUCT_NAME : "SBAC_INTERIM",
        CONNECTOR_NAME: "state.ca.ca_sbac_interim",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "CA SBAC_INTERIM",
                VENDOR_FOLDER_NAME: "CA",
                PRODUCT_FOLDER_NAME: "CA_SBAC_INTERIM",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SBAC_INTERIM_23_24_94_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "SBAC_INTERIM_IAB_48_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "SBAC_IAB_48_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "SBAC_23_24_94_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "SBAC_IAB_19_COLS.sig",
                       CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());