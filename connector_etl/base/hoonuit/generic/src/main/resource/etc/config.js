var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "hoonuit",
        PRODUCT_NAME : "generic",
        CONNECTOR_NAME: "base.hoonuit.generic",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "HOONUIT GENERIC",
                VENDOR_FOLDER_NAME: "HOONUIT_GENERIC",
                PRODUCT_FOLDER_NAME: "GENERIC",
                PERIODS:  ["ALL", "Fall", "Winter", "Spring", "Summer"],
                SIGNATURES: [
                    {
                        YEARS: ["2009-2010","2010-2011","2011-2012","2012-2013","2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GENERIC_WITH_TEST.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2009-2010","2010-2011","2011-2012","2012-2013","2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GENERIC_WITHOUT_TEST.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
