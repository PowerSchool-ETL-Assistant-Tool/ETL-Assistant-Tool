var AppNSCEntities = (function() {
    var module = {};
    var _thisModuleName = "AppNSCEntities";
    var ApiUrl = "https://api.data.gov/ed/collegescorecard/v1/schools";
    var ApiKey = AssessmentLoader.config.DATA_GOV_KEY;
    var page = 0;
    var url = "${ApiUrl}?api_key=${ApiKey}&_fields=ope8_id,id,school.name,school.city,school.state,school.zip,school.operating,school.alias,school.institutional_characteristics.level,school.ownership,school.carnegie_basic,school.degrees_awarded.predominant,location.lat,location.lon,school.degrees_awarded.highest,school.minority_serving.historically_black,school.minority_serving.tribal,school.school_url,school.price_calculator_url&_page=0&_per_page=100";

    var ownerShip = {
        1   :  {code:"PUBLIC", group:"Public"},
        2   :  {code:"PRIVATENO$", group:"Private Not-For-Profit"},
        3   :  {code:"PRIVATE$$$", group:"Private For-Profit"}
    };

    var level = {
        1   :   {code:"4+", group:"4 Year"},
        2   :   {code:">=2 & <4", group:"2 Year"},
        3   :   {code:"<2", group:"Less Than 2 Years"}
    };

    var stateDecode = {
        "AL": "Alabama",
        "AK": "Alaska",
        "AS": "American Samoa",
        "AZ": "Arizona",
        "AR": "Arkansas",
        "CA": "California",
        "CO": "Colorado",
        "CT": "Connecticut",
        "DE": "Delaware",
        "DC": "District Of Columbia",
        "FM": "Federated States Of Micronesia",
        "FL": "Florida",
        "GA": "Georgia",
        "GU": "Guam",
        "HI": "Hawaii",
        "ID": "Idaho",
        "IL": "Illinois",
        "IN": "Indiana",
        "IA": "Iowa",
        "KS": "Kansas",
        "KY": "Kentucky",
        "LA": "Louisiana",
        "ME": "Maine",
        "MH": "Marshall Islands",
        "MD": "Maryland",
        "MA": "Massachusetts",
        "MI": "Michigan",
        "MN": "Minnesota",
        "MS": "Mississippi",
        "MO": "Missouri",
        "MT": "Montana",
        "NE": "Nebraska",
        "NV": "Nevada",
        "NH": "New Hampshire",
        "NJ": "New Jersey",
        "NM": "New Mexico",
        "NY": "New York",
        "NC": "North Carolina",
        "ND": "North Dakota",
        "MP": "Northern Mariana Islands",
        "OH": "Ohio",
        "OK": "Oklahoma",
        "OR": "Oregon",
        "PW": "Palau",
        "PA": "Pennsylvania",
        "PR": "Puerto Rico",
        "RI": "Rhode Island",
        "SC": "South Carolina",
        "SD": "South Dakota",
        "TN": "Tennessee",
        "TX": "Texas",
        "UT": "Utah",
        "VT": "Vermont",
        "VI": "Virgin Islands",
        "VA": "Virginia",
        "WA": "Washington",
        "WV": "West Virginia",
        "WI": "Wisconsin",
        "WY": "Wyoming"
    };

    /**
     * Helper function that opens a URL with a "GET" request
     *
     * @param url
     * @returns {string}
     */
    function httpGet(url) {
        try {
            var con = new java.net.URL(url).openConnection();
            con.requestMethod = "GET";

            return read(con.inputStream);
        } catch(exception) {
            throw "${_thisModuleName}.httpGet Exception: ${exception}";
        }
    }

    /**
     * Helper function that reads an input stream
     *
     * @param inputStream The stream to be read
     * @returns {string} The data from the stream
     */
    function read(inputStream) {
        try {
            var inReader = new java.io.BufferedReader(new java.io.InputStreamReader(inputStream));
            var inputLine;
            var response = new java.lang.StringBuffer();

            while ((inputLine = inReader.readLine()) != null) {
                response.append(inputLine);
            }

            inReader.close();

            return response.toString();
        } catch(exception) {
            throw "${_thisModuleName}.read Exception: ${exception}";
        }
    }

    /**
     * Deletes an entity record from XTBL_ENTITIES
     *
     * @param DBPARAMS The DB parameters to XTBL_ENTITIES
     * @param entityCode The entity code of the record to be deleted
     * @param entitySourceCode The entity source code of the record to be deleted.
     */
    function deleteRecord(DBPARAMS, entitiesToDelete) {
        try {
            const sources = Object.keys(entitiesToDelete);
            sources.forEach(function(source) {
                let entityCodes = "";
                entitiesToDelete[source].forEach(function(code) {
                    entityCodes += `'${code}',`;
                });

                entityCodes = entityCodes.substring(0, entityCodes.length - 1);

                var deleteQuery = `Delete from K12INTEL_USERDATA.XTBL_ENTITIES where ENTITY_CODE in (${entityCodes}) and ENTITY_SOURCE_CODE = '${source}';`;
                AppUtil.executeSqlOnDb(deleteQuery, DBPARAMS);
            });
        } catch(exception) {
            throw "${_thisModuleName}.deleteRecord Exception: ${exception}";
        }
    }

    /**
     * Pads a number with 0's
     *
     * @param val The value to pad
     * @returns {string} The padded value
     */
    function pad(val) {
        try {
            var v = "" + val;

            while (v.length < 8) {
                v = "0" + v;
            }

            return v;
        } catch(exception) {
            throw "${_thisModuleName}.pad Exception: ${exception}";
        }
    }

    /**
     * Creates json from entities
     *
     * @param input The input used to get the entity records
     * @returns {{}} json of entities
     */
    function createEntitiesObject(input) {
        var keymap = {};

        _dataflow.create("GET XTBL_ENTITY DATASET")
            .input("INPUT", input)
            .sort("SORT RECORDS", function (one, two) {
                if (one.ENTITY_CODE > two.ENTITY_CODE)
                    return 1;
                else if (one.ENTITY_CODE < two.ENTITY_CODE)
                    return -1;

                return 0;
            })
            .output("OUTPUT",
                function (json) {
                    var key = json["ENTITY_SOURCE_CODE"] + json["ENTITY_CODE"];
                    keymap[key] = json
                })
            .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

        return keymap;
    }

    /**
     * Gets the date difference from the most populated modified date from xtbl_entities
     *
     * @param path Path to location of sql file
     * @param DBPARAMS JSON object of database params
     * @returns {*} Integer difference from most populated date from date query ran
     */
    module.checkDateDifference = function(path, DBPARAMS) {
        const sqlQuery = AppUtil.getStrFromFile("${path}/jesse/sourceFiles/mostPopulatedDateDiff.sql");
        const connectorInput = _io.database_input(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, sqlQuery, AppDataflow.getDBContext());
        const diffResults = AppDataflow.getDataSet(connectorInput, "DATEDIFF", "DATEDIFF");
        const diff = diffResults.length === 0 ? 999 : diffResults[0].DATEDIFF;
        return diff;

    }

    /**
     * Retrieves all data from XTBL_ENTITIES
     *
     * @param path The path to where the NSC folder was extracted
     * @param DBPARAMS The DB parameters to XTBL_ENTITIES
     * @returns {{}} JSON object with ENTITY_SOURCE_CODE and ENTITY_SOURCE_CODE concatenated as key and the whole record as the value
     */
    module.getXtblEntityData = function(path, DBPARAMS) {
        try {
            _util.printInfo("\nRetrieving data from K12INTEL_METADATA.XTBL_ENTITIES and creating a lookup.\n");
            var sql = AppUtil.getStrFromFile("${path}jesse/sourceFiles/xtblEntitiesSelect.sql");
            if (AssessmentLoader.config.ENABLE_DEBUG) {_util.printWarning("\n" + sql + "\n")}
            var entitiesInput = _io.database_input(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, sql);

            return createEntitiesObject(entitiesInput);

        } catch(exception) {
            throw "${_thisModuleName}.getXtblEntityData Exception: ${exception}";
        }
    };

    /**
     * Retrieves all data from XTBL_ENTITIES
     *
     * @param path The path to base entity file
     * @returns {{}} JSON object with ENTITY_SOURCE_CODE and ENTITY_SOURCE_CODE concatenated as key and the whole record as the value
     */
    module.getFileEntityData = function(path) {
        try {
            _util.printInfo("\nEntity table was found empty.  Retrieving data from base entity file and creating a lookup.\n");
            var entitiesInput = _io.delim_input_ext(path, ",", "\"", "\\");

            return createEntitiesObject(entitiesInput);

        } catch(exception) {
            throw "${_thisModuleName}.getXtblEntityData Exception: ${exception}";
        }
    };

    /**
     * Retrieves entity data from data.gov
     *
     * @param path The directory where the entity file will be saved
     */
    module.getEntityData = function(path) {
        try {
            _util.printInfo("\nRetrieving entity data from data.gov.\n");
            var response = JSON.parse(httpGet(url));
            var results = response.results;
            var totalPages = Math.ceil(response.metadata.total / response.metadata.per_page);
            var today = AppUtil.getDateObj(new Date()).STANDARD_DATE

            for (page = 1; page < totalPages; page++) {
                var temp = results;
                url = "${ApiUrl}?api_key=${ApiKey}&_fields=ope8_id,id,school.name,school.city,school.state,school.zip,school.operating,school.alias,school.institutional_characteristics.level,school.ownership,school.carnegie_basic,school.degrees_awarded.predominant,location.lat,location.lon,school.degrees_awarded.highest,school.minority_serving.historically_black,school.minority_serving.tribal,school.school_url,school.price_calculator_url&_page=${page}&_per_page=100"
                response = JSON.parse(httpGet(url));
                if (AssessmentLoader.config.ENABLE_VERBOSE) {
                    _util.printWarning("\n" + JSON.stringify(response) + "\n")
                }
                results = temp.concat(response.results);
            }

            _dataflow.create("CREATE ENTITY RECORDS")
                .input("INPUT", function (out) {
                    for (var i = 0; i < results.length; i++) {
                        try {
                            var rec = {
                                ENTITY_CODE: results[i].id,
                                ENTITY_NAME: results[i]["school.name"],
                                ENTITY_EXT_CODE_1: pad(results[i].ope8_id),
                                ENTITY_EXT_CODE_2: null,
                                ENTITY_STATUS: (results[i]["school.operating"] === 1) ? "Active" : "Inactive",
                                ENTITY_TYPE_CODE: (results[i]["school.carnegie_basic"] > 9) ? "POSTSEC" : "NO POSTSEC",
                                ENTITY_TYPE: (results[i]["school.carnegie_basic"] > 9) ? "Primarily Post-Secondary" : "Not Primarily Post-Secondary",
                                ENTITY_GROUP_CODE: ownerShip[results[i]["school.ownership"]].code,
                                ENTITY_GROUP: ownerShip[results[i]["school.ownership"]].group,
                                ENTITY_SUBGROUP_CODE: level[results[i]["school.institutional_characteristics.level"]].code,
                                ENTITY_SUBGROUP: level[results[i]["school.institutional_characteristics.level"]].group,
                                ENTITY_CERTIFIED_IND: (results[i]["school.degrees_awarded.highest"] === 0) ? "No" : "Yes",
                                ENTITY_MINORITY_CODE: (results[i]["school.minority_serving.historically_black"] === 0) ? "No" : "Yes",
                                ENTITY_MINORITY_CODE2: (results[i]["school.minority_serving.tribal"] === 0) ? "No" : "Yes",
                                ENTITY_MINORITY_IND: (this.ENTITY_MINORITY_CODE === "Yes" || this.ENTITY_MINORITY_CODE2 === "Yes") ? "Yes" : "No",
                                ENTITY_BASE_CURR_CODE: "USD",
                                ENTITY_BASE_CURRENCY: "US Dollars",
                                ENTITY_TERMS_TYPE: "N/A",
                                ENTITY_TERMS_DAYS: null,
                                ENTITY_CREDIT_LIMIT: null,
                                ENTITY_CITY: results[i]["school.city"],
                                ENTITY_STATE_CODE: results[i]["school.state"],
                                ENTITY_STATE: stateDecode[results[i]["school.state"]],
                                ENTITY_POSTAL_CODE: results[i]["school.zip"],
                                ENTITY_COUNTY: null,
                                ENTITY_XCOORD: results[i]["location.lon"],
                                ENTITY_YCOORD: results[i]["location.lat"],
                                ENTITY_ABBREVIATION: (results[i]["school.alias"] !== null && results[i]["school.alias"].length > 20) ? results[i]["school.alias"].substring(0, 20) : results[i]["school.alias"],
                                ENTITY_DESCRIPTION: null,
                                ENTITY_CONTACT_INFO: null,
                                ENTITY_ADDRESS: null,
                                ENTITY_PHONE: null,
                                DEFAULT_LEDGER: null,
                                STARTING_FISCAL_YEAR: null,
                                ENTITY_SOURCE_CODE: "data.gov",
                                EFFECTIVE_START_DATE: "1/1/1900",
                                EFFECTIVE_END_DATE: "12/31/9999",
                                DISTRICT_CODE: "[ALL]",
                                CREATE_USER: "System",
                                CREATE_DATE: today,
                                MODIFY_USER: "System",
                                MODIFY_DATE: today
                            };

                            if (AssessmentLoader.config.ENABLE_VERBOSE) {
                                _util.printWarning("\n" + JSON.stringify(rec) + "\n")
                            }
                            out.put(rec);
                        } catch (e) {
                            _util.printException(_thisModuleName + " module.getEntityData error " + e + "\n");
                        }
                    }
                })
                .sort("SORT RECORDS", function (one, two) {
                    if (one.ENTITY_CODE > two.ENTITY_CODE)
                        return 1;
                    else if (one.ENTITY_CODE < two.ENTITY_CODE)
                        return -1;

                    return 0;
                })
                .output("FILE OUTPUT", _io.delim_output(path, ",", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);
        } catch(exception) {
            throw "${_thisModuleName}.getEntityData Exception: ${exception}";
        }
    };

    /**
     * Compares Entity Dataset to Xtbl Entities
     *
     * @param path Path to entities file
     * @param DBPARAMS Database parameters to access XTBL_ENTITIES
     * @param keymap The json object of the XTBL ENTITIES DATA
     * @param firstLoad Boolean value determining if this is the first time entities are being loaded
     */
    module.checkEntityData = function(path, DBPARAMS, keymap, firstLoad) {
        try {
            var updateQuery = "UPDATE K12INTEL_USERDATA.XTBL_ENTITIES SET MODIFY_DATE = GETDATE() WHERE 1=1 AND ENTITY_SOURCE_CODE = 'data.gov';";
            var today = AppUtil.getDateObj(new Date()).STANDARD_DATE;
            let entitiesToDelete = {};
            _util.printInfo("\nComparing lookup to downloaded entities data, and updating as needed.\n");
            _dataflow.create("COMPARE ENTITY DATASET TO XTBL ENTITIES")
                .input("READ ENTITIES FILE", _io.delim_input_ext(path, ",", "\"", "\\"))
                .transform("COMPARE RECORDS", ["RECORDS"],
                    function (output, json) {
                        var key = json["ENTITY_SOURCE_CODE"] + json["ENTITY_CODE"];

                        if (keymap.hasOwnProperty(key)) {
                            var rec = AppUtil.copyObj(json);
                            rec.EFFECTIVE_START_DATE = keymap[key].EFFECTIVE_START_DATE;
                            rec.EFFECTIVE_END_DATE = keymap[key].EFFECTIVE_END_DATE;
                            rec.CREATE_DATE = keymap[key].CREATE_DATE;
                            rec.MODIFY_DATE = keymap[key].MODIFY_DATE;

                            if (JSON.stringify(rec) !== JSON.stringify(keymap[key]) || firstLoad) {
                                if (!firstLoad) {
                                    if (!entitiesToDelete.hasOwnProperty(json["ENTITY_SOURCE_CODE"])) {
                                        entitiesToDelete[json["ENTITY_SOURCE_CODE"]] = [];
                                    }

                                    entitiesToDelete[json["ENTITY_SOURCE_CODE"]].push(json["ENTITY_CODE"]);
                                    //deleteRecord(DBPARAMS, json["ENTITY_CODE"], json["ENTITY_SOURCE_CODE"]);
                                }

                                json.MODIFY_DATE = today
                                output.RECORDS.put(json)
                            }
                            delete keymap[key];
                        }
                        else {
                            output.RECORDS.put(json);
                        }
                    })
                .output("TEST FILE OUTPUT", _io.delim_output("${AssessmentLoader.config.APP_PATH}${AssessmentLoader.config.TEMP_FOLDER}/ENTITIES.txt", "\t", "\"", "\\", false))
                //.output("DATABASE OUTPUT", _io.database_output(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, "K12INTEL_USERDATA", "XTBL_ENTITIES"))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            deleteRecord(DBPARAMS, entitiesToDelete);
            AppUtil.executeBulkLoadOnDb(`${AssessmentLoader.config.APP_PATH}${AssessmentLoader.config.TEMP_FOLDER}/ENTITIES.txt`, `K12INTEL_USERDATA`, `XTBL_ENTITIES`, DBPARAMS);

            if (firstLoad) {
                _dataflow.create("ADD REMAINING HISTORIC DATASET")
                    .input("READ REMAINING DATA.GOV ENTITIES", function (out) {
                        for (var key in keymap) {
                            if (keymap[key].ENTITY_SOURCE_CODE === "data.gov") {
                                keymap[key].MODIFY_DATE = today
                                out.put(keymap[key]);
                            }
                        }
                    })
                    .output("TEST FILE OUTPUT", _io.delim_output("${AssessmentLoader.config.APP_PATH}${AssessmentLoader.config.TEMP_FOLDER}/DATA_GOV_ENTITIES.txt", "\t", "\"", "\\", false))
                    //.output("DATABASE OUTPUT", _io.database_output(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, "K12INTEL_USERDATA", "XTBL_ENTITIES"))
                    .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

                AppUtil.executeBulkLoadOnDb(`${AssessmentLoader.config.APP_PATH}${AssessmentLoader.config.TEMP_FOLDER}/DATA_GOV_ENTITIES.txt`, `K12INTEL_USERDATA`, `XTBL_ENTITIES`, DBPARAMS);
            }

            AppUtil.executeSqlOnDb(updateQuery, DBPARAMS);
        } catch(exception) {
            throw "${_thisModuleName}.checkEntityData Exception: ${exception}";
        }
    };

    return module;
}());