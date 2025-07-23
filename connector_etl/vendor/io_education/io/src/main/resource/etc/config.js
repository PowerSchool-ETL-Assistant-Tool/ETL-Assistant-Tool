var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "IO_EDUCATION",
        PRODUCT_NAME: "IO",
        CONNECTOR_NAME: "vendor.io_education.io",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "IO EDUCATION IO",
                VENDOR_FOLDER_NAME: "IO_EDUCATION",
                PRODUCT_FOLDER_NAME: "IO",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "IO_EADMS_GRADE_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "IO_EADMS_HIGHER_MATH_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2025-2026","*"],
                        SIGNATURE_FILE: "IO_EADMS_MIDDLE_MATH_1819.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
