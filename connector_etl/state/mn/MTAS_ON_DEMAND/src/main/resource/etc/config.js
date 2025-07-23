var AppAssessmentConfig = (function() {
    return {
        VENDOR_SCHOOL_ID_TYPE : "",
        VENDOR_NAME : "MNDOE",
        PRODUCT_NAME : "MTAS On Demand",
        CONNECTOR_NAME: "state.mn.mtas_on_demand",
        PRODUCT_LIST: [
            {
                UI_DISPLAY_NAME: "MNDOE MTAS ON DEMAND",
                VENDOR_FOLDER_NAME: "MNDOE",
                PRODUCT_FOLDER_NAME: "MTAS_ON_DEMAND",
                PERIODS:  ["ALL"],
                SIGNATURES: [
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MTAS_ON_DEMAND.sig",
                        CLIENT_CODE: ["ALL"]
                    },
                    {
                        YEARS: ["2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021","2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","*"],
                        SIGNATURE_FILE: "MTAS_ON_DEMAND_2122.sig",
                        CLIENT_CODE: ["ALL"]
                    }
                ]
            }
        ]
    }
}());
