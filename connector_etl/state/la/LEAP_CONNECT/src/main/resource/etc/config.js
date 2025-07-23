var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "LEAP_CONNECT",
        VENDOR_NAME: "LADOE",
        PRODUCT_NAME: "LEAP_CONNECT",
        CONNECTOR_NAME: "state.la.LEAP_CONNECT",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "LADOE/LEAP_CONNECT",
                VENDOR_FOLDER_NAME: "LADOE",
                PRODUCT_FOLDER_NAME: "LEAP_CONNECT",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "LEAP_CONNECT.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }       ]
    }
}());
