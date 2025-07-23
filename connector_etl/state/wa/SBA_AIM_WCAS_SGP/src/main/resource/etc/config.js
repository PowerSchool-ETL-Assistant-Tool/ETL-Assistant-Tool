var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "WADOE",
        PRODUCT_NAME: ["EOC", "HSPE", "MSP", "MSPB", "OFFG", "SBA", "WCAS", "AIM"],
        CONNECTOR_NAME: "state.wa.SBA_AIM_WCAS_SGP",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WADOE SBA AIM WCAS SGP",
                VENDOR_FOLDER_NAME: "WADOE",
                PRODUCT_FOLDER_NAME: "SBA_AIM_WCAS_SGP",
                PERIODS: ["ALL","SPRING","FALL","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SBA_AIM_WCAS_SGP.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "SBA_WCA_AGP.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
