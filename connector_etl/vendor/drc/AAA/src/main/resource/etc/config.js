var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "DRC",
        PRODUCT_NAME: "AAA",
        CONNECTOR_NAME: "vendor.drc.AAA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "DRC AAA",
                VENDOR_FOLDER_NAME: "DRC",
                PRODUCT_FOLDER_NAME: "AAA",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "AAA_District_18_19.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
