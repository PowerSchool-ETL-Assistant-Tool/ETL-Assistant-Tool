var AppAssessmentConfig = (function() {
    return {
        VENDOR_NAME : "NWEA",
        PRODUCT_NAME : "MAP_FLUENCY",
        CONNECTOR_NAME: "vendor.nwea.MAP_FLUENCY",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "NWEA MAP_FLUENCY",
                VENDOR_FOLDER_NAME: "NWEA",
                PRODUCT_FOLDER_NAME: "MAP_FLUENCY",
                PERIODS:  ["ALL","FALL","WINTER","SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MAP_Fluency.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
