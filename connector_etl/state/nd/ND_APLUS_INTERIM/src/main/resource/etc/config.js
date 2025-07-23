var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "NDDPI",
        PRODUCT_NAME: "ND_APLUS_INTERIM",
        CONNECTOR_NAME: "state.nd.ND_APLUS_INTERIM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ND ND_APLUS_INTERIM",
                VENDOR_FOLDER_NAME: "NDDPI",
                PRODUCT_FOLDER_NAME: "ND_APLUS_INTERIM",
			    PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ND_APLUS_INTERIM_COL_213.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
