var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE: "",
        VENDOR_NAME: "FastBridge",
        PRODUCT_NAME: "aMath",
        CONNECTOR_NAME: "vendor.fastbridge.aMath",
        VENDOR_FTP_NAME: "fastBridge",
        PRODUCT_FTP_NAME: "aMath",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "fastBridge aMath",
                VENDOR_FOLDER_NAME: "fastBridge",
                PRODUCT_FOLDER_NAME: "aMath",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "aMath.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "aMath_2021.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "aMath_feb_mar.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
