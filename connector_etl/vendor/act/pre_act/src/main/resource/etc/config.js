var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "ACT",
        PRODUCT_NAME: "Pre-ACT",
        CONNECTOR_NAME: "vendor.act.pre_act",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ACT PRE-ACT",
                VENDOR_FOLDER_NAME: "ACT",
                PRODUCT_FOLDER_NAME: "PRE_ACT",
                PERIODS: ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PRE_ACT.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PRE_ACT_DELIMITED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PRE_ACT_DELIMITED_V2.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PRE_ACT_DELIMITED_V3.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "PRE_ACT_21-22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "PRE_ACT_1.sig",
                         CLIENT_CODE: ["ALL"]
                     },
                    {
                         YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "PRE_ACT_16.sig",
                         CLIENT_CODE: ["ALL"]
                     }
                ]
            }
        ]
    }
}());
