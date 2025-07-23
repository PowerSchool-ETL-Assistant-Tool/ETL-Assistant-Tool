var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NJDOE",
        PRODUCT_NAME : "NJGPA",
        CONNECTOR_NAME: "state.nj.NJGPA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NJ NJGPA",
                VENDOR_FOLDER_NAME: "NJDOE",
                PRODUCT_FOLDER_NAME: "NJGPA",
                PERIODS: ["ALL","FALL","SPRING","WINTER","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "NJGPA_22_23_205_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
