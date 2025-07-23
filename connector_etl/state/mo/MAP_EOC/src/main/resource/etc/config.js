var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "MODOE",
        PRODUCT_NAME: "MAP_EOC",
        CONNECTOR_NAME: "state.mo.MAP_EOC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MODOE MAP_EOC",
                VENDOR_FOLDER_NAME: "MODOE",
                PRODUCT_FOLDER_NAME: "MAP_EOC",
                PERIODS: ["ALL","SPRING","WINTER","FALL","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EOC_ALL.sig",
                        CLIENT_CODE: ["ALL"]
                    }, {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EOC_Result_ALL.sig",
                        CLIENT_CODE: ["ALL"]
                    }, {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "EOC_21_ALL.sig",
                         CLIENT_CODE: ["ALL"]
                     },{
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MAP_EOC_24COLS.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MAP_EOC_113_COLS.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                         SIGNATURE_FILE: "MAP_EOC_113_COLS_DELIMITED.sig",
                         CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());