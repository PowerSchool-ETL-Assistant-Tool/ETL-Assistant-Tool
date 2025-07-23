var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Riverside",
        PRODUCT_NAME: "CA_ESGI",
        CONNECTOR_NAME: "state.ca.CA_ESGI",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Riverside ESGI",
                VENDOR_FOLDER_NAME: "Riverside",
                PRODUCT_FOLDER_NAME: "CA_ESGI",
                PERIODS: ["ALL","SPRING","WINTER","FALL","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ESGI_17_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());