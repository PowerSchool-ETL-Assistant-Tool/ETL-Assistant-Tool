var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "LEAP_EOC",
        VENDOR_NAME: "LADOE",
        PRODUCT_NAME: "LEAP_EOC",
        CONNECTOR_NAME: "state.la.LEAP_EOC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE LEAP EOC",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "LEAP_EOC",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_2025_1819_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2011-2012","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_1112.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2012-2013","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_1213.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_Historical_1516_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_HS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_HS_1617_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_HS_1718_Fixed.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_EOC_HS_SPRING_1516.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2010-2011","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_GEE_1011.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_GEE_1415.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2013-2014","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_GEE_SPRING_1314.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "LEAP_EOC_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                     {
                         YEARS: ["2017-2018","2025-2026","*"],
                         SIGNATURE_FILE: "LEAP_EOC_HS_Delim.sig",
                         CLIENT_CODE: ["ALL"]
                     },
                     {
                           YEARS: ["2017-2018","2018-2019","2025-2026","*"],
                           SIGNATURE_FILE: "LEAP_EOC_HS_18_19_Delim.sig",
                           CLIENT_CODE: ["ALL"]
                     },
                     {
                           YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                           SIGNATURE_FILE: "LEAP_2025_1920_HS_Delim.sig",
                           CLIENT_CODE: ["ALL"]
                     },
                     {
                           YEARS: ["2018-2019","2025-2026","*"],
                           SIGNATURE_FILE: "LEAP_EOC_HS_19_Summer.sig",
                           CLIENT_CODE: ["ALL"]
                     },
                     {
                           YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                           SIGNATURE_FILE: "LEAP_EOC_1718.sig",
                           CLIENT_CODE: ["ALL"]
                     },
                     {
                           YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                           SIGNATURE_FILE: "LEAP_EOC_20_21.sig",
                           CLIENT_CODE: ["ALL"]
                     }

                ]
            }
        ]
    }
}());
