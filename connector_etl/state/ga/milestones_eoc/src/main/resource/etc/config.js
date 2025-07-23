var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "GA",
        PRODUCT_NAME: "MILESTONE_EOC",
        CONNECTOR_NAME: "state.ga.milestones_eoc",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "GA MILESTONES EOC",
                VENDOR_FOLDER_NAME: "GA",
                PRODUCT_FOLDER_NAME: "MILESTONES_EOC",
                PERIODS:  ["ALL","Fall", "Winter", "Spring"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOC.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOC_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOC_Fixed_Long.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOC_Fixed_Long_X.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOC_SP19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MILESTONES_EOC_COL19.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
