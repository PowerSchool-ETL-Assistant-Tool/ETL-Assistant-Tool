var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "OST",
        VENDOR_NAME: "OHDOE",
        PRODUCT_NAME: ["OST","OCBA","OELPA","OELPS","ELSCR","AASCD"],
        CONNECTOR_NAME: "state.oh.OST",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "OHDOE OST",
                VENDOR_FOLDER_NAME: "OHDOE",
                PRODUCT_FOLDER_NAME: "OST",
                PERIODS: ["ALL", "SPRING", "FALL", "WINTER","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_161718_FW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_1516_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2025-2026","*"],
                        SIGNATURE_FILE: "AASCD_Spr15.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "AASCD_Spring2016.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_1819_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_STRAND_1920_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    }, 
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_STRAND_1920_TAB.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_STRAND_2021_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_161718_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_161718_COMMA_ADDCOL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_1819_COMMA_ADDCOL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_201819_COMMA_ADDCOL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_STRAND_202021_COMMA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2017-2018","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_1718_FW.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_1819_FW.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2019-2020","2025-2026","*"],
                        SIGNATURE_FILE: "OST_STRAND_1920_FW.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_STRAND_2021_FW.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "SPRING_OST_18.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_26_COL_1718.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_SPRING_2018_19COLS.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_ALGEBRA1.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_AMERICAN_GOVERNMENT.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_AMERICAN_HISTORY.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_BIOLOGY.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_ELA_1.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_ELA_2.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G3_ELA.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G3_MATH.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G4_ELA.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G4_MATH.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G5_ELA.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G5_MATH.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G5_SCIENCE.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G6_ELA.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G6_MATH.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G7_ELA.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G7_MATH.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G8_ELA.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G8_MATH.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_GEOMETRY.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_INTEGRATED_MATH_1.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_INTEGRATED_MATH_2.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_PHYSICAL_SCIENCE.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "KETTERING_CITY_G3_ELA_COL124.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OST_27_1_COLS.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AUTOMATION_28_1_COLS.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AUTOMATION_75_1_COLS.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    },
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "OELPA_24_COLS.sig",
                        CLIENT_CODE: ["ALL", "SPRING", "FALL", "WINTER"]
                    }
                ]
            }
        ]
    }
}());
