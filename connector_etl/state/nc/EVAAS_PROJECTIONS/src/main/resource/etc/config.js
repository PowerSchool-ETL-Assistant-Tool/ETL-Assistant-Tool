var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "NC",
        PRODUCT_NAME: "EVAAS_PROJECTIONS",
        CONNECTOR_NAME: "state.nc.EVAAS_PROJECTIONS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NC EVAAS_PROJECTIONS",
                VENDOR_FOLDER_NAME: "NC",
                PRODUCT_FOLDER_NAME: "EVAAS_PROJECTIONS",
                PERIODS:  ["ALL", "FALL", "WINTER", "SPRING",
                          ],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "EVAAS_22_23.sig",
                        CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
