var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "DIBELS_NEXT_PROG",
        VENDOR_NAME: "UOregon",
        PRODUCT_NAME: ["DIBELS_PMON", "DIBELS 8th Edition"],
        CONNECTOR_NAME: "state.co.co_dibels_prog_mon",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "UOregon CO DIBELS PROG MON",
                VENDOR_FOLDER_NAME: "UOregon",
                PRODUCT_FOLDER_NAME: "CO_DIBELS_PROG_MON",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "CO_DIBELS_PROG_MON_CSV.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "CO_DIBELS_PROG_MON22-23.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
