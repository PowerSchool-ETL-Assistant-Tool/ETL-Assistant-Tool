var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "LAUSD",
        PRODUCT_NAME: "LA_TRC_PROG_MON_DATA",
        CONNECTOR_NAME: "state.ca.LA_TRC_PROG_MON_DATA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LAUSD TRC PROG MON DATA",
                VENDOR_FOLDER_NAME: "LAUSD",
                PRODUCT_FOLDER_NAME: "LA_TRC_PROG_MON_DATA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LA_TRC.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
