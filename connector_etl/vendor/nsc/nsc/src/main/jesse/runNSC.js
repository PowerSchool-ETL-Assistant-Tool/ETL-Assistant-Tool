var AppNSC = (function() {
    let module = {};
    const _thisModuleName = "AppNSC";

    //Module global variables
    let districtCode, keyMatch, matchObject;

    const _DateTimeFormatter = Java.type("java.time.format.DateTimeFormatter");
    const _LocalDate = Java.type("java.time.LocalDate");

    /**
     * Helper function that parses data from filename where file name must be in format "{anything}YYYYMMDD{6characters}.csv" OR "{anything}YYYYMMDD{15characters}.csv"
     * If the file name does not match the pattern, the current date is returned
     *
     * @param fileName Name of the file
     * @returns {string} Date in MM/dd/CCYY format
     */
    function getFileDate(fileName) {
        try {
            let strDate, pattern;

            pattern = "yyyyMMdd";

            if (fileName.indexOf("EFFDT") > -1 && fileName.indexOf("RUNDT") > -1) {
                strDate = fileName.substring(fileName.indexOf("RUNDT") + 6, fileName.indexOf("RUNDT") + 14);
            } else if (fileName.substring(fileName.length() - 15, fileName.length() - 14) === "-") {
                strDate = fileName.substring(fileName.length() - 18, fileName.length() - 10);
            } else {
                let dateObject = new Date();
                strDate = `${dateObject.getFullYear()}${AppUtil.formatNumber(dateObject.getMonth() + 1)}${AppUtil.formatNumber(dateObject.getDate())}`;
            }

            return AppUtil.getDateObjByPattern(strDate, pattern).STANDARD_DATE;
        } catch(exception) {
            throw `${_thisModuleName}.getFileDate Exception: ${exception}`;
        }
    }

    /**
     * Checks for a valid date
     *
     * @param value A string date
     * @param pattern A java representation of a date/datetime pattern
     * @returns {boolean}
     */
    function isValidDate(value, pattern) {
        let isValid = true;
        const format = _DateTimeFormatter.ofPattern(pattern);
        try {
            _LocalDate.parse(value, format);
        } catch (e) {
            isValid = false;
        }

        return isValid;
    }

    /**
     * Helper function to remove underscores from a string
     *
     * @param value The String to process
     * @returns {*} The processed string
     */
    function removeUnderscore(value) {
        try {
            if (value === undefined || value === null) {
                return value;
            }
            else {
                return value.replace(/_/g, "");
            }
        } catch(exception) {
            throw `${_thisModuleName}.removeUnderscore Exception: ${exception}`;
        }
    }

    /**
     * Helper function to convert yyyymmdd to mm/dd/yyyy
     *
     * @param rawDateStr Date string to converted
     * @returns {*} Converted date
     */
    function convertYYYYMMDD_To_Date(rawDateStr) {
        try {
            let date;

            if (rawDateStr === undefined || rawDateStr === null || rawDateStr === "") {
                date = null;
            }
            else {
                date = rawDateStr.substring(4, 6) + '/' + rawDateStr.substring(6, 8) + '/' + rawDateStr.substring(0, 4);
            }

            return date;
        } catch(exception) {
            throw `${_thisModuleName}.convertYYYYMMDD_To_Date Exception: ${exception}`;
        }
    }

    /**
     * Helper function that derives school year from date
     *
     * @param rawDateStr Date string to converted
     * @returns {*} School Year
     */
    function convertYYYYMMDD_To_School_Year(rawDateStr) {
        try {
            let schoolYear;

            if (rawDateStr === undefined || rawDateStr === null || rawDateStr === "") {
                schoolYear = null;
            } else {
                const year = rawDateStr.substring(0, 4);
                const month = rawDateStr.substring(4, 6);

                if (month >= 9) {
                    schoolYear = year + '-' + ((year * 1) + 1);
                } else {
                    schoolYear = ((year * 1) - 1) + '-' + year;
                }
            }

            return schoolYear;
        } catch(exception) {
            throw `${_thisModuleName}.convertYYYYMMDD_To_School_Year Exception: ${exception}`;
        }
    }

    /**
     * Gets a list of school years from a file
     *
     * @param file
     * @returns {Array}
     */
    module.getFileSchoolYears = function(file) {
        try {
            const header = AppUtil.getFileHeader(file);
            const fileInput = _io.delim_input_ext(file, ",", "\"", "\\");
            let schoolYears = [];
            let gradeDateColumnHeader;

            if (header.indexOf("HIGH_SCHOOL_GRAD_DATE") > -1) {
                gradeDateColumnHeader = "HIGH_SCHOOL_GRAD_DATE";
            } else if (header.indexOf("High_School_Grad_Date") > -1) {
                gradeDateColumnHeader = "High_School_Grad_Date";
            } else if (header.indexOf("HIGH SCHOOL GRAD DATE") > -1) {
                gradeDateColumnHeader = "HIGH SCHOOL GRAD DATE";
            } else if (header.indexOf("HIGHSCHOOLGRADDATE") > -1) {
                gradeDateColumnHeader = "HIGHSCHOOLGRADDATE";
            }

            const gradDates = AppUtil.enumFileElements(fileInput, gradeDateColumnHeader);

            gradDates.forEach(function (date) {
                const schoolYear = convertYYYYMMDD_To_School_Year(date);

                if (schoolYears.indexOf(schoolYear) === -1) {
                    schoolYears.push(schoolYear);
                }
            });

            return schoolYears.sort();
        } catch(exception) {
            throw `${_thisModuleName}.getFileSchoolYears Exception: ${exception}`;
        }
    };

    /**
     * Processes the file to get/create school identities
     *
     * @param file The string path of the file being processed
     * @param DBPARAMS JSON object of database parameters
     */
    module.processSchools = function(file, DBPARAMS) {
        const schoolSQL = AppUtil.getSqlWithRuntimeFilter(AppUtil.getStrFromFile(`${BASE_APP_SCRIPT_PATH}/assessment_framework/sourceFiles/schoolInput.sql`));
        const schoolInput = _io.database_input(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, schoolSQL);
        const schoolObj = AppDataflow.getDataSet(schoolInput, "SCHOOL_VENDOR_ID", "SCHOOL MATCHING");
        const entryRecords = AppSchoolMatching.createSchoolMatchingDataSet(schoolObj);
        const matchEngine = AppMatching.initializeMatchEngine(AppMatching.domainFile(), AppSchoolMatching.domainName(), entryRecords);
        const choices = AppMatching.getChoices(matchEngine, AppSchoolMatching.domainName(), AppSchoolMatching.planName());
        let schoolIdentityObject = {};
        AppValidateSchoolInfo.getSchoolIdentities(DBPARAMS);

        _dataflow.create("PROCESS NSC FILE FOR SCHOOL IDENTITIES")
            .input("INPUT", _io.delim_input_ext(file, ",", "\"", "\\"))
            .output("EXTRACTING SCHOOL INFORMATION",
                function (json) {
                    const schoolCode = _util.coalesce(json["HIGH_SCHOOL_CODE"], json["High_School_Code"]);

                    if (!schoolIdentityObject.hasOwnProperty(schoolCode)) {
                        _util.println(`No existing match found for school code ${schoolCode}, searching for school identity records`)
                        const schoolRecord = {
                            SYS_PARTITION_VALUE: _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE),
                            DISTRICT_CODE: districtCode,
                            SCHOOL_LOCAL_ID: "",
                            SCHOOL_STATE_ID: "",
                            SCHOOL_FEDERAL_ID: "",
                            SCHOOL_VENDOR_ID: schoolCode,
                            SCHOOL_NAME: ""
                        };

                        schoolIdentityObject[schoolCode] = AppValidateSchoolInfo.searchSchoolRecords(schoolRecord, DBPARAMS, matchEngine, choices);
                    }
                })
            .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

        return schoolIdentityObject;
    };

    /**
     *  Creates a temp student identity table with source data from the file being processed
     *
     * @param file The string path of the file being processed
     * @param DBPARAMS JSON object of database parameters
     */
    module.createNSCTempIdentities = function(file, DBPARAMS, schoolIdentities) {
        var uniqueIds = {};
        var tempTable = AppUtil.getStrFromFile(`${BASE_APP_SCRIPT_PATH}/assessment_framework/sourceFiles/studentsIdentityTemp.sql`);
        AppUtil.executeSqlOnDb(tempTable, DBPARAMS);

        _dataflow.create("GATHERING INFO FOR TEMP STUDENT")
            .input("INPUT", _io.delim_input_ext(file, ",", "\"", "\\"))
            .transform("EXTRACTING TEMP STUDENTS", ["RECORDS"],
                function (output, json) {
                    const uniqueID = _util.coalesceEmptyString(json["YOUR_UNIQUE_IDENTIFIER"], json["YOUR UNIQUE IDENTIFIER"], json["YOURUNIQUEIDENTIFIER"], json["Your_Unique_Identifier"]
                        , json["REQUESTER_RETURN_FIELD"], json["REQUESTER RETURN FIELD"], json["REQUESTERRETURNFIELD"], json["REQ_RETURN_FIELD"]);
                    if (uniqueID !== null) {
                        const studentID = removeUnderscore(uniqueID);
                        const schoolCode = _util.coalesce(json["HIGH_SCHOOL_CODE"], json["High_School_Code"]);

                        const rec = {
                            STUDENT_IDENTITY_UUID: "00000000-0000-0000-0000-000000000000",
                            IDENTITY_NAMESPACE: "GLOBAL",
                            SOURCE_TENANT_CODE: _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.SYS_PARTITION_VALUE),
                            SOURCE_STUDENT_ID: studentID,
                            SOURCE_STATE_STUDENT_ID: studentID,
                            SOURCE_FIRST_NAME: _util.coalesceEmptyString(json["FIRST_NAME"], json["FIRST NAME"], json["FIRSTNAME"], json["First_Name"]),
                            SOURCE_MIDDLE_NAME: _util.coalesceEmptyString(json["MIDDLE_NAME"], json["MIDDLE NAME"], json["MIDDLENAME"], json["MI"], json["Middle_Name"]),
                            SOURCE_LAST_NAME: _util.coalesceEmptyString(json["LAST_NAME"], json["LAST NAME"], json["LASTNAME"], json["Last_Name"]),
                            SOURCE_PREFERRED_FIRST_NAME: "--",
                            SOURCE_PREFERRED_LAST_NAME: "--",
                            SOURCE_BIRTH_MONTH: "--",
                            SOURCE_BIRTH_DAY: "--",
                            SOURCE_BIRTH_YEAR: "--",
                            SOURCE_STREET_ADDRESS: "--",
                            SOURCE_CITY: "--",
                            SOURCE_STATE_CODE: "--",
                            SOURCE_POSTAL_CODE: "--",
                            SOURCE_SCHOOL_YEAR: convertYYYYMMDD_To_School_Year(_util.coalesceEmptyString(json["HIGH_SCHOOL_GRAD_DATE"], json["HIGH SCHOOL GRAD DATE"], json["HIGHSCHOOLGRADDATE"], json["High_School_Grad_Date"])),
                            SOURCE_GRADE_CODE: "12",
                            SOURCE_SCHOOL_CODE: schoolIdentities[schoolCode].MAPPED_DISTRICT_SCHOOL_CODE,
                            MAPPED_STUDENT_ID: "--",
                            MAPPED_STATE_STUDENT_ID: "--",
                            MAPPED_SCHOOL_CODE: "--",
                            MAPPED_DISTRICT_CODE: "--",
                            IDENTITY_MAPPING_TYPE: "--",
                            IDENTITY_MATCH_CHOICE: "--",
                            IDENTITY_MATCH_QUALITY: "--",
                            IDENTITY_MATCH_SCORE: 0,
                            APPROVE_FOR_ETL: "N",
                            MOD_USER: "--",
                            MOD_DATE: "1/1/1900",
                            SYS_PARTITION_VALUE: _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
                        };

                        if (!uniqueIds.hasOwnProperty(uniqueID)) {
                            uniqueIds[uniqueID] = rec;
                            output.RECORDS.put(rec);
                        }
                    }
                })
            .output("TEMP STUDENT OUTPUT", _io.delim_output("${AssessmentLoader.config.APP_PATH}${AssessmentLoader.config.TEMP_FOLDER}/tempStudents.txt", "\t", "\"", "\\", false))
            .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

       AppUtil.executeBulkLoadOnDb(`${AssessmentLoader.config.APP_PATH}${AssessmentLoader.config.TEMP_FOLDER}/tempStudents.txt`, `K12INTEL_ASSESSMENT`, `_ASSESSMENT_STUDENT_IDENTITY_${AppAudit.getCurrentBatchId()}_${AssessmentLoader.config.SYS_PARTITION_VALUE}`, DBPARAMS);
    };


    /**
     *  Executes the student matching process for a distinct list of students
     *
     * @param file The normal file that is being processed in the assessment flow
     * @param DBPARAMS Database parameters to access XTBL_ENTITIES
     * @param schoolIdentities JSON object of school identity information
     * @returns {{}} Object of matched students
     */
    module.matchStudents = function(file, DBPARAMS, schoolIdentities) {
        try {
            const studentArray = [], newIdentities = {};
            keyMatch = {};

            // Profile data and check if identity already created
            module.createNSCTempIdentities(file, DBPARAMS, schoolIdentities);
            AppValidateStudentInfo.getStudentIdentities(DBPARAMS);
            const studentIdentityRecords = AppValidateStudentInfo.getStudentIdentityRecords();

            _dataflow.create("PREPARE NSC FILE FOR MATCHING")
                .input("INPUT", _io.delim_input_ext(file, ",", "\"", "\\"))
                .transform("ADD LINEAGE FIELD", ["RECORDS"],
                    function (output, json) {
                        const uniqueID = _util.coalesceEmptyString(json["YOUR_UNIQUE_IDENTIFIER"], json["YOUR UNIQUE IDENTIFIER"], json["YOURUNIQUEIDENTIFIER"], json["Your_Unique_Identifier"]
                            , json["REQUESTER_RETURN_FIELD"], json["REQUESTER RETURN FIELD"], json["REQUESTERRETURNFIELD"], json["REQ_RETURN_FIELD"]);

                        if (uniqueID !== null) {
                            const studentID = removeUnderscore(uniqueID);
                            const schoolCode = _util.coalesce(json["HIGH_SCHOOL_CODE"], json["High_School_Code"]);
                            const matchStudent = {
                                //Populating fields for matching
                                SYS_PARTITION_VALUE : _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE),
                                STUDENT_LOCAL_ID: studentID,
                                STUDENT_STATE_ID: studentID,
                                STUDENT_FIRST_NAME: _util.coalesceEmptyString(json["FIRST_NAME"], json["FIRST NAME"], json["FIRSTNAME"], json["First_Name"]),
                                STUDENT_MIDDLE_NAME: _util.coalesceEmptyString(json["MIDDLE_NAME"], json["MIDDLE NAME"], json["MIDDLENAME"], json["MI"], json["Middle_Name"]),
                                STUDENT_LAST_NAME: _util.coalesceEmptyString(json["LAST_NAME"], json["LAST NAME"], json["LASTNAME"], json["Last_Name"]),
                                STUDENT_PREFERRED_FIRST_NAME: "--",
                                STUDENT_PREFERRED_LAST_NAME: "--",
                                STUDENT_DOB_MONTH: "--",
                                STUDENT_DOB_DAY: "--",
                                STUDENT_DOB_YEAR: "--",
                                STUDENT_STREET_ADDRESS: "--",
                                STUDENT_CITY: "--",
                                STUDENT_STATE_CODE: "--",
                                STUDENT_POSTAL_CODE: "--",
                                STUDENT_GRADE_CODE: "12",
                                SCHOOL_YEAR: convertYYYYMMDD_To_School_Year(_util.coalesceEmptyString(json["HIGH_SCHOOL_GRAD_DATE"], json["HIGH SCHOOL GRAD DATE"], json["HIGHSCHOOLGRADDATE"], json["High_School_Grad_Date"])),
                                SCHOOL_LOCAL_ID : schoolIdentities[schoolCode].MAPPED_DISTRICT_SCHOOL_CODE === undefined ? null : schoolIdentities[schoolCode].MAPPED_DISTRICT_SCHOOL_CODE,
                                DISTRICT_CODE : districtCode
                            };

                            const student = AppValidateStudentInfo.createSource(matchStudent);
                            const key = AppValidateStudentInfo.createKey(student);

                            if (!keyMatch.hasOwnProperty(uniqueID)) {
                                keyMatch[uniqueID] = key;
                            }

                            if (!studentIdentityRecords.hasOwnProperty(key) && !newIdentities.hasOwnProperty(key)) {
                                matchStudent.KEY = key;
                                newIdentities[key] = student;
                                output.RECORDS.put(matchStudent);
                            }
                        }
                    })
                .output("MATCH OBJECT OUTPUT", function (json) {
                    studentArray.push(json);
                })
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            if (Object.keys(newIdentities).length > 0) {
                /** Load files required for matching **/
                const schoolYears = module.getFileSchoolYears(file);
                const enrollmentSQL = AppUtil.getSqlWithRuntimeFilter(AppUtil.filterEnrollmentQuery(AppUtil.getStrFromFile(`${BASE_APP_SCRIPT_PATH}/assessment_framework/sourceFiles/enrollmentInput.sql`), schoolYears[0], schoolYears.slice(-1)[0]));
                const studentSQL = AppUtil.getSqlWithRuntimeFilter(AppUtil.getStrFromFile(`${BASE_APP_SCRIPT_PATH}/assessment_framework/sourceFiles/studentsInput.sql`));

                /** Create jesse file inputs from files **/
                const enrollmentsInput = _io.database_input(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, enrollmentSQL);
                const studentsInput = _io.database_input(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, studentSQL);

                const enrollments = AppDataflow.getDataSet(enrollmentsInput, "STUDENT_KEY", "ENROLLMENTS");
                const students = AppDataflow.getDataSet(studentsInput, "STUDENT_KEY", "STUDENTS");
                const enrollmentsObj = AppStudentMatching.organizeEnrollments(enrollments);
                const studentRecords = AppStudentMatching.createStudentMatchingDataSet(students, enrollmentsObj);

                const matchEngine = AppMatching.initializeMatchEngine(AppMatching.domainFile(), AppStudentMatching.domainName(), studentRecords);
                const choices = AppMatching.getChoices(matchEngine, AppStudentMatching.domainName(), AppStudentMatching.planName());
                const returnAttributes = ["STUDENT_ID", "FIRST_NAME", "LAST_NAME", "BIRTH_DATE", "ENROLLMENT"];

                matchObject = AppStudentMatching.matchStudents(studentArray, matchEngine, AppStudentMatching.domainName(), AppStudentMatching.planName(), returnAttributes, choices);
                AppValidateStudentInfo.setMatchObj(matchObject);
                AppValidateStudentInfo.setNewIdentities(newIdentities);
                AppValidateStudentInfo.addStudentIdentity(DBPARAMS);
            }
        } catch(exception) {
            throw `${_thisModuleName}.matchStudents Exception: ${exception}`;
        }
    };

    /**
     * Processes a NSC file to load into database
     *
     * @param path to NSC project
     * @param file The NSC file being loaded opened by jesse
     * @param DBPARAMS Database parameters to access XTBL_ENTITIES
     * @param text The text from the version file
     */
    module.processNSCFile = function(path, file, DBPARAMS, text) {
        try {
            const versionText = text.replaceAll("\n", "");
            const version = versionText.substring(versionText.indexOf("Version: ") + 9, versionText.indexOf("Application-name"));
            districtCode = AssessmentLoader.config.DISTRICT_CODE;
            const delSql = AppUtil.getStrFromFile(`${path}jesse/sourceFiles/deleteResponse.sql`);
            AppUtil.executeSqlOnDb(delSql, DBPARAMS);
            const schoolIdentities = module.processSchools(file.getFilePath(), DBPARAMS);
            module.matchStudents(file.getFilePath(), DBPARAMS, schoolIdentities);
            AppValidateStudentInfo.getStudentIdentities(DBPARAMS);
            const studentIdentities = AppValidateStudentInfo.getStudentIdentityRecords();
            let lineNumber = 1;
            const resultsFolder = _file.open(AppUtil.getParentPath(file).replace("sources", "results"));
            const fileDate = getFileDate(file.getName());

            if (!resultsFolder.exists()) {
                resultsFolder.createFolder();
            }

            _dataflow.create("Process NSC File")
                .input("INPUT", _io.delim_input_ext(file.getFilePath(), ",", "\"", "\\"))
                .transform("ADD LINEAGE FIELD", ["RECORDS"],
                    function (output, json) {

                        json.LINEAGE_LINE = (++lineNumber).toString();

                        output.RECORDS.put(json);
                    })
                .transform("PREPARE RECORDS FOR LOADING", ["RECORDS", "REJECTS", "FILE"],
                    function (output, json) {
                        try {
                            const uniqueID = _util.coalesceEmptyString(json["YOUR_UNIQUE_IDENTIFIER"], json["YOUR UNIQUE IDENTIFIER"], json["YOURUNIQUEIDENTIFIER"], json["Your_Unique_Identifier"]
                                , json["REQUESTER_RETURN_FIELD"], json["REQUESTER RETURN FIELD"], json["REQUESTERRETURNFIELD"], json["REQ_RETURN_FIELD"], json["Requester_Return_Field"]);
                            const schoolCode = _util.coalesceEmptyString(json["HIGH_SCHOOL_CODE"], json["High_School_Code"], json["HighSchoolCode"], json["High_School_Code"]);

                            if (uniqueID === null) {
                                _util.printException(JSON.stringify(json) + "\n");
                                throw "Unique Identifier is null.";
                            }
                            if (AssessmentLoader.config.ENABLE_DEBUG) {
                                _util.printInfo(`Matching information for student keyMatch[${uniqueID}]: ${keyMatch[uniqueID]}\nMatching information for schoolIdentities[${schoolCode}]\n`);
                                _util.printWarning(JSON.stringify(schoolIdentities[schoolCode]) + "\n\n");
                                _util.printWarning(JSON.stringify(studentIdentities[keyMatch[uniqueID]]) + "\n\n");
                            }

                            var rec = {
                                STAGE_SOURCE: `NSC ${version}`,
                                STAGE_FILEDATE: fileDate,
                                DISTRICT_CODE: _util.coalesceEmptyString(schoolIdentities[schoolCode].MAPPED_DISTRICT_CODE, districtCode),
                                SCHOOL_IDENTITY_UUID : schoolIdentities[schoolCode].SCHOOL_IDENTITY_UUID,
                                STUDENT_IDENTITY_UUID : studentIdentities[keyMatch[uniqueID]],
                                SCHOOL_YEAR: convertYYYYMMDD_To_School_Year(_util.coalesceEmptyString(json["HIGH_SCHOOL_GRAD_DATE"], json["HIGH SCHOOL GRAD DATE"], json["HIGHSCHOOLGRADDATE"], json["High_School_Grad_Date"])),
                                YOUR_UNIQUE_IDENTIFIER: uniqueID,
                                FIRST_NAME: _util.coalesceEmptyString(json["FIRST_NAME"], json["FIRST NAME"], json["First_Name"]),
                                MIDDLE_NAME: _util.coalesceEmptyString(json["MIDDLE_NAME"], json["MIDDLE NAME"], json["MIDDLENAME"], json["MI"], json["Middle_Name"]),
                                LAST_NAME: _util.coalesceEmptyString(json["LAST_NAME"], json["LAST NAME"], json["Last_Name"]),
                                NAME_SUFFIX: _util.coalesceEmptyString(json["NAME_SUFFIX"], json["NAME SUFFIX"], json["NAMESUFFIX"], json["SUFFIX"], json["Name_Suffix"]),
                                REQUESTER_RETURN_FIELD: _util.coalesceEmptyString(json["REQUESTER_RETURN_FIELD"], json["REQUESTER RETURN FIELD"], json["REQUESTERRETURNFIELD"], json["REQ_RETURN_FIELD"], json["Requester_Return_Field"]),
                                RECORD_FOUND_FLAG: _util.coalesceEmptyString(json["RECORD_FOUND_Y/N"], json["RECORD FOUND Y/N"], json["RECORDFOUNDY/N"], json["RECORD_FOUND"], json["Record_Found_Y/N"]),
                                SEARCH_DATE: _util.coalesceEmptyString(json["SEARCH_DATE"], json["SEARCHDATE"]),
                                COLLEGE_CODE_BRANCH: _util.coalesceEmptyString(json["COLLEGE_CODE/BRANCH"], json["COLLEGE CODE/BRANCH"], json["COLLEGECODE/BRANCH"], json["COLLEGE_CODE"], json["College_Code/Branch"]),
                                COLLEGE_NAME: _util.coalesceEmptyString(json["COLLEGE_NAME"], json["COLLEGE NAME"], json["COLLEGENAME"], json["College_Name"]),
                                COLLEGE_STATE: _util.coalesceEmptyString(json["COLLEGE_STATE"], json["COLLEGE STATE"], json["COLLEGESTATE"], json["College_State"]),
                                "2_OR_4_YEAR": _util.coalesceEmptyString(json["2-YEAR/4-YEAR"], json["2-YEAR / 4-YEAR"], json["A2OR4YEAR"], json["2-Year/4-Year"]),
                                PUBLIC_PRIVATE: _util.coalesceEmptyString(json["PUBLIC/PRIVATE"], json["PUBLIC / PRIVATE"], json["PUBLIC_PRIVATE"], json["Public/Private"]),
                                ENROLLMENT_BEGIN: convertYYYYMMDD_To_Date(_util.coalesceEmptyString(json["ENROLLMENT_BEGIN"], json["ENROLLMENT BEGIN"], json["ENROLLMENTBEGIN"], json["ENROLL_BEGIN"], json["Enrollment_Begin"])),
                                ENROLLMENT_END: convertYYYYMMDD_To_Date(_util.coalesceEmptyString(json["ENROLLMENT_END"], json["ENROLLMENT END"], json["ENROLLMENTEND"], json["Enrollment_End"])),
                                ENROLLMENT_STATUS: _util.coalesceEmptyString(json["ENROLLMENT_STATUS"], json["ENROLLMENT STATUS"], json["ENROLLMENTSTATUS"], json["ENROLL_STATUS"], json["Enrollment_Status"]),
                                CLASS_LEVEL: _util.coalesceEmptyString(json["CLASS_LEVEL"], json["CLASS LEVEL"], json["CLASSLEVEL"]),
                                ENROLLMENT_MAJOR_1: _util.coalesceEmptyString(json["ENROLLMENT_MAJOR_1"], json["ENROLLMENT MAJOR 1"], json["ENROLLMENTMAJOR1"]),
                                ENROLLMENT_CIP_1: _util.coalesceEmptyString(json["ENROLLMENT_CIP_1"], json["ENROLLMENT CIP 1"], json["ENROLLMENTCIP1"]),
                                ENROLLMENT_MAJOR_2: _util.coalesceEmptyString(json["ENROLLMENT_MAJOR_2"], json["ENROLLMENT MAJOR 2"], json["ENROLLMENTMAJOR2"]),
                                ENROLLMENT_CIP_2: _util.coalesceEmptyString(json["ENROLLMENT_CIP_2"], json["ENROLLMENT CIP 2"], json["ENROLLMENTCIP2"]),
                                GRADUATED: _util.coalesceEmptyString(json["GRADUATED"], json["GRADUATED?"], json["GRADUATE"], json["Graduated"]),
                                GRADUATION_DATE: convertYYYYMMDD_To_Date(_util.coalesceEmptyString(json["GRADUATION_DATE"], json["GRADUATION DATE"], json["GRADUATIONDATE"], json["GRAD_DATE"], json["Graduation_Date"])),
                                DEGREE_TITLE: _util.coalesceEmptyString(json["DEGREE_TITLE"], json["DEGREE TITLE"], json["DEGREETITLE"], json["Degree_Title"]),
                                DEGREE_MAJOR_1: _util.coalesceEmptyString(json["MAJOR"], json["DEGREE_MAJOR_1"], json["DEGREE MAJOR 1"], json["DEGREEMAJOR1"], json["Major"]),
                                DEGREE_CIP_1: _util.coalesceEmptyString(json["DEGREE_CIP_1"], json["DEGREE CIP 1"], json["DEGREECIP1"]),
                                DEGREE_MAJOR_2: _util.coalesceEmptyString(json["DEGREE_MAJOR_2"], json["DEGREE MAJOR 2"], json["DEGREEMAJOR2"]),
                                DEGREE_CIP_2: _util.coalesceEmptyString(json["DEGREE_CIP_2"], json["DEGREE CIP 2"], json["DEGREECIP2"]),
                                DEGREE_MAJOR_3: _util.coalesceEmptyString(json["DEGREE_MAJOR_3"], json["DEGREE MAJOR 3"], json["DEGREEMAJOR3"]),
                                DEGREE_CIP_3: _util.coalesceEmptyString(json["DEGREE_CIP_3"], json["DEGREE CIP 3"], json["DEGREECIP3"]),
                                DEGREE_MAJOR_4: _util.coalesceEmptyString(json["DEGREE_MAJOR_4"], json["DEGREE MAJOR 4"], json["DEGREEMAJOR4"]),
                                DEGREE_CIP_4: _util.coalesceEmptyString(json["DEGREE_CIP_4"], json["DEGREE CIP 4"], json["DEGREECIP4"]),
                                COLLEGE_SEQUENCE: _util.coalesceEmptyString(json["COLLEGE_SEQUENCE"], json["COLLEGE SEQUENCE"], json["COLLEGESEQUENCE"], json["COLLEGE_SEQ"], json["College_Sequence"]),
                                SYS_LINEAGE: file.getFilePath() + " : " + json.LINEAGE_LINE,
                                SYS_PARTITION_VALUE: _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
                            };

                            if (AssessmentLoader.config.ENABLE_DEBUG) {
                                _util.printSuccess(JSON.stringify(rec) + "\n")
                            }

                            if (rec.SCHOOL_IDENTITY_UUID === undefined || rec.SCHOOL_IDENTITY_UUID === null || rec.SCHOOL_IDENTITY_UUID.trim() === "") {
                                throw "The school identity process resulted in no UUID"
                            }

                            if (rec.STUDENT_IDENTITY_UUID === undefined || rec.STUDENT_IDENTITY_UUID === null || rec.STUDENT_IDENTITY_UUID.trim() === "") {
                                throw "The student identity process resulted in no UUID"
                            }

                            output.RECORDS.put(rec);
                            output.FILE.put(rec);
                        } catch (exception) {
                            if (AssessmentLoader.config.ENABLE_DEBUG) {
                                _util.printException(exception + "\n")
                            }
                            output.REJECTS.put(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, exception, json));
                        }
                    })
                .set_active_path('RECORDS').output("DATABASE OUTPUT", _io.database_output(DBPARAMS.CONN_STR, DBPARAMS.USERNAME, DBPARAMS.PWD, "K12INTEL_STAGING", "NSC_RESPONSE"))
                .set_active_path('FILE').output("FILE OUTPUT", _io.delim_output(file.getFilePath().replace("sources", "results") + ".normal", "\t", "\"", "\\", false))
                .set_active_path('REJECTS').output("REJECT OUTPUT", _io.delim_output(file.getFilePath().replace("sources", "results") + ".rejects", "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);
        } catch(exception) {
            throw `${_thisModuleName}.processNSCFile Exception: ${exception}`;
        }
    };

    /**
     * Run method for NSC loader
     *
     * @param file The NSC file that will be loaded
     */
    module.run = function(file) {
        var DBPARAMS;
        try {
            AppAudit.deriveBatchName(file);
            //module.config.TEMP_FOLDER = `${AppAudit.getCurrentBatchId()}_temp`;
            var path = AssessmentLoader.config.APP_PATH + AssessmentLoader.config.TEMP_FOLDER;
           // var tempPath = AssessmentLoader.config.TEMP_FOLDER;
            DBPARAMS = AssessmentLoader.config.UTL_CONFIG.DB_TARGET.DATABASE;
            var versionText = AppUtil.getStrFromFile(`${path}/resource/etc/VERSION.txt`);
            load(`${path}/jesse/LoadEntities.js`);
            load(`${path}/resource/etc/config.js`);

            const dateDifference = AppNSCEntities.checkDateDifference(`${path}/`, DBPARAMS);

            if (dateDifference < 14) {
                _util.printInfo("The majority of entities less then 2 weeks old.  Bypassing entity lookup with data.gov\n");
            } else {
                _util.printInfo(`The majority of entities are ${dateDifference} days old.  Performing entity lookup with data.gov\n`);
                var keymap = AppNSCEntities.getXtblEntityData("${path}/", DBPARAMS);
                var firstLoad = Object.keys(keymap).length === 0;

                if (firstLoad) {
                    keymap = AppNSCEntities.getFileEntityData(`${path}/resource/vendor_data/entities.csv`);
                }

                AppNSCEntities.getEntityData(`${path}/resource/vendor_data/entities.csv`);
                AppNSCEntities.checkEntityData(`${path}/resource/vendor_data/entities.csv`, DBPARAMS, keymap);
            }
            AppValidateStudentInfo.dropTempTable(DBPARAMS);
            module.processNSCFile(`${path}/`,file, DBPARAMS, versionText);
        } catch(exception) {
            throw `${_thisModuleName}.run Exception: ${exception}`;
        } finally {
            AppValidateStudentInfo.dropTempTable(DBPARAMS);
        }
    };

    return module;
}());
