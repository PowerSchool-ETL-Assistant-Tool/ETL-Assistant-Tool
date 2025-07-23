var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NC",
        PRODUCT_NAME: "CHECK_INS_v2",
        CONNECTOR_NAME: "state.nc.CHECK_INS_v2",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NC/CHECK_INS_v2",
                VENDOR_FOLDER_NAME: "NC",
                PRODUCT_FOLDER_NAME: "CHECK_INS_v2",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "check_ins_2023_2024_69_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "check_ins_2023_2024_9_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
