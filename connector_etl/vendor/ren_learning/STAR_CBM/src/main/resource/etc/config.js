var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "Renaissance Learning",
        PRODUCT_NAME: "STAR_CBM",
        CONNECTOR_NAME: "vendor.ren_learning.STAR_CBM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Renaissance Learning STAR_CBM",
                VENDOR_FOLDER_NAME: "Renaissance_Learning",
                PRODUCT_FOLDER_NAME: "STAR_CBM",
                PERIODS:  ["ALL", "FALL", "WINTER" ,"SPRING"],
                SIGNATURES: [
                   {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "STAR_CBM.sig",
                        CLIENT_CODE: ["ALL"]
                   }


                ]
            }
        ]
    }
}());
