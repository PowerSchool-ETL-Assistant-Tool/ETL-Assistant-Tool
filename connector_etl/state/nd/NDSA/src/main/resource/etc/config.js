var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Cambium",
        PRODUCT_NAME: "NDSA",
        CONNECTOR_NAME: "state.nd.NDSA",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "ND NDSA",
                VENDOR_FOLDER_NAME: "ND",
                PRODUCT_FOLDER_NAME: "NDSA",
                PERIODS: ["ALL", "FALL", "WINTER", "SPRING"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "ELA_LITERACY_29_COLS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MATH_SCIENCE_COLS_27.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
