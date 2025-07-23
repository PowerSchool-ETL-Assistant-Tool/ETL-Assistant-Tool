var AppAssessmentConfig = (function () {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "Amplify DIBELS 8th Edition",
        PRODUCT_NAME: "NH_DIBELS8TH",
        CONNECTOR_NAME: "state.nh.NH_DIBELS8TH",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "Amplify NH_DIBELS8TH",
                VENDOR_FOLDER_NAME: "Amplify",
                PRODUCT_FOLDER_NAME: "NH_DIBELS8TH",
                PERIODS: ["ALL","SPRING","WINTER","FALL","SUMMER"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "DIBELS_8TH_COLS_1303.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());