var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AIMS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;


    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
                    try{
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch(exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    var scoresToMap = [
            {TEST: "AIMS", CODE:"READ", STRAND: "", CONCEPT: "", FIELD: "Read", MAP_FUNCTION: mapScore_COMP},
            {TEST: "AIMS", CODE:"READ", STRAND: "PROCESS", CONCEPT: "", FIELD: "R S1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "PROCESS", CONCEPT: "VOCABULARY", FIELD: "R S1 C4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "PROCESS", CONCEPT: "COMPREHEND", FIELD: "R S1 C6", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "LITTEXT", CONCEPT: "", FIELD: "R S2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "LITTEXT", CONCEPT: "ELEMENTS", FIELD: "R S2 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "INFOTEXT", CONCEPT: "", FIELD: "R S3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "INFOTEXT", CONCEPT: "EXPOS", FIELD: "R S3 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "INFOTEXT", CONCEPT: "FUNC", FIELD: "R S3 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "INFOTEXT", CONCEPT: "PERSUASV", FIELD: "R S3 C3", MAP_FUNCTION: mapScore_STR},

            {TEST: "AIMS", CODE:"READ", STRAND: "PROCESS", CONCEPT: "PRINTCONCEPTS", FIELD: "R S1 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "PROCESS", CONCEPT: "PHONICS", FIELD: "R S1 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"READ", STRAND: "LITTEXT", CONCEPT: "HISTCULTURAL", FIELD: "R S2 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"", STRAND: "", CONCEPT: "", FIELD: "SAT10L", MAP_FUNCTION: mapScore_SAT},
            {TEST: "AIMS", CODE:"", STRAND: "", CONCEPT: "", FIELD: "SAT10R", MAP_FUNCTION: mapScore_SAT},

            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "Math", MAP_FUNCTION: mapScore_COMP},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "NUMOPER", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "DATAPROBDISC", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "DATAPROBDISC", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "PATTALGFUNC", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "DATAPROBDISC", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "GEOMANDMEAS", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "GEOMANDMEAS", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "STRUCLOGIC", MAP_FUNCTION: mapScore_STR},

            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "RELATIONSHIPS", FIELD: "M S3 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "", CONCEPT: "", FIELD: "SAT10M", MAP_FUNCTION: mapScore_SAT},
            {TEST: "AIMS", CODE:"MATH", STRAND: "NUMOPER", CONCEPT: "NUMSENSE", FIELD: "M S1 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "NUMOPER", CONCEPT: "OPERATIONS", FIELD: "M S1 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "NUMOPER", CONCEPT: "ESTIMATION", FIELD: "M S1 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "STRUCLOGIC", CONCEPT: "REASONPROOF", FIELD: "M S5 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "RELATIONALGREPRES", FIELD: "M S3 C2/3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "DATAPROBDISC", CONCEPT: "PROBLISTCOUNTGRAPH", FIELD: "M S2 C2/3/4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "ALGREPRESENT", FIELD: "M S3 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "CHANGE", FIELD: "M S3 C4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "SHAPES", FIELD: "M S4 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "PATTERNS", FIELD: "M S3 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "PATTERNSFUNCRELATE", FIELD: "M S3 C1/2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "PATTALGFUNC", CONCEPT: "ALGREPRESENTCHANGE", FIELD: "M S3 C3/4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "DATAPROBDISC", CONCEPT: "PROBABILITY", FIELD: "M S2 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "GEOMANDMEAS", CONCEPT: "PROPSHAPE", FIELD: "M S4 C1/2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "GEOMANDMEAS", CONCEPT: "PROPERTIES", FIELD: "M S4 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"MATH", STRAND: "GEOMANDMEAS", CONCEPT: "COORDINATE", FIELD: "SAT10L", MAP_FUNCTION: mapScore_STR},


            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "", CONCEPT: "", FIELD: "Sci", MAP_FUNCTION: mapScore_COMP},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "INQPROC", CONCEPT: "", FIELD: "S S1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "INQPROC", CONCEPT: "OBSQUESHYPO", FIELD: "S S1 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "INQPROC", CONCEPT: "SCIENTIFICTEST", FIELD: "S S1 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "HISTNAT", CONCEPT: "", FIELD: "S S2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PERSSOC", CONCEPT: "", FIELD: "S S3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFE", CONCEPT: "", FIELD: "S S4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PHYSICAL", CONCEPT: "", FIELD: "S S5", MAP_FUNCTION: mapScore_STR},


            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "INQPROC", CONCEPT: "ANALYSISCONCLCOMM", FIELD: "S S1 C3/4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PHYSICAL", CONCEPT: "ENERGMAGNETISM", FIELD: "S S5 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "EARTHSPACE", CONCEPT: "", FIELD: "S S6", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "EARTHSPACE", CONCEPT: "PROCSYS", FIELD: "S S6 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "EARTHSPACE", CONCEPT: "CHGEARTHSKY", FIELD: "S S6 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "INQPROC", CONCEPT: "ANALYSISCONCL", FIELD: "S S1 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "INQPROC", CONCEPT: "COMMUN", FIELD: "S S1 C4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PHYSICAL", CONCEPT: "PROPCHGPROPMATTER", FIELD: "S S5 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PHYSICAL", CONCEPT: "MOTIONFORCE", FIELD: "S S5 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFE", CONCEPT: "CELL", FIELD: "S S4 C1", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFE", CONCEPT: "MOLECBASISHERED", FIELD: "S S4 C2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFE", CONCEPT: "INTERDEPORG", FIELD: "S S4 C3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFE", CONCEPT: "BIOLOGEVOLUTION", FIELD: "S S4 C4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFE", CONCEPT: "MATTERENERGORGSYS", FIELD: "S S4 C5", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "HISTNATC1/2", CONCEPT: "", FIELD: "S S2 C1/2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PERSSOCC1/2", CONCEPT: "", FIELD: "S S3 C1/2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "PERSSOCC1/2/3", CONCEPT: "", FIELD: "S S3 C1/2/3", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFEC1/3/4", CONCEPT: "", FIELD: "S S4 C1/3/4", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"SCIENCE", STRAND: "LIFEC2/4", CONCEPT: "", FIELD: "S S4 C2/4", MAP_FUNCTION: mapScore_STR},

            {TEST: "AIMS", CODE:"WRITE", STRAND: "", CONCEPT: "", FIELD: "Write", MAP_FUNCTION: mapScore_COMP},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "IDEACONTORG", FIELD: ["W T1", "W T2"], MAP_FUNCTION: mapScore_STR_MULT},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "VOICEWORDCHSENTFLUENC", FIELD: ["W T3", "W T4", "W T5"], MAP_FUNCTION: mapScore_STR_MULT},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "CONVEN", FIELD: "W T6", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "", FIELD: ["W T1" , "W T2" , "W T3", "W T4", "W T5" , "W T6"], MAP_FUNCTION: mapScore_STR_MULT},

            {TEST: "AIMS", CODE:"WRITE", STRAND: "", CONCEPT: "", FIELD: "Write", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "", FIELD: "W S2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "IDEACONTORG", FIELD: "W S2 C1/2", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "VOICEWORDCHSENTFLUENC", FIELD: "W S2 C3/4/5", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "MC", CONCEPT: "CONVEN", FIELD: "W S2 C6", MAP_FUNCTION: mapScore_STR},
            {TEST: "AIMS", CODE:"WRITE", STRAND: "EXTRESPONSE", CONCEPT: "EXTRESPONSE", FIELD: "WRITE PROMPT", MAP_FUNCTION: mapScore_STR},


        ];

    //subject = testMetadata.CODE , field = testMetadata.FIELD or testMetadata.FIELD, strand = strand or empty if none, concept = concept or empty if none




    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/


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
    function mapNormalizedRecord(signature, hierarchy, row) {
        var rowIndex = 0;
        var adminElement;
        var mappedSourceResultList = new java.util.ArrayList();
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

            //Map non-normalized admin fields
            mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);


            //Map score fields for each expected score mapping
            scoresToMap.forEach(function (testMetadata) {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,hierarchy);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            });


            // System Fields
            record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
            record.LINEAGE_SOURCE = _thisLineageSource;
            record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
            record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
            record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

            return record;
        }
        catch(e)
        {
            print(e)
            print("mapNormalizedRecord")
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

    function mapNormalizedAdminFields(signature, hierarchy, row) {
        try {
            var record = {};
            var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
            var prodTestId = generateAssessmentAdminKey(signature, hierarchy, row);
            var adminElement = null;

            if (prodTestId != null && !prodTestId.equals('')) {
                var birthDate = _util.trim(row.getField("BIRTH DATE"));
                if(birthDate.length <= 4){
                            var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
                             };
                }
                else if (birthDate.length == 7) {
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "Mddyyyy");
                }
                else if(birthDate.length == 5){
                   // birthDate = row.getField("BIRTH DATE");
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "Mddyy");
                }
                else if(birthDate.length == 6){
                    // birthDate = row.getField("BIRTH DATE");
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MMddyy");
                }
                else if(birthDate.length === 8 && birthDate.indexOf("-")>-1){
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MM-dd-yy");
                }
                else if(birthDate.length === 8 && birthDate.indexOf("/")>-1){
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MM/dd/yy");
                }
                else if(birthDate.length >= 9 && birthDate.indexOf("/")>-1){
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MM/dd/yyyy");
                }
                else {
                   // birthDate = row.getField("BIRTH DATE");
                    var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MMddyyyy");
                }
                var period = getASSESSMENT_PERIOD(row);
                var schoolYear = _util.coalesce(hierarchy.SCHOOL_YEAR);
                var testDateObj = {};


                if (period == 'FALL')
                    testDateObj = AppUtil.getDateObjByPattern('09/15/' + schoolYear.substring(0, 4), 'MM/dd/yyyy');
                else if (period == 'WINTER')
                    testDateObj = AppUtil.getDateObjByPattern('01/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');
                else if (period == 'SPRING')
                    testDateObj = AppUtil.getDateObjByPattern('05/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');

                normalizedFileFields.forEach(function (field) {
                    switch (field) {
                        case "PROD_TEST_ID":
                            record.PROD_TEST_ID = generateAssessmentAdminKey(signature, hierarchy, row);
                            break;
                        case "DISTRICT_CODE":
                            record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                            break;
                        case "SCHOOL_LOCAL_ID":
                            record.SCHOOL_LOCAL_ID = AssessmentLoader.config.DISTRICT_CODE;
                            break;

                        case "SCHOOL_VENDOR_ID":
                            record.SCHOOL_VENDOR_ID = _util.coalesce(Number(row.getField('SCH ENTITY')).toFixed(0));
                            break;
                        case "SCHOOL_NAME":
                             record.SCHOOL_NAME = row.getField('SCH NAME');
                             break;
                        case "TEST_STUDENT_GRADE":
                            record.TEST_STUDENT_GRADE = getTEST_STUDENT_GRADE(row, hierarchy);
                            break;

                        //Student Information
                        case "STUDENT_FIRST_NAME":
                            record.STUDENT_FIRST_NAME = row.getField('FIRST NAME');
                            break;
                        case "STUDENT_LAST_NAME":
                            record.STUDENT_LAST_NAME = row.getField('LAST NAME');
                            break;
                        case "STUDENT_MIDDLE_NAME":
                            record.STUDENT_MIDDLE_NAME = row.getField('MI');
                            break;
                        case "STUDENT_GENDER_CODE":
                            record.STUDENT_GENDER_CODE = row.getField('GENDER');
                            break;
                        case "STUDENT_DOB_MONTH":
                            record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                            break;
                        case "STUDENT_DOB_DAY":
                            record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                            break;
                        case "STUDENT_DOB_YEAR":
                            record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                            break;
                        case "TEST_ADMIN_PERIOD":
                            record.TEST_ADMIN_PERIOD = getASSESSMENT_PERIOD(row);
                            break;
                        case "TEST_ADMIN_DATE_STR":
                            record.TEST_ADMIN_DATE_STR = getTEST_ADMIN_DATE_STR(row, hierarchy);
                            break;
                        case "SCHOOL_YEAR":
                            record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                            break;
                        case "REPORTING_PERIOD":
                            record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                            break;
                        case "ASSESSMENT_ADMIN_KEY":
                            record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                            break;
                        case "SYS_PARTITION_VALUE":
                            record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                            break;
                        case "ASSESSMENT_VENDOR":
                            record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                            break;
                        case "ASSESSMENT_PRODUCT":
                            record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                            break;
                        case "TEST_ADMIN_DATE":
                            record.TEST_ADMIN_DATE = testDateObj.STANDARD_DATE;
                            break;
                        case "STUDENT_GRADE_CODE":
                            record.STUDENT_GRADE_CODE = getTEST_STUDENT_GRADE(row,hierarchy);
                            break;
                        case "STUDENT_VENDOR_ID":
                            record.STUDENT_VENDOR_ID = row.getField('SSID');
                            break;
                        case "STUDENT_STATE_ID":
                            record.STUDENT_STATE_ID = row.getField('SSID');
                            break;
                        default:
                            record[field] = row.getField(field);
                            break;
                    }

                });
                //Set Exemptions
                var iCnt = 0;
                var iDesc = '';

                var fields = new Array('Braille'
                    , 'SA1'
                    , 'SA2'
                    , 'SA3'
                    , 'SA4'
                    , 'SA5'
                    , 'SA6'
                    , 'SA7'
                    , 'SA8'
                    , 'SA9'
                    , 'SA10'
                    , 'SA11'
                    , 'SA12'
                    , 'SA13'
                    , 'SA14'
                    , 'SA15'
                    , 'SA16'
                    , 'SA17'
                    , 'SA18'
                    , 'SA19'
                    , 'SA20'
                    , 'SA21'
                    , 'SA22');
                var desc = new Array('Braille'
                    , 'Answers Transferred'
                    , 'Scribe'
                    , 'Assistive Technology'
                    , 'More Breaks'
                    , 'Simplified Language'
                    , 'Read Aloud Test Items'
                    , 'Translation Dictionary'
                    , 'Oral Translation'
                    , 'Place Marker'
                    , 'More Breaks'
                    , 'Different Time'
                    , 'Simplified Language'
                    , 'Read Aloud Directions'
                    , 'Read Aloud Test Items'
                    , 'Large Print'
                    , 'Abacus'
                    , 'Dictionary/Thesaurus'
                    , 'Braille Writer'
                    , 'Answers Transferred'
                    , 'Scribe'
                    , 'Assistive Technology'
                    , 'Personal Whiteboard');

                for (var i = 0; i < fields.length; i++) {
                    if (row.getField(fields[i]) == 'Y') {
                        if (iCnt > 0)
                            iDesc += ', ';
                        iCnt++
                        iDesc += desc[i];
                    }
                }

                if (iCnt > 0) {
                    record['TEST_EXEMPTION_CODE'] = iCnt;
                    record['TEST_EXEMPTION_DESC'] = iDesc;
                }

                return record;

            }
        }
        catch(e){
            print(e)
            print("admin")
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
        return admin;
    }







    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    /*
    function mapScaledScore(row, testMetadata) {
        var score = {};

        var assessment = row.getField('ASSESSMENT_SUBTEST_TITLE');
        var grade = _util.coalesce(row.getField('GRADE_OF_TEST'), gradeDecode[assessment], 'NA');
        if (grade === null){
            grade = "";
        }
        var testNumber = generateTestNumber(row, testMetadata,grade);
        if (grade.length < 2) {
            grade = '0' + grade;
        }

        //var testNumber = 'AZELLA' + grade + testParams;
        var scaleScore = _util.coalesce(row.getField("SS_TOT"));
        var standardError = _util.coalesce(row.getField("SEM_TOTSS"));
        var achievementLevel = _util.coalesce(row.getField("PERFORMANCE_LEVEL"));


        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === undefined || scaleScore === null || scaleScore == '') {
            return null;
        }
        else if (isNaN(scaleScore)) {
            score["TEST_NUMBER"] = testNumber;
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
            score["TEST_PRIMARY_RESULT_CODE"] = achievementLevel;


            var decode = SSPerformanceDecodes[achievementLevel];
            if (decode != null && decode != undefined) {
                score["TEST_PRIMARY_RESULT"] = decode;
            }
        }

        return score;
    }
*/




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
            print(exception);
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

        signature.getFormat().getNaturalKey().forEach(function (key) {
            //         + '_' + _util.coalesce(row.getField('CONTENT'])
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        assessmentAdminKey= assessmentAdminKey + '_' + getTEST_STUDENT_GRADE(srcRecord,hierarchy)
        return assessmentAdminKey;
    }






    /*
     * FIELD FUNCTIONS
     */


    function getTEST_STUDENT_GRADE(row,hierarchy) {
        try {
            var gradeCode = _util.trim(_util.coalesce(row.getField('GRADE OF TEST'), row.getField('GRADE'), ''));
            if ((gradeCode == null) || (gradeCode == '')) {
                var schoolYear = _util.coalesce(hierarchy.SCHOOL_YEAR);
                var gradeCohort = _util.trim(_util.coalesce(row.getField('COHORT')));
                var period = getASSESSMENT_PERIOD(row);
                if (gradeCohort == null || gradeCohort == '' || schoolYear == null || schoolYear == '' || period == null || period == '')
                    return null;
                if (period == gradeCohort)
                    return gradeCode = '12';
                if (gradeCohort == '8' || gradeCohort == '9')
                    gradeCohort = '0' + gradeCohort;
                return gradeCode = parseInt(12 + (parseInt(schoolYear.substring(5, 9)) - parseInt('20' + gradeCohort)));
            } else {
                if (gradeCode == '3' || gradeCode == '4' || gradeCode == '5' || gradeCode == '6' || gradeCode == '7' || gradeCode == '8' || gradeCode == '9')
                    return gradeCode = '0' + gradeCode;
            }
            return gradeCode;
        }
        catch(e)
        {
            print(e)
            print("getTEST_STUDENT_GRADE")
        }
    }


    function getASSESSMENT_PERIOD(row) {
        var seasonCode = row.getField('SEASON');

        if(seasonCode == 'FA')
            return 'FALL';
        else if(seasonCode == 'WI')
            return 'WINTER';
        else if(seasonCode == 'SP')
            return 'SPRING';
        else
            return null;
    }

    function getTEST_ADMIN_DATE_STR(row,hierarchy) {
        try {
            var period = getASSESSMENT_PERIOD(row);
            var schoolYear = _util.coalesce(hierarchy.SCHOOL_YEAR);
            if (period == null || period == '' || schoolYear == null || schoolYear == '')
                return null;

            if (period == 'FALL')
                return settings.parseDate('09/15/' + schoolYear.substring(0, 4), 'MM/dd/yyyy');
            else if (period == 'WINTER')
                return settings.parseDate('01/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');
            else if (period == 'SPRING')
                return settings.parseDate('05/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');
            return null;
        }
        catch(e)
            {
                print(e)
                print("getTEST_ADMIN_DATE_STR")
            }
    }

    function getPASS_FAIL(row, colName) {
        var passFail;
        var rawPassFail = _util.coalesce(row.getField(colName));

        if(rawPassFail == 'P')
            passFail = 'Yes';
        else if(rawPassFail == 'F')
            passFail = 'No';
        else
            passFail = null;

        return passFail;
    }

    //MAP COMPOSITE SCORE
        function mapScore_COMP(row, testMetadata,hierarchy){
            var scoreElement = null;
            var gradeCode = getTEST_STUDENT_GRADE(row,hierarchy);
            if((gradeCode == null))
                return null;
            else{
                if(gradeCode == '9' || gradeCode == '09' || gradeCode == '9.0' || gradeCode == '10' || gradeCode == '10.0' || gradeCode == '11' || gradeCode == '11.0' || gradeCode == '12' || gradeCode == '12.0' || gradeCode == '13.0' || gradeCode == '13')
                    gradeCode = 'HS'
            }
            try {
                var rawScore = row.getField(testMetadata.FIELD + ' RAW');

                if (rawScore != null && rawScore != '') {
                    scoreElement = {};
                    //testMetadata.FIELD???
                    scoreElement['TEST_NUMBER'] = genTestNum(testMetadata.CODE, gradeCode, '');
                    scoreElement['TEST_RAW_SCORE'] = rawScore;
                    scoreElement['TEST_SCORE_VALUE'] = row.getField(testMetadata.FIELD + ' SCALE');
                    scoreElement['TEST_SCALED_SCORE'] = row.getField(testMetadata.FIELD + ' SCALE');
                    scoreElement['TEST_ITEMS_POSSIBLE'] = row.getField(testMetadata.FIELD + ' POSS');
                    scoreElement['TEST_PASSED_INDICATOR'] = getPASS_FAIL(row, testMetadata.FIELD + ' P/F');
                    scoreElement['TEST_PRIMARY_RESULT_CODE'] = row.getField(testMetadata.FIELD + ' PL');

                    if (row.getField(testMetadata.FIELD + ' PL') == '1')
                        scoreElement['TEST_PRIMARY_RESULT'] = 'Falls Far Below the Standard';
                    else if (row.getField(testMetadata.FIELD + ' PL') == '2')
                        scoreElement['TEST_PRIMARY_RESULT'] = 'Approaches the Standard';
                    else if (row.getField(testMetadata.FIELD + ' PL') == '3')
                        scoreElement['TEST_PRIMARY_RESULT'] = 'Meets the Standard';
                    else if (row.getField(testMetadata.FIELD + ' PL') == '4')
                        scoreElement['TEST_PRIMARY_RESULT'] = 'Exceeds the Standard';
                    else
                        scoreElement['TEST_PRIMARY_RESULT'] = 'Not Available';
                }

                return scoreElement;
            }
            catch(e){
                print(e)
                print("mapScore_COMP")
            }
        }

    //MAP STANFORD 10 TEST
        function mapScore_SAT(row, testMetadata,hierarchy){
            var scoreElement = null;
            var gradeCode = getTEST_STUDENT_GRADE(row,hierarchy);
            if((gradeCode == null))
                return null;
            else{
                if(gradeCode == '9' || gradeCode == '09' || gradeCode == '9.0' || gradeCode == '10' || gradeCode == '10.0' || gradeCode == '11' || gradeCode == '11.0' || gradeCode == '12' || gradeCode == '12.0' || gradeCode == '13.0' || gradeCode == '13')
                    gradeCode = 'HS'
            }
            try {


                var scaleScore = row.getField(testMetadata.FIELD + ' SCALE');

                if (scaleScore != null && scaleScore != '') {
                    scoreElement = {};
                    scoreElement['TEST_NUMBER'] = genTestNum(testMetadata.CODE, gradeCode, '');
                    scoreElement['TEST_SCALED_SCORE'] = scaleScore;
                    scoreElement['TEST_SCORE_VALUE'] = scaleScore;
                    scoreElement['TEST_PERCENTILE_SCORE'] = row.getField(testMetadata.FIELD + ' NP');
                    scoreElement['TEST_STANINE_SCORE'] = row.getField(testMetadata.FIELD + ' NS');
                    scoreElement['TEST_NCE_SCORE'] = row.getField(testMetadata.FIELD + ' NCE');
                    scoreElement['TEST_PRIMARY_RESULT_CODE'] = '--';
                    scoreElement['TEST_PRIMARY_RESULT'] = '--';

                }

                return scoreElement;
            }
            catch(e)
            {
                print(e)
                print("mapScore_SAT")
            }
        }

    //MAP STRAND SCORE
        function mapScore_STR(row, testMetadata,hierarchy){
            var scoreElement = null;
            var gradeCode = getTEST_STUDENT_GRADE(row,hierarchy);
            if((gradeCode == null))
                return null;
            else{
                if(gradeCode == '9' || gradeCode == '09' || gradeCode == '9.0' || gradeCode == '10' || gradeCode == '10.0' || gradeCode == '11' || gradeCode == '11.0' || gradeCode == '12' || gradeCode == '12.0' || gradeCode == '13.0' || gradeCode == '13')
                    gradeCode = 'HS'
            }
            var rawScore = row.getField(testMetadata.FIELD);
        try{
            if(rawScore != null && rawScore != ''){
                scoreElement = {};


                scoreElement['TEST_NUMBER'] = genTestNum(testMetadata.CODE, gradeCode, testMetadata.STRAND + testMetadata.CONCEPT);
                scoreElement['TEST_RAW_SCORE'] = rawScore;
                scoreElement['TEST_SCORE_VALUE'] = rawScore;


                if((testMetadata.FIELD != 'Write Prompt') && (testMetadata.FIELD != 'W T1') && (testMetadata.FIELD != 'W T2') && (testMetadata.FIELD != 'W T3') && (testMetadata.FIELD != 'W T4') && (testMetadata.FIELD != 'W T5') && (testMetadata.FIELD != 'W T6'))
                    scoreElement['TEST_PERCENTILE_SCORE']=row.getField(testMetadata.FIELD + ' %');
            }

            return scoreElement;
        }
        catch(e){
                print(e)
            print("mapScore_STR")
            }
        }

    //MAP STRAND SCORE MULTIPLE
    function mapScore_STR_MULT(row, testMetadata,hierarchy){
        var scoreElement = null;
        var gradeCode = getTEST_STUDENT_GRADE(row,hierarchy);
        if((gradeCode == null))
            return null;
        else{
            if(gradeCode == '9' || gradeCode == '09' || gradeCode == '9.0' || gradeCode == '10' || gradeCode == '10.0' || gradeCode == '11' || gradeCode == '11.0' || gradeCode == '12' || gradeCode == '12.0' || gradeCode == '13.0' || gradeCode == '13')
                gradeCode = 'HS'
        }
        var rawScore = null;
        try{
        for(var i = 0; i <testMetadata.FIELD.length; i++)
        {
            rawScore = rawScore + row.getField(testMetadata.FIELD[i]);
        }

        if(rawScore != null && rawScore != ''){
            scoreElement = {};


            scoreElement['TEST_NUMBER'] = genTestNum(testMetadata.CODE, gradeCode, testMetadata.STRAND + testMetadata.CONCEPT);
            scoreElement['TEST_RAW_SCORE'] = rawScore;
            scoreElement['TEST_SCORE_VALUE'] = rawScore;


            //if((testMetadata.FIELD != 'Write Prompt') && (testMetadata.FIELD != 'W T1') && (testMetadata.FIELD != 'W T2') && (testMetadata.FIELD != 'W T3') && (testMetadata.FIELD != 'W T4') && (testMetadata.FIELD != 'W T5') && (testMetadata.FIELD != 'W T6'))
            //    scoreElement['TEST_PERCENTILE_SCORE']=row.getField(testMetadata.FIELD + ' %');
        }

        return scoreElement;
        }
        catch(e){
            print(e)
            print("mapScore_STR_MULT")
        }
    }



    function genTestNum(subject, gradeCode, strand){
        return 'AIM' + subject + gradeCode + strand;
    }

    return module;

}());
