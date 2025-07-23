var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : ["MDE", "WIDA"],
        PRODUCT_NAME : ["MCA","MTAS", "ACCESS", "ALTERNATE_ACCESS"],
        CONNECTOR_NAME: "state.mn.MCA_MTAS_FINAL",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MDE MCA MTAS FINAL",
                VENDOR_FOLDER_NAME: "MDE",
                PRODUCT_FOLDER_NAME: "MCA_MTAS_FINAL",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCA_MTAS_FINAL_Z.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCA_MTAS_FINAL_COMMAD.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MCA_MTAS_FINAL_TABD.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
