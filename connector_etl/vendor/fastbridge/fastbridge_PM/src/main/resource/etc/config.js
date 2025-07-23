var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "FastBridge",
        PRODUCT_NAME: ["AMATH_PM","AREADING_PM","AUTOReading_PM","CBMR_English_PM","CBMR_SPANISH_PM","CBM_MATH_PM",
                       "COMPREHENSION_EFFICIENCY","COMPREHENSION_QUESTION","COMPREHENSION_RECALL","DEVELOPMENTAL_MILESTONES_PM",
                       "EARLY_READING_PM","Early_Math_PM","SAEBRS_DBR","SAEBRS_STUDENT","SAEBRS_TEACHER","EARLY_READING_SPANISH_PM"],
        CONNECTOR_NAME: "vendor.fastbridge.fastbridge_PM",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "FastBridge fastbridge_PM",
                VENDOR_FOLDER_NAME: "FASTBRIDGE",
                PRODUCT_FOLDER_NAME: "FASTBRIDGE_PM",
                PERIODS:  ["ALL","Fall","Winter","Spring"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "FASTBRIDGE_PM.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
