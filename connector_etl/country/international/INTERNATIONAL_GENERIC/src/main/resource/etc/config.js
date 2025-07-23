var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "International",
        PRODUCT_NAME: ["LE SUMMATIVE","PALS","DIBELS","SRD--DIBELS","SRD--PALS"],
        CONNECTOR_NAME: "country.international.INTERNATIONAL_GENERIC",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "country international INTERNATIONAL_GENERIC",
                VENDOR_FOLDER_NAME: "country_international_INTERNATIONAL_GENERIC",
                PRODUCT_FOLDER_NAME: "INTERNATIONAL_GENERIC",
                PERIODS:  ["ALL", "T1", "T2", "T3", "FALL","SPRING","MIDYEAR"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GENERIC_SIG_11COL.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "GENERIC_SIG_15_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());