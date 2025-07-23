var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "TN",
        PRODUCT_NAME: "TVAAS_PROJECTIONS",
        CONNECTOR_NAME: "state.tn.TVAAS_PROJECTIONS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "TN TVAAS_PROJECTIONS",
                VENDOR_FOLDER_NAME: "TN",
                PRODUCT_FOLDER_NAME: "TVAAS_PROJECTIONS",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING",
                          ],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "TVAAS_PROJECTIONS.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
