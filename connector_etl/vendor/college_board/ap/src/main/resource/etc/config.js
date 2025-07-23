var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "The College Board",
        PRODUCT_NAME: "AP",
        CONNECTOR_NAME: "vendor.college_board.ap",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "The College Board AP",
                VENDOR_FOLDER_NAME: "The_College_Board",
                PRODUCT_FOLDER_NAME: "AP",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_DELIM.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    //{
                    //    YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","*","2025-2026"],
                    //    SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER.sig",
                    //    CLIENT_CODE: ["ALL"]
                    //},
                    //{
                        //YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","*","2025-2026"],
                        //SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER_DOTS.sig",
                        //CLIENT_CODE: ["ALL"]
                    //},
                    //{
                        //YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","*","2025-2026"],
                        //SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER_SPACELESS.sig",
                        //CLIENT_CODE: ["ALL"]
                    //},
                    //{
                    //    YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","*","2025-2026"],
                    //    SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER_BLANKS.sig",
                    //    CLIENT_CODE: ["ALL"]
                    //},
                    //{
                    //    YEARS: ["2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                    //    SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER.sig",
                    //    CLIENT_CODE: ["ALL"]
                    //},
                    {
                        YEARS: ["2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_FIXED.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "LDOE_AP_STUDENT_DATAFILE_FORMAT_DELIM.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AP_STUDENT_DATAFILE_FORMAT_TAB.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AP_10_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AP_COLS246.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "AP_22_23_190_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
