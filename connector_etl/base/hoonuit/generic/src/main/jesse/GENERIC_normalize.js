var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var testProduct = [];
    var testVendor = [];

    /**
     * Creates a new assessment record without a ASSESSMENT_JSON_MAPPINGS
     *
     * @param fields The fields being populated
     * @returns {{}} Assessment record
     */
    function createNewRecord(fields) {
        try {
            var record = {};

            fields.forEach(function (field) {
                record[field] = null;
            });

            delete record.ASSESSMENT_JSON_MAPPINGS;

            return record;

        } catch(exception) {
            throw "${_thisModuleName}.createNewRecord Exception: ${exception}";
        }
    }


    /**
     * Helper function that creates the Assessment json mapping for any fields not used in the normalized file
     *
     * @param fieldDetails A json object that has every field from the signature.
     *                  key: logical name of the column
     *                  value: json object with 2 properties: physicalName and formatMask of the column
     * @param record The current assessment record being created
     * @param json The current data row being manipulated *
     * @returns {String} A stringified json object of the assessment json mappings
     */
    function createAssessmentMapping(fieldDetails, record, json) {
        try {
            var mapObj, scoreObj, key;

            if (!record.hasOwnProperty("ASSESSMENT_JSON_MAPPINGS")) {
                mapObj = {};
                var adminObj = {};
                scoreObj = {};
                var scoreArray = [];
                var metadataObj = {};
                metadataObj.TESTS = {};
                mapObj.ADMIN_MAPPINGS = adminObj;
                mapObj.ASSESSMENT_METADATA = metadataObj;
                mapObj.SCORE_MAPPINGS = scoreArray;
                scoreArray.push(scoreObj);
                let currentTestNumber = null;

                for (key in fieldDetails) {
                    var dataRecord = json[fieldDetails[key].physicalName] !== null && json[fieldDetails[key].physicalName] !== undefined ? json[fieldDetails[key].physicalName].trim() : json[fieldDetails[key].physicalName];

                    if (!record.hasOwnProperty(key) && json.hasOwnProperty(fieldDetails[key].physicalName)) {
                        if (fieldDetails[key].physicalName.indexOf("XTBL_TEST_ADMIN") > -1) {
                            adminObj[fieldDetails[key].physicalName.substring(fieldDetails[key].physicalName.indexOf(".") + 1)] = dataRecord;
                        } else if (fieldDetails[key].physicalName.indexOf("XTBL_TEST_SCORES") > -1) {
                            if (fieldDetails[key].physicalName.indexOf("TEST_NUMBER") > -1 && !metadataObj.TESTS.hasOwnProperty(dataRecord)) {
                                currentTestNumber = dataRecord.toString();

                            }

                            scoreObj[fieldDetails[key].physicalName.substring(fieldDetails[key].physicalName.indexOf(".") + 1)] = dataRecord;
                        }
                        else if (fieldDetails[key].physicalName.indexOf("XTBL_TESTS") > -1) {
                            if (!metadataObj.TESTS.hasOwnProperty(currentTestNumber)) {
                                metadataObj.TESTS[currentTestNumber] = {};
                            }

                            if (fieldDetails[key].physicalName.indexOf("TEST_VENDOR") > -1 && testVendor.indexOf(dataRecord) === -1) {
                                testVendor.push(dataRecord);
                            }

                            if (fieldDetails[key].physicalName.indexOf("TEST_PRODUCT") > -1 && testProduct.indexOf(dataRecord) === -1) {
                                testProduct.push(dataRecord);
                            }

                            metadataObj.TESTS[currentTestNumber][fieldDetails[key].physicalName.substring(fieldDetails[key].physicalName.indexOf(".") + 1)] = dataRecord;
                        }
                    }
                }
            } else {
                mapObj = JSON.parse(record.ASSESSMENT_JSON_MAPPINGS);
                scoreObj = {};
                mapObj.SCORE_MAPPINGS.push(scoreObj);

                for (key in fieldDetails) {
                    if (!record.hasOwnProperty(key) && json.hasOwnProperty(fieldDetails[key].physicalName)) {
                        if (fieldDetails[key].physicalName.indexOf("XTBL_TEST_SCORES") > -1 && json[fieldDetails[key].physicalName] !== null) {
                            scoreObj[fieldDetails[key].physicalName.substring(fieldDetails[key].physicalName.indexOf(".") + 1)] = json[fieldDetails[key].physicalName].trim();
                        }
                    }
                }
            }

            return JSON.stringify(mapObj);

        } catch(exception) {
            throw "${_thisModuleName}.createAssessmentMapping Exception: ${exception}";
        }
    }


    /**
     * A data flow that processes a generic file and creates a normalized file
     *
     * @param file The generic file to be processed
     * @param signature The signature that maps the generic file
     */
    module.createNormalizedFile = function(file, signature) {
        try {
            var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
            var fieldDetails = _fileDetector.getFieldDetails(signature);
            var fieldObj = AppUtil.getSignatureFieldObject(signature);
            var lineNumber = 1, counter = 1;
            var resultsPath = AppUtil.getParentPath(file).replace("sources", "results");
            var signatureName = _fileDetector.getSignatureName(signature);
            var hierarchy = AppUtil.getParentPath(file).split("/");
            var previousRecord = null;
            var resultsFolder = _file.open(resultsPath);
            const filePath = file.getFilePath();

            if (!resultsFolder.exists()) {
                resultsFolder.createFolder();
            }

            _dataflow.create("NORMALIZE RECORD BUILD")
                .input("INPUT", _io.delim_input(file.getFilePath()))
                .transform("ADD LINEAGE FIELD", ["RECORDS"],
                    function (output, json) {
                        json.LINEAGE_LINE = (++lineNumber).toString();
                        output.RECORDS.put(json);
                    })
                .sort("INPUT-SORT", function (one, two) {
                    if (one[fieldDetails.DISTRICT_CODE.physicalName] > two[fieldDetails.DISTRICT_CODE.physicalName])
                        return 1;
                    else if (one[fieldDetails.DISTRICT_CODE.physicalName] < two[fieldDetails.DISTRICT_CODE.physicalName])
                        return -1;
                    else if (one[fieldDetails.DISTRICT_CODE.physicalName] === two[fieldDetails.DISTRICT_CODE.physicalName]) {
                        if (one[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName] > two[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName])
                            return 1;
                        else if (one[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName] < two[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName])
                            return -1;
                        else if (one[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName] === two[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName]) {
                            if (one[fieldDetails.TEST_ADMIN_DATE.physicalName] > two[fieldDetails.TEST_ADMIN_DATE.physicalName])
                                return 1;
                            else if (one[fieldDetails.TEST_ADMIN_DATE.physicalName] < two[fieldDetails.TEST_ADMIN_DATE.physicalName])
                                return -1;

                            return 0;
                        }
                    }
                })
                .transform("TRANSFORM", ["RECORDS"],
                    function (output, json) {
                        try {
                            var record = createNewRecord(normalizedFileFields);
                            ++counter;
                            var birthDateObj = AppUtil.getDateObj(json[fieldDetails.STUDENT_BIRTHDATE_STR.physicalName]);
                            var assessmentDateObj = AppUtil.getDateObj(json[fieldDetails.TEST_ADMIN_DATE.physicalName]);

                            if (previousRecord === null || json[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName] !== previousRecord.ASSESSMENT_ADMIN_KEY ||
                                previousRecord.TEST_ADMIN_DATE !== assessmentDateObj.STANDARD_DATE) {

                                if (previousRecord !== null) {
                                    output.RECORDS.put(previousRecord);
                                }

                                previousRecord = null;

                                if (AppUtil.isValidRecord(json, fieldObj)) {
                                    normalizedFileFields.forEach(function (field) {
                                        switch (field) {
                                            case "SYS_PARTITION_VALUE":
                                                record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                                                break;
                                            case "DISTRICT_CODE":
                                                record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  hierarchy.slice(-5)[0];
                                                break;
                                            case "ASSESSMENT_ADMIN_KEY":
                                                record.ASSESSMENT_ADMIN_KEY = json[fieldDetails.ASSESSMENT_ADMIN_KEY.physicalName];
                                                break;
                                            case "STUDENT_VENDOR_ID":
                                                record.STUDENT_VENDOR_ID = _util.coalesce(json[fieldDetails.STUDENT_VENDOR_ID.physicalName], json[fieldDetails.STUDENT_LOCAL_ID.physicalName], json[fieldDetails.STUDENT_STATE_ID.physicalName]);
                                                break;
                                            case "SCHOOL_YEAR":
                                                record.SCHOOL_YEAR = AppUtil.deriveSchoolYear(json[fieldDetails.TEST_ADMIN_DATE.physicalName]);
                                                break;
                                            case "TEST_ADMIN_DATE":
                                                record.TEST_ADMIN_DATE = assessmentDateObj.STANDARD_DATE;
                                                break;
                                            case "STUDENT_GRADE_CODE":
                                                record.STUDENT_GRADE_CODE = AppUtil.formatNumber(json[fieldDetails.STUDENT_GRADE_CODE.physicalName]);
                                                break;
                                            case "ASSESSMENT_VENDOR":
                                                record.ASSESSMENT_VENDOR = "hoonuit";
                                                break;
                                            case "ASSESSMENT_PRODUCT":
                                                record.ASSESSMENT_PRODUCT = signatureName;
                                                break;
                                            case "STUDENT_DOB_MONTH":
                                                record.STUDENT_DOB_MONTH = birthDateObj.MONTH;
                                                break;
                                            case "STUDENT_DOB_DAY":
                                                record.STUDENT_DOB_DAY = birthDateObj.DAY;
                                                break;
                                            case "STUDENT_DOB_YEAR":
                                                record.STUDENT_DOB_YEAR = birthDateObj.YEAR;
                                                break;
                                            case "REPORTING_PERIOD":
                                                record.REPORTING_PERIOD = (json[fieldDetails.REPORTING_PERIOD.physicalName] !== null && json[fieldDetails.REPORTING_PERIOD.physicalName] !== "" && json[fieldDetails.REPORTING_PERIOD.physicalName] !== undefined && json[fieldDetails.REPORTING_PERIOD.physicalName] !== "--") ? json[fieldDetails.REPORTING_PERIOD.physicalName] : hierarchy.slice(-3)[0];
                                                break;
                                            case "ASSESSMENT_JSON_MAPPINGS":
                                                record.ASSESSMENT_JSON_MAPPINGS = createAssessmentMapping(fieldDetails, record, json);
                                                break;
                                            default:
                                                if (fieldDetails[field] !== undefined) {
                                                    record[field] = json[fieldDetails[field].physicalName];
                                                }
                                                else {
                                                    record[field] = null;
                                                }

                                                break;
                                        }
                                    });

                                    record.LINEAGE_SOURCE = "hoonuit " + signatureName;
                                    record.LINEAGE_SIGNATURE = signatureName;
                                    record.LINEAGE_FILE = filePath;
                                    record.LINEAGE_LINE = json.LINEAGE_LINE;
                                }
                                else {
                                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",json.LINEAGE_LINE, "Required field is null or empty string", JSON.stringify(json)));
                                }
                                previousRecord = record;
                            }
                            else {
                                record = previousRecord;
                                record.LINEAGE_LINE = json.LINEAGE_LINE;
                                record.ASSESSMENT_JSON_MAPPINGS = createAssessmentMapping(fieldDetails, record, json);
                            }

                            if (counter === lineNumber) {
                                output.RECORDS.put(record);
                            }
                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, exception, JSON.stringify(json)));
                        }
                    })
                .set_active_path("RECORDS").output("RECORDS OUTPUT", _io.delim_output(resultsPath + file.getName() + ".normal", "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            if (testVendor.length === 0) {
                //Do nothing
            } else if (testVendor.length === 1) {
                AppAssessmentConfig.VENDOR_NAME = testVendor[0];
            } else {
                AppAssessmentConfig.VENDOR_NAME = testVendor;
            }

            if (testProduct.length === 0) {
                //Do nothing
            } else if (testProduct.length === 1) {
                AppAssessmentConfig.PRODUCT_NAME = testProduct[0];
            } else {
                AppAssessmentConfig.PRODUCT_NAME = testProduct;
            }

            _util.printInfo(`The generic test vendor is ${AppAssessmentConfig.VENDOR_NAME} and the test product is ${AppAssessmentConfig.PRODUCT_NAME}\n`);

            return resultsPath + file.getName() + ".normal";

        } catch(exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };

    /**
     * Merges district assessment normal files into 1 normal file
     *
     * @param file An assessment file in jesse file format
     */
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    return module;
}());
