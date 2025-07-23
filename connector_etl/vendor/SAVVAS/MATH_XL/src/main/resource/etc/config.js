var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "SAVVAS",
        PRODUCT_NAME : "MATH_XL",
        CONNECTOR_NAME: "vendor.SAVVAS.MATH_XL",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "SAVVAS MATH_XL",
                VENDOR_FOLDER_NAME: "SAVVAS",
                PRODUCT_FOLDER_NAME: "MATH_XL",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                       YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                       SIGNATURE_FILE: "SAVVAS_MATH_22_23.sig",
                       CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
