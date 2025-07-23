var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MSDOE",
        PRODUCT_NAME: "MS_MAAP",
        CONNECTOR_NAME: "state.ms.MS_MAAP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MSDOE MS_MAAP",
                VENDOR_FOLDER_NAME: "MSDOE",
                PRODUCT_FOLDER_NAME: "MS_MAAP",
                PERIODS: ["ALL","FALL","SPRING","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAAP.sig",
                        CLIENT_CODE: ["ALL"]
                    }, {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAAP_ALT.sig",
                        CLIENT_CODE: ["ALL"]
                    }, {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MAAP_SCI.sig",
                         CLIENT_CODE: ["ALL"]
                     }, {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MAAP_113COLS.sig",
                         CLIENT_CODE: ["ALL"]
                     }
                ]
            }
        ]
    }
}());