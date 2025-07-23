var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "GA",
        PRODUCT_NAME: "MILESTONES_EOG",
        CONNECTOR_NAME: "state.ga.milestones_eog",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "GA MILESTONES EOG",
                VENDOR_FOLDER_NAME: "GA",
                PRODUCT_FOLDER_NAME: "MILESTONES_EOG",
                PERIODS: ["ALL","Fall", "Winter", "Spring", "Summer"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOG.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOG_1415_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOG_1617_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOG_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOG_1920.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "GA_ASSM_RESULTS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "EOG_21_22.sig",
                         CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "AUTOMATION_70_1_COLS.sig",
                         CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
