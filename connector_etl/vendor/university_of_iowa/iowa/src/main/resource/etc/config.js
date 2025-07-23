var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "University of Iowa",
        PRODUCT_NAME: "Iowa",
        CONNECTOR_NAME: "vendor.university_of_iowa.iowa",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "University of Iowa",
                VENDOR_FOLDER_NAME: "university_of_iowa",
                PRODUCT_FOLDER_NAME: "iowa",
                PERIODS:  ["ALL","FALL","WINTER","SPRING","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2000-2001","2025-2026","*"],
                        SIGNATURE_FILE: "IOWA_0001.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2001-2002","2025-2026","*"],
                        SIGNATURE_FILE: "IOWA_0102.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2003-2004","2025-2026","*"],
                        SIGNATURE_FILE: "IOWA_0304.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2004-2005","2025-2026","*"],
                        SIGNATURE_FILE: "IOWA_0405.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "IOWA_1622.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "IOWA.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "IOWA_20_21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                         YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                         SIGNATURE_FILE: "IOWA_17_22.sig",
                         CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
