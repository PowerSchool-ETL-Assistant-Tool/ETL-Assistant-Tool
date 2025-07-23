var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "DIBELS_NEXT_PROG",
        VENDOR_NAME: "Amplify",
        PRODUCT_NAME: "DIBELS_PMON",
        CONNECTOR_NAME: "vendor.amplify.DIBELS_PROG_MON",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Amplify DIBELS PROG MON",
                VENDOR_FOLDER_NAME: "Amplify",
                PRODUCT_FOLDER_NAME: "DIBELS_PROG_MON",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCLASS_PROG_MON_55COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());