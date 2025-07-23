var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "HOUGHTON_MIFFLIN_HARCOURT",
        PRODUCT_NAME: "MATH_INVENTORY",
        CONNECTOR_NAME: "vendor.houghton_mifflin_harcourt.math_inventory",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Houghton Mifflin Harcourt Math Inventory",
                VENDOR_FOLDER_NAME: "HOUGHTON_MIFFLIN_HARCOURT",
                PRODUCT_FOLDER_NAME: "MATH_INVENTORY",
                PERIODS:  ["ALL","Spring","Fall","Winter"],
                SIGNATURES: [
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Math_Inventory.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Math_Inventory_20_21.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Math_Inventory_21_22.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "Math_inventory_511_1_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
