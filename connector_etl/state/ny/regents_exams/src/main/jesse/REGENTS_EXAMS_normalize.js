var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "regents_exams";
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
			print(`Loading using signature file ${signatureFormatName}\n`);


			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print(`Normalized file: ${normalizedFile}\n`);

			var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
			var lineNumber = 0;
			const fileFullName = file.getFullName();

			//Process data file records.
			_dataflow.create("RECORD BUILD")
				.input("INPUT", AppUtil.getInputDataflow(file, signature))
				.transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

					json.LINEAGE_FILE = fileFullName;
					json.LINEAGE_LINE = (++lineNumber).toString();
					output.RECORDS.put(json);
				})
				.group_by("ADMINISTRATION GROUPING" , function(one, two){

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
						if(!multipleRowsPerGroupingExpected && rows.length > 1){

							//Report error for each row
							rows.forEach(function(row){
								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
							});

						} else {
							output.RECORDS.put(rows);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
					}
				})
				.transform("NORMALIZE RECORDS", ["RECORDS"],
					function(output, rows) {
						try{

							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

							normalizedRecords.forEach(function(record){
								output.RECORDS.put(record);
							});

						} catch(exception) {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
						}


					})
				.transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
					try {
						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

						// Report when no scores are found.
						if(mappingObject.SCORE_MAPPINGS.length === 0){
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
						} else {
							output.RECORDS.put(row);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
					}
				})
				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
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
        {TEST: "REGENTS_EXAMS", CODE:"_GRADE", FIELD: "GRADE_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "REGENTS_EXAMS", CODE:"_PRIMARY", FIELD: "PRIMARY_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "REGENTS_EXAMS", CODE:"", FIELD: "", MAP_FUNCTION: mapTestNameScore}
        ,{TEST: "REGENTS_EXAMS", CODE:"FIN", FIELD: "FINAL_", MAP_FUNCTION: mapLanguageScore}
        ,{TEST: "REGENTS_EXAMS", CODE:"ORA", FIELD: "ORAL_", MAP_FUNCTION: mapLanguageScore}
        ,{TEST: "REGENTS_EXAMS", CODE:"LIS", FIELD: "LISTENING_", MAP_FUNCTION: mapLanguageScore}
        ,{TEST: "REGENTS_EXAMS", CODE:"", FIELD: "", MAP_FUNCTION: mapOverallScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "13": "13",
        "Grade 13": "13",
        "14": "14",
        "Grade 14": "14",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "GD": "GD",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var AlgebraDecode = {
        "ALGEBRA" : "ALG 1",
        "ALGEBRA 1" : "ALG 1",
        "Regents Algebra I - Jun" : "ALG 1",
        "Regents Algebra I - Aug" : "ALG 1",
        "Regents Algebra I - Jan" : "ALG 1",
        "Regents Common Core Algebra I - Aug" : "ALG 1",
        "Regents Common Core Algebra I - Jan" : "ALG 1",
        "Subject:  Regents Common Core Algebra I - Jan" : "ALG 1",
        "Subject:  Regents Common Core Algebra I - Jun" : "ALG 1",
        "Subject:  Regents Common Core Algebra I - Aug" : "ALG 1",
        "Regents Common Core Algebra I - Jun" : "ALG 1",
        "Regents Common Core Algebra I" : "ALG 1",
        "ALGEBRA 1 INTENSIVE" : "ALG 1",
        "ALGEBRA 1 INTENSIVE U" : "ALG 1",
        "ALGEBRA INTENSIVE U" : "ALG 1",
        "ALGEBRA 1 U" : "ALG 1",
        "ALGEBRA 1 UE" : "ALG 1",
        "ALGEBRA INTENSIVE" : "ALG 1",

        "Regents Common Core Algebra II - Aug" : "ALG 2",
        "Regents Common Core Algebra II - Jan" : "ALG 2",
        "Subject:  Regents Common Core Algebra II - Jan" : "ALG 2",
        "Subject:  Regents Common Core Algebra II - Jun" : "ALG 2",
        "Subject:  Regents Common Core Algebra II - Aug" : "ALG 2",
        "Regents Common Core Algebra II - Jun" : "ALG 2",
        "ALGEBRA 2" : "ALG 2",
        "ALGEBRA 2 HONORS" : "ALG 2",
        "Regents Common Core Algebra II" : "ALG 2",
        "Regents Algebra I" : "ALG 1"
    };

    var perLevelDecode = {
        "1" : {DESC: "Level 1", PASS_IND : "No"},
        "2" : {DESC: "Level 2", PASS_IND : "No"},
        "3" : {DESC: "Level 3", PASS_IND : "Yes"},
        "4" : {DESC: "Level 4", PASS_IND : "Yes"},
        "5" : {DESC:"Level 5", PASS_IND : "Yes"},
        null : {DESC: null, PASS_IND : null},
        " " : {DESC: null, PASS_IND : null},
        undefined : {DESC: null, PASS_IND : null},
        "N/A" : {DESC : null, PASS_IND : null}
    };

    var performDecode = {
        "01" : "Level 1",
        "02" : "Level 2",
        "03" : "Level 3",
        "04" : "Level 4",
        "05" : "Level 5",
        "31" : "Level 1",
        "32" : "Level 2",
        "33" : "Level 3",
        "34" : "Level 4",
        "35" : "Level 5",
        null : null,
        " " : null,
        undefined : null,
        "N/A" : null
    }

    var passDecode = {
        "01" : "No",
        "02" : "No",
        "03" : "Yes",
        "04" : "Yes",
        "05" : "Yes",
        "31" : "No",
        "32" : "No",
        "33" : "Yes",
        "34" : "Yes",
        "35" : "Yes",
        null : null,
        " " : null,
    }

    function performanceLevel(scaleScore, subject) {
        scaleScore = parseInt(scaleScore)
        if(subject === 'ELA' || subject === 'ALG_1' || subject === 'ALG_2' || subject === 'GEO' || subject === 'HIST' || subject === 'BIO_LIV_ENV' || subject === 'BIO_LIV_ENV' || subject === 'EARTH_SCI' || subject === 'PHY' || subject === 'CHE'|| subject === 'GL_HIST'|| subject === 'US_HIST' || subject === 'ENV'){
            if(scaleScore >= 0 && scaleScore <= 54)
                return '1';
        }
        if(subject === 'ELA' || subject === 'ALG_1' || subject === 'ALG_2' || subject === 'GEO' || subject === 'HIST' || subject === 'BIO_LIV_ENV' || subject === 'BIO_LIV_ENV' || subject === 'EARTH_SCI' || subject === 'PHY' || subject === 'CHE'|| subject === 'GL_HIST'|| subject === 'US_HIST' || subject === 'ENV'){
            if(scaleScore >= 55 && scaleScore <=64)
                return '2';
        }
        if(subject === 'ELA' || subject === 'HIST'|| subject === 'GL_HIST' ){
            if (scaleScore >= 65 && scaleScore <=78)
                return '3';
        }
        if(subject === 'GEO'){
            if (scaleScore >= 65 && scaleScore <=79)
                return '3';
        }
        if(subject === 'ALG_2' || subject === 'ALG_1'){
            if (scaleScore >= 65 && scaleScore <=77)
                return '3';
        }
        if(subject === 'BIO_LIV_ENV' || subject === 'EARTH_SCI' || subject === 'PHY' || subject === 'CHE' || subject === 'ENV'|| subject === 'US_HIST'){
            if (scaleScore >= 65 && scaleScore <=84)
                return '3';
        }
        if(subject === 'ELA' || subject === 'HIST'|| subject === 'GL_HIST'){
            if (scaleScore >= 79 && scaleScore <=84)
                return '4';
        }
        if(subject === 'GEO'){
            if (scaleScore >= 80 && scaleScore <=84)
                return '4';
        }
        if(subject === 'ALG_2' || subject === 'ALG_1'){
            if (scaleScore >= 78 && scaleScore <=84)
                return '4';
        }
        if(subject === 'BIO_LIV_ENV' || subject === 'EARTH_SCI' || subject === 'PHY' || subject === 'CHE' || subject === 'ENV'|| subject === 'US_HIST'){
            if (scaleScore >= 85 && scaleScore <=100)
                return '4';
        }
        if(subject === 'ELA' || subject === 'ALG_1' || subject === 'ALG_2' || subject === 'GEO' || subject === 'HIST'|| subject === 'GL_HIST'){
             if(scaleScore >= 85 && scaleScore<=100)
                return '5';
        }
        else{
            return 'N/A';
        }
    }

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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
            }
        });

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
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
print("begin admin\n");
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = row.getField("STUDENT_BIRTHDATE");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        print("birth admin\n");
        var fullName = row.getField("LAST_FIRST");
        if(fullName !== undefined && fullName !== null && fullName !== ""){
            var lastName = _util.trim(fullName.split(",")[0]);
            var firstName = _util.trim(fullName.split(",")[1]);
            var middleName = null
            if(fullName.match(/,/g) && fullName.match(/,/g).length>1) {
              middleName = _util.trim(fullName.split(",")[2]);
            }
        }
        print("name admin\n");
        try {
            var testDateFromFile = row.getField("TEST_DATE");
            if (testDateFromFile !== null && testDateFromFile !== undefined && testDateFromFile !== "") {
                if ( testDateFromFile.length() === 11 || testDateFromFile.length() === 12) {
                    var testDate = AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "MMM dd, yyyy").STANDARD_DATE;
                }
                else if(testDateFromFile.length() === 10 ) {
                    var testDate = AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "yyyy-MM-dd").STANDARD_DATE;
                }
                else if (isNaN(testDateFromFile)) {
                    var testDate = testDateFromFile.replace(/[^-/0-9]/g, "");
                    if (testDate.length() === 12) {
                        testDate = testDate.substring(0, 8);
                        testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
                    }else if(testDateFromFile.length() === 8 || testDateFromFile.length() === 9){//4-Jun-24
                        AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "dd-MMM-yy").STANDARD_DATE;
                    }
                    else {
                        testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
                    }
                } else {
                    var testDate = AppUtil.getMonthFollowedByDay(testDateFromFile).STANDARD_DATE;
                }
            }
        }
        catch(e){
            print(e +" : is the error\n")
        }
        print("date admin\n");
        var studentGrade = gradeDecode[row.getField('GRADE_LEVEL')];
        if(studentGrade !== "GD"){
            studentGrade = gradeDecode[studentGrade];
        }
        else{
            studentGrade = null;
        }
        print("grade admin\n");
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                    break;
                case "SYS_PARTITION_VALUE":
                    record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                    break;
                case "TENANT_CODE":
                    record.TENANT_CODE = AssessmentLoader.config.TENANT_CODE;
                    break;
                case "DISTRICT_CODE":
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDate, "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9));
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'), middleName);
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = studentGrade;
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
                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"),row.getField("DISTRICT_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });
        print("end admin\n");
        return record;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {

        var admin = {};
        var eClassRank = row.getField("EXCLUDE_FROM_CLASSRANK");
        var excludeFromClassRank = row.getField("EXCLUDE_FROM_CLASSRANK");
        var eGPA = row.getField("EXCLUDE_FROM_GPA");
        var excludeFromGPA = row.getField("EXCLUDE_FROM_GPA");
        var eHonorRoll = row.getField("EXCLUDE_FROM_HONOR_ROLL");
        var excludeFromHonorRoll = row.getField("ENGEXCLUDE_FROM_HONOR_ROLL_LEARNER");

        if(eClassRank ==="1"||eClassRank==="2"){
            admin.TEST_EXCEMPTION_CODE = eClassRank;
            admin.TEST_EXCEMPTION_DESC = excludeFromClassRank;
        }
        if(eGPA ==="1"||eGPA==="2"){
            admin.TEST_EXCEMPTION_CODE_2 = eClassRank;
            admin.TEST_EXCEMPTION_DESC_2 = excludeFromClassRank;
        }
        if(eHonorRoll ==="1"||eHonorRoll==="2"){
            admin.TEST_EXCEMPTION_CODE_3 = eClassRank;
            admin.TEST_EXCEMPTION_DESC_3 = excludeFromClassRank;
        }
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata, signature) {
        var score = {};

        var testName1 = row.getField("TEST_NAME");

        if (testName1 && (testName1 !== null || testName1 !== undefined)) {
            //Dont execute mapScaledScore if we have test name
            return null;
        }

        var gradeLevel = row.getField("GRADE_LEVEL");
        var testNumber = null;
        var achievlevel= row.getField("ACHIEVEMENT_LEVEL");

        var courseName = row.getField("COURSE_NAME");
        var flName = null;
        if(courseName !== null && courseName!== "" && courseName!== undefined){
            courseName = courseName.toString().toUpperCase();
        }
        else {
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            flName =  fileName.substring(fileName.lastIndexOf('/')+1);
        }

        var subject = getSubject(courseName,flName, row, testName1);
        if( gradeLevel !== null && gradeLevel !== undefined && gradeLevel !== ""){
            testNumber = testMetadata.TEST + "_" + gradeDecode[gradeLevel] + testMetadata.CODE + "_" + subject;
        } else {
            testNumber = testMetadata.TEST + "_" + subject;
        }

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCALE_SCORE"), row.getField("SCALE_SCORE"));
        var percent = row.getField("PERCENT_SCORE");
        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE");
        var perfLetter = row.getField(testMetadata.FIELD + "PERF_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "ABS" )
            && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || _util.trim(rawScore) === "ABS") )
        {
            return null;
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_RAW_SCORE"] = rawScore;
    	score["TEST_CUSTOM_RESULT"] = perfLetter;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PERCENTAGE_SCORE"] = percent;
        score["TEST_PRIMARY_RESULT"] = perLevelDecode[performanceLevel(scaleScore, subject)].DESC;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel(scaleScore, subject);
        score["TEST_PASSED_INDICATOR"] = perLevelDecode[performanceLevel(scaleScore, subject)].PASS_IND;
        score["TEST_SCORE_ATTRIBUTES"] = achievlevel;

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;
    }

    function mapTestNameScore(row, testMetadata, signature) {
        var score = {};
        var testNumber = null;

        if (signature.getFormat().getFormatName() !== 'REGENTS_EXAMS_16_1_COLS') {
            return null;
        }

        var courseName = row.getField("COURSE_NAME");

        var flName = null;
        if(courseName !== null && courseName!== "" && courseName!== undefined){
            courseName = courseName.toString().toUpperCase();
        }
        else {
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            flName =  fileName.substring(fileName.lastIndexOf('/')+1);
        }

        var testName1 = row.getField("TEST_NAME");

        var subject = getSubject(courseName,flName, row, testName1);

        testNumber = generateTestNumber(row, testMetadata) + "_" + subject;

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCALE_SCORE"), row.getField("SCALE_SCORE"));

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "ABS" )
            && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || _util.trim(rawScore) === "ABS") )
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;

        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_PRIMARY_RESULT"] = perLevelDecode[performanceLevel(scaleScore, subject)].DESC;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel(scaleScore, subject);
        score["TEST_PASSED_INDICATOR"] = perLevelDecode[performanceLevel(scaleScore, subject)].PASS_IND;

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;
    }

    function mapLanguageScore(row, testMetadata, signature){

        var score = {};
        var testName1 = row.getField("TEST_NAME");


        var testNumber = null;
        var flName = null;

        var gradeLevel = row.getField("GRADE_LEVEL");
        var courseName = row.getField("COURSE_NAME");

        if(courseName !== null && courseName!== "" && courseName!== undefined){
            courseName = courseName.toString().toUpperCase();
        }
        else {
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            flName =  fileName.substring(fileName.lastIndexOf('/')+1);
        }

        var subject = getSubject(courseName,flName, row, testName1);

        if( gradeLevel !== null && gradeLevel !== undefined && gradeLevel !== ""){
            testNumber = testMetadata.TEST + "_" + gradeDecode[gradeLevel] + "_" + testMetadata.CODE + "_" + subject;
        } else {
            testNumber = testMetadata.TEST + "_" + subject;
        }

        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var rawScore =row.getField("PT1_RAW_SCORE");

        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "INV" || _util.trim(scaleScore) === "INC")
            && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || _util.trim(rawScore) === "INV" || _util.trim(scaleScore) === "INC") )
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_RAW_SCORE"] = rawScore;

        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;
 }

      function mapOverallScore(row, testMetadata){
          var score = {};
          var testNumber = uploadTestNumber(row, testMetadata);
          var scaleScore = row.getField("SCALED_SCORE");
          var performance = row.getField("STANDARD_MET");

        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

      	// Set score fields
      	score["TEST_NUMBER"] = testNumber;
      	score["TEST_SCORE_TEXT"] = scaleScore;
          if(!isNaN(scaleScore)){
              score["TEST_SCORE_VALUE"] = scaleScore;
              score["TEST_SCALED_SCORE"] = scaleScore;
          }
          score["TEST_PRIMARY_RESULT_CODE"] = performance;
          score["TEST_PRIMARY_RESULT"] = performDecode[performance];
          score["TEST_PASSED_INDICATOR"] = passDecode[performance];

          if(scaleScore === 999 || scaleScore === "999") {
              score["TEST_NUMBER"] = testNumber;
              score["TEST_SCORE_TEXT"] = null;
              if(!isNaN(scaleScore)){
                  score["TEST_SCORE_VALUE"] = null;
                  score["TEST_SCALED_SCORE"] = null;
                  score["TEST_RAW_SCORE"] = null;
              }
              score["TEST_PASSED_INDICATOR"] = null;
              score["TEST_PRIMARY_RESULT"] = "Medically Excused";
              score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
          }

          return score;
   }

    function generateTestNumber(row, testMetadata) {
            var testName1 = row.getField("TEST_NAME");
            var testIDCode = null;
            if(testName1.indexOf('Regents Common Core Algebra I - Jun') > -1){
                    testIDCode = 'COMM_CORE' ;
            }else if(testName1.indexOf('Regents Common Core Geometry - Jun') > -1){
                    testIDCode = 'COMM_CORE';
            }else if(testName1.indexOf('Regents Common Core ELA - Jun') > -1){
                    testIDCode = 'COMM_CORE';
            }else if(testName1.indexOf('Regents Living Environment - Jun') > -1){
                    testIDCode = 'BIO_LIV';
            }else if(testName1.indexOf('Regents NF Global History - Jun') > -1){
                    testIDCode = 'NF';
            }else if(testName1.indexOf('Regents Phy Set/Chemistry - Jun') > -1){
                    testIDCode = 'PHY_SET';
            }else if(testName1.indexOf('Regents Phy Set/Earth Sci - Jun') > -1){
                    testIDCode = 'PHY_SET';
            }
            var gradeLevel = row.getField("GRADE_LEVEL");
            var testNumber = testMetadata.TEST + "_" + gradeDecode[gradeLevel] + "_" + testIDCode;

            return testNumber;
        }

    function getSubject(courseName, flName,  row, testName1){
    var subject = null;
    if(flName){
        flName = flName.toString().toUpperCase();
        if(flName.indexOf("ALGEBRA_I_") > -1){
            subject = 'ALG_1';
        }else if(flName.indexOf("ALGEBRA_II") > -1){
            subject = 'ALG_2';
        }else if(flName.indexOf("ALGEBRA") > -1){
             subject = 'ALG_1';
        }else if(flName.indexOf("CHEMISTRY") > -1){
            subject = 'CHE';
        }else if((flName.indexOf("ELA") > -1) || (flName.indexOf("ENGLISH") > -1)){
            subject = 'ELA';
        }else if(flName.indexOf("GEOMETRY") > -1){
            subject = 'GEO';
        }else if(flName.indexOf("GLOBAL") > -1){
            subject = 'GL_HIST';
        }else if(flName.indexOf("US") > -1){
            subject = 'US_HIST';
        }else if(flName.indexOf("LIV_ENV") > -1 || flName.indexOf("LIVING_ENVIRONMENT") > -1){
            subject = 'BIO_LIV_ENV';
        }else if(flName.indexOf("EARTH_SCI") > -1){
            subject = 'EARTH_SCI'
        }else if(flName.indexOf("FRENCH") > -1){
            subject = 'FRENCH'
        }else if(flName.indexOf("LATIN") > -1){
             subject = 'LATIN'
        }else if(flName.indexOf("SPANISH") > -1){
             subject = 'SPAN'
        }else if(flName.indexOf("PHYSICS") > -1){
             subject = 'PHY'
        }
    }
    var testName1 = row.getField("TEST_NAME");
    if(testName1){
        if(testName1.indexOf("Regents Common Core Algebra I - Jun") > -1){
            subject = 'ALG_1';
        }else if(testName1.indexOf("Regents Phy Set/Chemistry - Jun") > -1){
            subject = 'CHE';
        }else if(testName1.indexOf("Regents Common Core ELA - Jun") > -1){
            subject = 'ELA';
        }else if(testName1.indexOf("Regents Common Core Geometry - Jun") > -1){
            subject = 'GEO';
        }else if(testName1.indexOf("Regents NF Global History - Jun") > -1){
            subject = 'GL_HIST';
        }else if(testName1.indexOf("Regents Living Environment - Jun") > -1){
            subject = 'ENV';
        }else if(testName1.indexOf("Regents Phy Set/Earth Sci - Jun") > -1){
            subject = 'EARTH_SCI'
        }
    }
    if(courseName) {
    	if(courseName !== null && courseName !== "" && courseName !== undefined) {
            courseName = courseName.toUpperCase();
            var alg = AlgebraDecode[_util.coalesce(row.getField("COURSE_NAME"),row.getField("ITEM_DESCRIPTION"))];
            if(courseName.indexOf("ELA") >-1|| courseName.indexOf("ENGLISH") >-1 || courseName.indexOf("LANG/COMP")>-1){
                subject = 'ELA';
            }else if(courseName.indexOf("GEOMETRY")>-1){
                subject = 'GEO';
            }else if(courseName.indexOf("HIST GEO")>-1){
                subject = 'HIST';
            }else if(courseName.indexOf("GLOBAL HISTORY") >-1 ){
                subject = 'GL_HIST';
            }else if(courseName.indexOf("US HISTORY") >-1 ){
                subject = 'US_HIST';
            }else if(courseName.indexOf("BIO") >-1 || courseName.indexOf("LIVING ENVIRONMENT") >-1 || courseName.indexOf("BIOLOGY") >-1){
                subject = 'BIO_LIV_ENV';
            }else if(courseName.indexOf("CHEMISTRY")>-1){
                subject = 'CHE';
            }else if(courseName.indexOf("EARTH SCI") >-1 || courseName.indexOf("E. SCIENCE") >-1 || courseName.indexOf("E SCIENCE")>-1){
                subject = 'EARTH_SCI';
            }else if(courseName.indexOf("PHYSICS")>-1){
                subject = 'PHY';
            }else if(courseName.indexOf("FRENCH")>-1){
                subject = 'FRENCH';
            }else if(courseName.indexOf("LATIN") > -1){
                subject = 'LATIN'
            }else if(courseName.indexOf("SPANISH") > -1){
                subject = 'SPAN'
            }else if(courseName.indexOf("ITALIAN") > -1){
                subject = 'ITAL'
            }else if(alg === "ALG 1"){
                subject = 'ALG_1';
            }else if(alg === "ALGEBRA I "){//Space included to prevent algebra II
                subject = 'ALG_1';
            }else if(alg === "ALG 2"){
                subject = 'ALG_2';
            }else if(alg === "ALGEBRA II"){
                subject = 'ALG_2';
            }
        }
    }
    return subject;
}

    function uploadTestNumber(row, testMetadata) {
        var sub = null;
        var testNumber = null;
        var SubjectName = row.getField("ITEM_DESCRIPTION");
        var alg = AlgebraDecode[row.getField("ITEM_DESCRIPTION")];
        if(SubjectName !== null && SubjectName !== "" && SubjectName !== undefined){
        	SubjectName = SubjectName.toUpperCase();
            if (SubjectName.indexOf("ELA") > -1) {
                sub = "ELA";
            } else if (alg === "ALG 2"){
                sub = "ALG_2";
            } else if (alg === "ALG 1") {
                sub = "ALG_1";
            } else if (SubjectName.indexOf("GEOMETRY") > -1) {
                sub = "GEO";
            } else if (SubjectName.indexOf("HIST GEO") > -1) {
                sub = "HIST";
            } else if (SubjectName.indexOf("GLOBAL HISTORY") > -1) {
                sub = "GL_HIST";
            } else if (SubjectName.indexOf("US HISTORY") > -1) {
                sub = "US_HIST";
            } else if (SubjectName.indexOf("BIO") >-1 || SubjectName.indexOf("LIVING ENVIRONMENT") >-1 || SubjectName.indexOf("BIOLOGY") >-1){
                sub = "BIO_LIV_ENV";
            } else if (SubjectName.indexOf("CHEMISTRY") > -1) {
                sub = "CHE";
            } else if (SubjectName.indexOf("EARTH SCI") >-1 || SubjectName.indexOf("E. SCIENCE") >-1 || SubjectName.indexOf("E SCIENCE")>-1) {
                sub = "EARTH_SCI";
            } else if (SubjectName.indexOf("PHYSICS") > -1) {
                sub = "PHY";
            } else if (SubjectName.indexOf("GLOBAL HIST EXEMPT") > -1) {
                sub = "GL_HIST_EXE";
            } else if (SubjectName.indexOf("SCIENCE EXEMPT") > -1) {
                sub = "SCI_EXE";
            }
            if (sub) {
                testNumber = testMetadata.TEST + '_' + sub;
            }
        }
    return testNumber;
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
    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {
        try {
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
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
        var courseName = null;
        var flName = null;
        var anotherCourseName = srcRecord.getField("COURSE_NAME");
        if  (anotherCourseName !== null && anotherCourseName !== "" && anotherCourseName !== undefined) {
            courseName = anotherCourseName.toString().toUpperCase();
        }
        else{
            var fileName = srcRecord.getRawField("LINEAGE_FILE").toString().toUpperCase();
            flName =  fileName.substring(fileName.lastIndexOf('/')+1);
        }
        var subject = null;
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        subject = getSubject(courseName, flName, srcRecord);
       //Add natural key fields

        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        if(signature.getFormat().getFormatName() !== "REGENTS_EXAM_15_COLS"){
        assessmentAdminKey =assessmentAdminKey + "_" + subject;
        }
        //assessmentAdminKey = assessmentAdminKey + '_' + subject ;
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());