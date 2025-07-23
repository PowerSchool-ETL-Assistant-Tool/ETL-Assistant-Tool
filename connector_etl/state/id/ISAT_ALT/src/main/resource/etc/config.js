var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "ISAT_ALT",
        VENDOR_NAME: "ID",
        PRODUCT_NAME: "ISAT_ALT",
        CONNECTOR_NAME: "state.id.ISAT_ALT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ID ISAT_ALT",
                VENDOR_FOLDER_NAME: "ID",
                PRODUCT_FOLDER_NAME: "ISAT_ALT",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ISAT_ALT_12_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "ISAT_ALT_MATH_19_COLS.sig",
                         CLIENT_CODE: ["ALL"]
                     },
                     {
                           YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                           SIGNATURE_FILE: "ISAT_ALT_ELA_19_COLS.sig",
                           CLIENT_CODE: ["ALL"]
                      },
                      {
                            YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                            SIGNATURE_FILE: "ISAT_ALT_SCI_19_COLS.sig",
                            CLIENT_CODE: ["ALL"]
                       }
                ]
            }
        ]
    }
}());
