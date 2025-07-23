var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "PA",
        PRODUCT_NAME: "PVAAS",
        CONNECTOR_NAME: "state.pa.PVAAS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "PA PVAAS",
                VENDOR_FOLDER_NAME: "PA",
                PRODUCT_FOLDER_NAME: "PVAAS",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING",
                          ],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "PVAAS_10_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
