var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "CEEB",
        VENDOR_NAME: "NSC",
        PRODUCT_NAME: "NSC",
        CONNECTOR_NAME: "vendor.nsc.nsc",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NSC NSC",
                VENDOR_FOLDER_NAME: "NSC",
                PRODUCT_FOLDER_NAME: "NSC",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "nsc.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "nsc_LDOE.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
   }
}());
