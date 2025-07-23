var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AzMERIT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    //added from loader
    // var xtblSchoolControlManager;
    // var sdfVFXTBL = new java.text.SimpleDateFormat('MM/dd/yyyy');


    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");
            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();

            _dataflow.create("RECORD BUILD")
                .input("INPUT", AppUtil.getInputDataflow(file, signature))
                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

                    json.LINEAGE_FILE = fileFullName;
                    json.LINEAGE_LINE = (++lineNumber).toString();
                    output.RECORDS.put(json);
                })
                .group_by("ADMINISTRATION GROUPING", function (one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function (output, rows) {
                    try {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function (file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/
    //uplift
    var scoresToMap = [
        { TEST: "AZMERIT", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZMERIT", CODE: "MA", FIELD: "MA", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZMERIT", CODE: "EOC", FIELD: "EOC", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZMERIT", CODE: "EOC_GEO", FIELD: "Geometry", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZMERIT", CODE: "EOC_ALG", FIELD: "Algebra", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZMERIT", CODE: "MIXED", FIELD: "ELA", MAP_FUNCTION: mapSubjectScore },
        { TEST: "AZMERIT", CODE: "MIXED", FIELD: "MATH", MAP_FUNCTION: mapSubjectScore }
    ];

    //added from loader
    var subscoresToMap = [
        //might have to interchange field and test
        { TEST: "AZMERIT", CODE: "ELARIPL", FIELD: "READING_FOR_INFORMATION_PERFORMANCE_LEVEL", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "ELARLPL", FIELD: "READING_FOR_LITERATURE_PERFORMANCE_LEVEL", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "ELAWLPL", FIELD: "WRITING_AND_LANGUAGE_PERFORMANCE_LEVEL", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "ELAPFOS", FIELD: "STATEMENT_OF_PURPOSE_FOCUS_AND_ORGANIZATION_SCORE", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "ELAEES", FIELD: "EVIDENCE_AND_ELABORATION_SCORE", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "ELACES", FIELD: "CONVENTIONS_AND_EDITING_SCORE", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAOATN", FIELD: "OPERATIONS_ALGEBRAIC_THINKING_AND_NUMBERS_IN_BASE_TEN_PERFORMANCE_LEVEL_3_4_5", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MANOFPL", FIELD: "NUMBERS_AND_OPERATIONS_FRACTIONS_PERFORMANCE_LEVEL_3_4_5", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAMDGPL", FIELD: "MEASUREMENT_DATA_AND_GEOMETRY_PERFORMANCE_LEVEL_3_4_5", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MARPRPL", FIELD: "RATIO_AND_PROPORTIONAL_RELATIONSHIPS_PERFORMANCE_LEVEL_6_7", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MANSPL", FIELD: "THE_NUMBER_SYSTEM_PERFORMANCE_LEVEL_6_7", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAEEPL", FIELD: "EXPRESSIONS_AND_EQUATIONS_PERFORMANCE_LEVEL_6_7_8", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAGSPPL", FIELD: "GEOMETRY_STATISTICS_AND_PROBABILITY_PERFORMANCE_LEVEL_6_7", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAFPL", FIELD: "FUNCTIONS_PERFORMANCE_LEVEL_8_ALG_I_ALG_II", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAFPL8TO10", FIELD: "FUNCTIONS_PERFORMANCE_LEVEL_8_10", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAGPL", FIELD: "GEOMETRY_PERFORMANCE_LEVEL_8", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MASPNSPL", FIELD: "STATISTICS_AND_PROBABILITY_AND_THE_NUMBER_SYSTEM_PERFORMANCE_LEVEL_8", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAAPL", FIELD: "ALGEBRA_PERFORMANCE_LEVEL_ALG_I_ALG_II", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAAPL10", FIELD: "ALGEBRA_PERFORMANCE_LEVEL_10", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MASPL", FIELD: "STATISTICS_PERFORMANCE_LEVEL_ALG_I_ALG_II", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MASPL10", FIELD: "STATISTICS_PERFORMANCE_LEVEL_10", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MACPL", FIELD: "CONGRUENCE_PERFORMANCE_LEVEL_GEO", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MACPL10", FIELD: "CONGRUENCE_PERFORMANCE_LEVEL_10", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MASRTTPL", FIELD: "SIMILARITY_RIGHT_TRIANGLES_AND_TRIGONOMETRY_PERFORMANCE_LEVEL_GEO", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MASRTTPL10", FIELD: "SIMILARITY_RIGHT_TRIANGLES_AND_TRIGONOMETRY_PERFORMANCE_LEVEL_10", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MACGMGPEPL", FIELD: "CIRCLES_GEOMETRIC_MEASUREMENT_AND_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_PERFORMANCE_LEVEL_GEO", MAP_FUNCTION: mapSubScore },
        { TEST: "AZMERIT", CODE: "MAMGPL", FIELD: "GEOMETRIC_PROPERTIES_WITH_EQUATIONS_PERFORMANCE_LEVEL_GEO", MAP_FUNCTION: mapSubScore }

    ]

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    //uplift
    var decodeStudentGrade = {
        "1": "01"
        , "01": "01"
        , "2": "02"
        , "02": "02"
        , "3": "03"
        , "03": "03"
        , "4": "04"
        , "04": "04"
        , "5": "05"
        , "05": "05"
        , "6": "06"
        , "06": "06"
        , "7": "07"
        , "07": "07"
        , "8": "08"
        , "08": "08"
        , "9": "09"
        , "09": "09"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , "KG": "KG"
        , "K": "KG"
        , null: null
        , "": null
    };


    var SSPerformanceDecodes = {
        "1": { TEXT: "Minimally Proficient", PASS_IND: 'No' },
        "2": { TEXT: "Partially Proficient", PASS_IND: 'No' },
        "3": { TEXT: "Proficient", PASS_IND: 'Yes' },
        "4": { TEXT: "Highly Proficient", PASS_IND: 'Yes' },
        "MP": { TEXT: "Minimally Proficient", PASS_IND: 'No' },
        "PP": { TEXT: "Partially Proficient", PASS_IND: 'No' },
        "P": { TEXT: "Proficient", PASS_IND: 'Yes' },
        "HP": { TEXT: "Highly Proficient", PASS_IND: 'Yes' },
        "Minimally Proficient": { TEXT: "Minimally Proficient", PASS_IND: 'No' },
        "Partially Proficient": { TEXT: "Partially Proficient", PASS_IND: 'No' },
        "Proficient": { TEXT: "Proficient", PASS_IND: 'Yes' },
        "Highly Proficient": { TEXT: "Highly Proficient", PASS_IND: 'Yes' },
        "INC": { TEXT: "Incomplete"},
        null: { TEXT: null, PASS_IND: "No" },
        "": { TEXT: null, PASS_IND: "No" },
        undefined: { TEXT: null, PASS_IND: "No" }
    };


    var SSPerformanceEncode = {
        "1": "1",
        "2": "2",
        "3": "3",
        "4": "4",
        "MP": "MP",
        "PP": "PP",
        "P": "P",
        "HP": "HP",
        "Minimally Proficient": "MP",
        "Partially Proficient": "PP",
        "Proficient": "P",
        "Highly Proficient": "HP",
        "INC" : "INC"
    };


    var NonNumericDecodes = {
        'A': "Blank",
        'CM': "Prompt Copy Match",
        'DT': "Duplicate Text",
        'INC': "Incomplete",
        'INV': "Invalidated",
        'NE': "Not Enough Data",
        'NS': "Non-Specific",
        'BM': "below mastery",
        'NM': "at/near mastery",
        'AM': "above mastery",
        "": null,
        null: null
    };

    //not sure how to uplift this
    var NormalStrandPerformanceDecodes = {
        '1': { TEXT: 'Below Mastery', PASS_IND: 'No' },
        '2': { TEXT: 'At/Near Mastery', PASS_IND: 'Yes' },
        '3': { TEXT: 'Above Mastery', PASS_IND: 'Yes' }
    };


    var gradeDecode = {
        "AzMERIT ELA Grade 3": "03"
        , "AzMERIT ELA Grade 4": "04"
        , "AzMERIT ELA Grade 5": "05"
        , "AzMERIT ELA Grade 6": "06"
        , "AzMERIT ELA Grade 7": "07"
        , "AzMERIT ELA Grade 8": "08"
        , "AzMERIT ELA Grade 9": "09"
        , "AzMERIT ELA Grade 10": "10"
        , "AzMERIT ELA Grade 11": "11"
        , "AzMERIT ELA Grade 12": "12"
        , "AzMERIT Math Grade 3": "03"
        , "AzMERIT Math Grade 4": "04"
        , "AzMERIT Math Grade 5": "05"
        , "AzMERIT Math Grade 6": "06"
        , "AzMERIT Math Grade 7": "07"
        , "AzMERIT Math Grade 8": "08"
        , "AzMERIT Math Grade 9": "09"
        , "AzMERIT Math Grade 10": "10"
        , "AzMERIT Math Grade 11": "11"
        , "AzMERIT Math Grade 12": "12"

        , "ELA Grade 9": "09"
        , "ELA Grade 10": "10"
        , "ELA Grade 11": "11"
        , "ELA Grade 12": "12"


        , "Geometry": "13"
        , "AzMERIT Geometry": "13"
        , "AzM2 Geometry": "13"

        , "Algebra I": "12"
        , "AzMERIT Algebra I": "12"
        , "AzM2 Algebra I": "12"

        , "Algebra II": "14"
        , "AzMERIT Algebra II": "14"
        , "AzM2 Algebra II": "14"


        , "AzM2 Math Grade 3": "03"
        , "AzM2 Math Grade 4": "04"
        , "AzM2 Math Grade 5": "05"
        , "AzM2 Math Grade 6": "06"
        , "AzM2 Math Grade 7": "07"
        , "AzM2 Math Grade 8": "08"
        , "AzM2 Math Grade 9": "09"
        , "AzM2 Math Grade 10": "10"
        , "AzM2 Math Grade 11": "11"
        , "AzM2 Math Grade 12": "12"
        , "AzM2 ELA Grade 3": "03"
        , "AzM2 ELA Grade 4": "04"
        , "AzM2 ELA Grade 5": "05"
        , "AzM2 ELA Grade 6": "06"
        , "AzM2 ELA Grade 7": "07"
        , "AzM2 ELA Grade 8": "08"
        , "AzM2 ELA Grade 9": "09"
        , "AzM2 ELA Grade 10": "10"
        , "AzM2 ELA Grade 11": "11"
        , "AzM2 ELA Grade 12": "12"
    };

    var decodeSubject = {
            "English Language Arts": "ELA",
            "Mathematics" : "Math"
    };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    /**
     * Maps normalized records for given group of rows.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param rows A JSON array of record objects being processed
     * @returns {Array}
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        var record = mapNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    //is this where domapping should be mapped?

    function mapNormalizedRecord(signature, hierarchy, row) {
        try {
            var record = {};
            var mappingObject = {};

            mappingObject.ADMIN_MAPPINGS = {};
            mappingObject.SCORE_MAPPINGS = [];
            mappingObject.ASSESSMENT_METADATA = {};
            mappingObject.ASSESSMENT_METADATA.TESTS = [];
            mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

            //Map normalized admin fields
            record = mapNormalizedAdminFields(signature, hierarchy, row);

            if (!record) return null;

            //Map non-normalized admin fields
            mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

            var testCode = _util.trim(_util.coalesce(
                row.getField('ASSESSMENT_SUBTEST_TITLE'),
                decodeSubject[row.getField('SUBJECT')],
                row.getField('TEST_NAME')));

            var testIDCode = null;

            if (testCode === null)
                testIDCode = 'MIXED';
            else if (testCode.indexOf('ELA') > -1)
                testIDCode = 'ELA';
            else if (testCode.indexOf('Math') > -1)
                testIDCode = 'MA';
            else if (testCode.indexOf('Algebra') > -1)
                testIDCode = 'EOC_ALG';
            else if(testCode.indexOf('Geometry') > -1)
                testIDCode = 'EOC_GEO';

//previously - testMetadata.FIELD has Geometry or Algebra then the testSubject = EOC.
//New - For better understanding added _subject to EOC.

                   //Map score fields for each expected score mapping
            scoresToMap.forEach(function (testMetadata) {
                if (testMetadata.CODE == testIDCode) {
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                }
            });


            //
            subscoresToMap.forEach(
                function (testMetadata) {
                    var subscore = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, subscore);
                }
            );

            // System Fields
            record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
            record.LINEAGE_SOURCE = _thisLineageSource;
            record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
            record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
            record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

            return record;
        }
        catch (e) {
            print(e)
        }
    }


    /***********************************************************************************
     Assessment-specific administration functions
     ***********************************************************************************/

    /**
     * Maps normalized administration fields based on a given set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     */
    //not sure how to map this to mapAdminRecord
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var oppNumber = _util.coalesce(row.getField('OPPORTUNITY_NUMBER'));
        var prodTestId = generateAssessmentAdminKey(signature, hierarchy, row);
        var adminElement = null;
        var birthDateObject;

        /**
         * Assuming, the format of Student's full name is [<Last Name>, <First Name> <MiddleName>]
         */
        const STUDENT_NAME_INFO = (() => {
            let fullName = row.getField('STUDENT_NAME');
            let firstName = '';
            let middleName = '';
            let lastName = '';
            if (fullName) {
                let nameChunks = fullName.split(',').map((n) => n.trim());
                let firstMiddleChunks = nameChunks[1].split(' ').map((n) => n.trim());
                lastName = nameChunks[0];
                middleName = firstMiddleChunks.pop();
                firstName = firstMiddleChunks.join(' ');
            } else {
                firstName = row.getField('FIRST_NAME');
                middleName = row.getField('MIDDLE_NAME');
                lastName = row.getField('LAST_NAME');
            }
            return {
                firstName: firstName,
                middleName: middleName,
                lastName: lastName
            }
        })();

        if (prodTestId != null && !prodTestId.equals('')) {
            // adminElement = new com.versifit.utl.UTLDataElement('com.versifit.utl.generic.testadmin');
            //adminElement.setLineage(row.getLineage());
            let studentBirthDate = row.getField("STUDENT_BIRTHDATE_STR");
            if (!studentBirthDate) {
                return null;
            }
            if(signature.getFormat().getFormatName() === "AzMERIT_2021") {
                  birthDateObject = AppUtil.getDateObjByPattern(studentBirthDate, "MM/dd/yyyy");
            }
            else {
               if (studentBirthDate.indexOf("/") > -1) {
                birthDateObject = AppUtil.getDateObjByPattern(studentBirthDate, "dd/MM/yyyy");
               }
               else {
                birthDateObject = AppUtil.getDateObjByPattern(studentBirthDate, "dd-MM-yyyy");
               }
            }
            //var schoolObj = getSchoolObject(row);
            var testDateObj = getTestDateObject(row, oppNumber, hierarchy);
            var term = getTermPeriod(row);
            var assessment = row.getField('ASSESSMENT_SUBTEST_TITLE');
            var grade = _util.coalesce(decodeStudentGrade[row.getField('GRADE_OF_TEST')],decodeStudentGrade[row.getField('TEST_STUDENT_GRADE')], gradeDecode[assessment], 'NA');
            normalizedFileFields.forEach(function (field) {
                switch (field) {
                    //Admin Information
                    case "ASSESSMENT_ADMIN_KEY":
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                        break;
                    case "SYS_PARTITION_VALUE":
                        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                        break;
                    case "DISTRICT_CODE":
                        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;//_util.coalesce(row.getField('DIST_ENT'),AssessmentLoader.config.DISTRICT_CODE);
                        break;
                    case "SCHOOL_YEAR":
                        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                        break;
                    case "REPORTING_PERIOD":
                        record.REPORTING_PERIOD = term;
                        break;
                    case "ASSESSMENT_VENDOR":
                        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                        break;
                    case "ASSESSMENT_PRODUCT":
                        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                        break;

                    //Student IDs and Match Results
                    case "STUDENT_VENDOR_ID":
                        //should matchedStudent be replaced by row.getField or hierarchy?
                        record.STUDENT_VENDOR_ID = _util.coalesce(row.getField('STUDENT_ID'), row.getField('SAISID'));
                        break;
                    case "STUDENT_LOCAL_ID":
                        record.STUDENT_LOCAL_ID = null;
                        break;
                    case "STUDENT_STATE_ID":
                        record.STUDENT_STATE_ID = row.getField('SAISID');
                        break;

                    //Student Information
                    case "STUDENT_FIRST_NAME":
                        record.STUDENT_FIRST_NAME = STUDENT_NAME_INFO.firstName;
                        break;
                    case "STUDENT_LAST_NAME":
                        record.STUDENT_LAST_NAME = STUDENT_NAME_INFO.lastName;
                        break;
                    case "STUDENT_MIDDLE_NAME":
                        record.STUDENT_MIDDLE_NAME = STUDENT_NAME_INFO.middleName;
                        break;
                    case "STUDENT_GENDER_CODE":
                        record.STUDENT_GENDER_CODE = row.getField('GENDER');
                        break;
                    case "STUDENT_DOB_MONTH":
                        record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                        break;
                    case "STUDENT_DOB_DAY":
                        record.STUDENT_DOB_DAY = birthDateObject.DAY;
                        break;
                    case "STUDENT_DOB_YEAR":
                        record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                        break;
                    case "PARTICIPATION_GRADE":
                        record.PARTICIPATION_GRADE = decodeStudentGrade[row.getField('PARTICIPATION_GRADE')];
                        break;
                    case "STUDENT_GRADE_CODE":
                        record.STUDENT_GRADE_CODE = grade;
                        break;

                    //School Information
                    case "SCHOOL_NAME":
                        record.SCHOOL_NAME = _util.coalesce(row.getField("SCH_NAME"));
                        break;
                    case "SCHOOL_VENDOR_ID":
                        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField('SCH_ENTITY'), row.getField('SCH_NAME'));
                        break;
                    case "SCHOOL_LOCAL_ID":
                        record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField('DISTRICT_SCHOOL_ID'), null);
                        break;
                    case "SCHOOL_STATE_ID":
                        record.SCHOOL_STATE_ID = _util.coalesce(row.getField('STATE_SCHOOL_ID'), null);
                        break;

                    //Date Information
                    case "PARTICIPATION_YEAR":
                        record.PARTICIPATION_YEAR = row.getField('SCHOOL_YEAR');
                        break;
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE = testDateObj.STANDARD_DATE;
                        break;



                    default:
                        record[field] = row.getField(field);
                        break;
                }
            });

            return record;
        }
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(admin, row) {
        var admin = {};
        admin.TEST_EXEMPTION_CODE_4 = _util.coalesce(row.getField('OPPORTUNITY_NUMBER'));
        return admin;
    }


    function getTermPeriod(row) {
        var term;
        if (!row.getField("ADMINISTRATION")) {
            term = "ALL";
        }
        else if (row.getField("ADMINISTRATION").indexOf("Spring") > -1) {
            term = "SPRING";
        } else if (row.getField("ADMINISTRATION").indexOf("Fall") > -1) {
            term = "FALL";
        } else {
            term = "SUMMER";
        }
        return term;
    }



    function formatSchoolCode(schoolCode) {

        if (schoolCode === null || schoolCode === undefined) {
            //Mainly to change Undefined to null
            schoolCode = null;
        } else if (schoolCode !== -1) {
            //School code has district code (Ex: Dist_School, 1234_5678)
            schoolCode = schoolCode.substring(schoolCode.indexOf('_') + 1);
        } else {
            //School code doesn't contain district code.
            //Do nothing
        }

        return schoolCode;
    }



    function getTestDateObject(row, oppNumber, hierarchy) {

        var dateObj = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var month, day, year;
        var rawYear = _util.coalesce(hierarchy.SCHOOL_YEAR, '');
        var term = getTermPeriod(row);

        var day = '1';


        if (term == 'FALL') {
            month = '10';
            day = '15';
            year = rawYear.substring(0, rawYear.indexOf('-'));
        } else if (term == 'SPRING') {
            month = '04';
            day = '15';
            year = rawYear.substring(rawYear.indexOf('-') + 1);
        } else if (term == 'ALL') {
            month = '05';
            day = '15';
            year = rawYear.substring(rawYear.indexOf('-') + 1);
        }
        // SUMMER
        else {
            month = '06';
            day = '15';
            year = rawYear.substring(rawYear.indexOf('-') + 1);
        }

        var standardDate = month + '/' + day + '/' + year;


        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = standardDate;

        return dateObj;

    }




    /***********************************************************************************
                            Assessment-specific score functions
    ***********************************************************************************/
    //UPLIFT DONE
    function mapScaledScore(row, testMetadata) {
        var score = {};

        var assessment = row.getField('ASSESSMENT_SUBTEST_TITLE');
        var grade = _util.coalesce(decodeStudentGrade[row.getField('GRADE_OF_TEST')],decodeStudentGrade[row.getField('TEST_STUDENT_GRADE')], gradeDecode[assessment], 'NA');

        if (grade === null) {
            grade = "";
        }
        var testNumber = generateTestNumber(row, testMetadata, grade);
        //print(testNumber+"\n")
        if (grade.length < 2) {
            grade = '0' + grade;
        }

        //var testNumber = 'AZMERIT' + grade + testParams;
        var scaleScore = _util.coalesce(row.getField("SS_TOT"),row.getField("SCALE_SCORE"));
        var standardError = _util.coalesce(row.getField("SEM_TOTSS"));
        var achievementLevel = _util.coalesce(row.getField("PERFORMANCE_LEVEL"));


        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === undefined || scaleScore === null || scaleScore == '') {
            return null;
        }
        else if (isNaN(scaleScore)) {
            score["TEST_NUMBER"] = testNumber;
            if(scaleScore === 'INC'){
                score["TEST_PRIMARY_RESULT"] = "Incomplete";
            }
            score["TEST_PRIMARY_RESULT"] = scaleScore;
        }
        else {
            score["TEST_NUMBER"] = testNumber;

            if (scaleScore !== 'NA' && scaleScore !== 'N/A' && scaleScore !== 'NS') {
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            if (standardError !== 'NA' && standardError !== 'N/A' && standardError !== 'NS') {
                score["TEST_STANDARD_ERROR"] = standardError;
            }

            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_PRIMARY_RESULT_CODE"] = SSPerformanceEncode[achievementLevel];

            var decode = SSPerformanceDecodes[achievementLevel].TEXT;
            if (decode != null && decode != undefined) {
                score["TEST_PRIMARY_RESULT"] = decode;
                score["TEST_PASSED_INDICATOR"] = SSPerformanceDecodes[achievementLevel].PASS_IND;
            }

        }
        return score;
    }

    /**
     *
     * @param {*} row
     * @param {*} testMetadata
     * @returns
     */
    function mapSubjectScore(row, testMetadata) {
        var score = {};

        var assessment = row.getField('ASSESSMENT_SUBTEST_TITLE');//don't have
        var grade = _util.coalesce(decodeStudentGrade[row.getField('GRADE_OF_TEST')], decodeStudentGrade[row.getField('TEST_STUDENT_GRADE')],gradeDecode[assessment], 'NA');

        if (grade === null) {
            grade = "";
        }

        if (grade.length < 2) {
            grade = '0' + grade;
        }

        var testSubject = null;
        if (testMetadata.FIELD.indexOf('ELA') > -1)
            testSubject = 'ELA';
        else if (testMetadata.FIELD.indexOf('MATH') > -1)
            testSubject = 'MA';
        else if (testMetadata.FIELD.indexOf('Geometry') > -1)
            testSubject = 'EOC_GEO';
        else if (testMetadata.FIELD.indexOf('Algebra') > -1)
            testSubject = 'EOC_ALG';

//previously - testMetadata.FIELD has Geometry or Algebra then the testSubject = EOC.
//New - For better understanding added _subject to EOC.

        var testNumber = generateTestNumber(row, { TEST: 'AZMERIT', CODE: testSubject }, grade);
        //var testNumber = 'AZMERIT' + grade + testParams;
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_SS"));
        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_PL"));


        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === undefined || scaleScore === null || scaleScore == '') {
            return null;
        }
        else if (isNaN(scaleScore)) {
            score["TEST_NUMBER"] = testNumber;
            if(scaleScore === 'INC'){
                 score["TEST_PRIMARY_RESULT"] = "Incomplete";
            }
            score["TEST_PRIMARY_RESULT"] = scaleScore;
        }
        else {
            score["TEST_NUMBER"] = testNumber;

            if (scaleScore !== 'NA' && scaleScore !== 'N/A' && scaleScore !== 'NS') {
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_PRIMARY_RESULT_CODE"] = SSPerformanceEncode[achievementLevel];

            var decode = SSPerformanceDecodes[achievementLevel].TEXT;
            if (decode != null && decode != undefined) {
                score["TEST_PRIMARY_RESULT"] = decode;
                score["TEST_PASSED_INDICATOR"] = SSPerformanceDecodes[achievementLevel].PASS_IND;
            }

        }

        return score;
    }

    //ADDED FROM UPLIFT
    function mapSubScore(row, testMetadata) {
        var subscore = {};
        var decode;
        var assessment = row.getField('ASSESSMENT_SUBTEST_TITLE');
        var grade = _util.coalesce(decodeStudentGrade[row.getField('GRADE_OF_TEST')],decodeStudentGrade[row.getField('TEST_STUDENT_GRADE')], gradeDecode[assessment], 'NA');

        if (grade === null) {
            grade = "";
        }

        if (grade.length < 2) {
            grade = '0' + grade;
        }

        var testNumber = generateTestNumber(row, testMetadata, grade);

        var achievementLevel = _util.trim(_util.coalesce(row.getField(testMetadata.FIELD)));

        if (achievementLevel === undefined || achievementLevel === null || achievementLevel == '') {
            return null;
        } else if (isNaN(achievementLevel)) {
            subscore["TEST_NUMBER"] = testNumber;

            if (achievementLevel.indexOf("Your student's response was too limited to evaluate.") > -1)
                subscore["TEST_PRIMARY_RESULT"] = "Student's response was too limited to evaluate";
            else {
                subscore["TEST_PRIMARY_RESULT_CODE"] = achievementLevel;
                subscore["TEST_PRIMARY_RESULT"] = NonNumericDecodes[achievementLevel];
            }
        } else {
            subscore["TEST_NUMBER"] = testNumber;
            subscore["TEST_SCORE_VALUE"] = achievementLevel;
            subscore["TEST_SCORE_TEXT"] = achievementLevel;
            subscore["TEST_RAW_SCORE"] = achievementLevel;
            subscore["TEST_PRIMARY_RESULT_CODE"] = achievementLevel;

            if (testMetadata.CODE != 'ELAPFOS' && testMetadata.CODE != 'ELAEES' && testMetadata.CODE != 'ELACES') {
                decode = NormalStrandPerformanceDecodes[achievementLevel];
                subscore["TEST_PRIMARY_RESULT"] = decode.TEXT;
            } else {
                subscore["TEST_PRIMARY_RESULT"] = achievementLevel;
            }
            if (decode != null && decode != undefined) {
                subscore["TEST_PASSED_INDICATOR"] = decode.PASS_IND;
            }
        }

        return subscore;
    }



    /***************************************************************************
     Utility Functions
     ***************************************************************************/
    /**
     * Determines if two assessment records are for the same assessment admin
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param one The first assessment record being compared
     * @param two The second assessment record being compared
     * @returns {number}
     */
    //not sure what to do with these
    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {
        try {
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }
    }

    /**
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var testCode = _util.trim(_util.coalesce(srcRecord.getField('ASSESSMENT_SUBTEST_TITLE'),srcRecord.getField('TEST_NAME'), srcRecord.getField('ELA_PL'), srcRecord.getField('MATH_PL'),decodeSubject[srcRecord.getField('SUBJECT')]));
        var testIDCode = null;
        if (testCode === null)
            return null;
        else if (testCode.indexOf('ELA') > -1)
            testIDCode = 'ELA';
        else if (testCode.indexOf('Math') > -1)
            testIDCode = 'MA';
        else if (testCode.indexOf('Algebra') > -1)
            testIDCode = 'EOC_ALG';
        else if (testCode.indexOf('Geometry') > -1)
            testIDCode = 'EOC_GEO';
        else {
            testIDCode = 'MIXED';
        }
        assessmentAdminKey = assessmentAdminKey + "_" + testIDCode;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata, grade) {

        var testNumber = testMetadata.TEST + grade + testMetadata.CODE;
        //print(testNumber+"\n")
        return testNumber;

    }

    return module;

}());
