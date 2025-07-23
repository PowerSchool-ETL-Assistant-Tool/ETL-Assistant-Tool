var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "ACT",
        PRODUCT_NAME: "AZ_ACT_ASPIRE",
        CONNECTOR_NAME: "state.az.AZ_ACT_ASPIRE",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "AZ ACT ASPIRE",
                VENDOR_FOLDER_NAME: "ACT",
                PRODUCT_FOLDER_NAME: "AZ_ACT_ASPIRE",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AZ_ACT_ASPIRE_2020-2021.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
