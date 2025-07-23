var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "WADOE",
        PRODUCT_NAME : "WA KIDS",
        CONNECTOR_NAME: "state.wa.WA_KIDS",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "WADOE WA-KIDS",
                VENDOR_FOLDER_NAME: "WADOE",
                PRODUCT_FOLDER_NAME: "WA_KIDS",
                PERIODS:  ["ALL","SPRING","FALL","WINTER"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "WA_KIDS.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "WA_KIDS_19.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "WA_KIDS_20_csv_comma.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                        SIGNATURE_FILE: "WA_KIDS_NEW.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                       YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "WA_KIDS_21_22.sig",
                       CLIENT_CODE: ["ALL"]
                    }
,
                    {
                       YEARS: ["2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","*","2025-2026"],
                       SIGNATURE_FILE: "WA_KIDS_21_22_csv.sig",
                       CLIENT_CODE: ["ALL"]
                    }

                ]
            }
        ]
    }
}());
