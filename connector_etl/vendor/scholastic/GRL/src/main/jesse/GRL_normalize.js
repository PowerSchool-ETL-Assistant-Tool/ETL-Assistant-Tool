var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "GRL";
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


			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print("Normalized file: ${normalizedFile}");

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
		}n
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
        {TEST: "GRL", CODE:"", MAP_FUNCTION: mapGRLScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeLookup = {
        "KN" 	: "KG"
        ,"KG" 	: "KG"
        ,"0" 	: "KG"
        ,"00" 	: "KG"
        ,"01"	: "01"
        ,"1"	: "01"
        ,"02"	: "02"
        ,"2"	: "02"
        ,"03"	: "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"6"	: "06"
        ,"7"    : "07"
        ,"07"    : "07"
        ,"8"    : "08"
        ,"08"    : "08"
        ,"9"    : "09"
        ,"09"    : "09"
        ,"10"    : "10"
        ,"11"    : "11"
        ,"12"    : "12"
        ,null   : null
        ,""     : null
    };

    var periodDecode = {
        "1"    :"BOY" //Beginning of year
        ,"2"   :"MOY" //Middle of year
        ,"3"   :"EOY" //End of Year
        ,null  :null
        ,""    :null
    };

   var  decodePrimaryResultKG = {
          "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "n/a"}
          ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "Yes", LEXILE: "n/a"}
          ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "Yes", LEXILE: "n/a"}
          ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "Yes", LEXILE: "n/a"}
          ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "Yes", LEXILE: "n/a"}
          ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "Yes", LEXILE: "n/a"}
          ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "Yes", LEXILE: "n/a"}
          ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "Yes", LEXILE: "n/a"}
          ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "Yes", LEXILE: "n/a"}
          ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "Yes", LEXILE: "n/a"}
          ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "Yes", LEXILE: "n/a"}
          ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "Yes", LEXILE: "n/a"}
          ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "Yes", LEXILE: "n/a"}
          ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "Yes", LEXILE: "n/a"}
          ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "Yes", LEXILE: "n/a"}
          ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "Yes", LEXILE: "n/a"}
          ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "Yes", LEXILE: "n/a"}
          ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "Yes", LEXILE: "n/a"}
          ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "Yes", LEXILE: "n/a"}
          ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "Yes", LEXILE: "n/a"}
          ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"T" : {NUMERIC: "20", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"U" : {NUMERIC: "21", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"V" : {NUMERIC: "22", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "n/a"}
          ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "n/a"}
          ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "n/a"}
          ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "n/a"}
          ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "n/a"}
    };

   var  decodePrimaryResult01 = {
          "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "n/a"}
          ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "Yes", LEXILE: "n/a"}
          ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "Yes", LEXILE: "n/a"}
          ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "Yes", LEXILE: "n/a"}
          ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "Yes", LEXILE: "n/a"}
          ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "Yes", LEXILE: "n/a"}
          ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "Yes", LEXILE: "n/a"}
          ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "Yes", LEXILE: "n/a"}
          ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "Yes", LEXILE: "n/a"}
          ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "Yes", LEXILE: "n/a"}
          ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "Yes", LEXILE: "n/a"}
          ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "Yes", LEXILE: "n/a"}
          ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "Yes", LEXILE: "n/a"}
          ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "Yes", LEXILE: "n/a"}
          ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "Yes", LEXILE: "n/a"}
          ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "Yes", LEXILE: "n/a"}
          ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "Yes", LEXILE: "n/a"}
          ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "Yes", LEXILE: "n/a"}
          ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "Yes", LEXILE: "n/a"}
          ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "Yes", LEXILE: "n/a"}
          ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"T" : {NUMERIC: "20", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"U" : {NUMERIC: "21", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"V" : {NUMERIC: "22", DRA: "40-50", PASSED: "Yes", LEXILE: "n/a"}
          ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "n/a"}
          ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "n/a"}
          ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "n/a"}
          ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "n/a"}
          ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "n/a"}
    };

   var  decodePrimaryResult02 = {
         "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "420-620"}
         ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "420-620"}
         ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "420-620"}
         ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "No", LEXILE: "420-620"}
         ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "No", LEXILE: "420-620"}
         ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "No", LEXILE: "420-620"}
         ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "Yes", LEXILE: "420-620"}
         ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "Yes", LEXILE: "420-620"}
         ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "Yes", LEXILE: "420-620"}
         ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "Yes", LEXILE: "420-620"}
         ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "Yes", LEXILE: "420-620"}
         ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "Yes", LEXILE: "420-620"}
         ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "Yes", LEXILE: "420-620"}
         ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "Yes", LEXILE: "420-620"}
         ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "Yes", LEXILE: "420-620"}
         ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "Yes", LEXILE: "420-620"}
         ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "Yes", LEXILE: "420-620"}
         ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "Yes", LEXILE: "420-620"}
         ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "Yes", LEXILE: "420-620"}
         ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "Yes", LEXILE: "420-620"}
         ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "Yes", LEXILE: "420-620"}
         ,"T" : {NUMERIC: "20", DRA: "40-50", PASSED: "Yes", LEXILE: "420-620"}
         ,"U" : {NUMERIC: "21", DRA: "40-50", PASSED: "Yes", LEXILE: "420-620"}
         ,"V" : {NUMERIC: "22", DRA: "40-50", PASSED: "Yes", LEXILE: "420-620"}
         ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "420-620"}
         ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "420-620"}
         ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "420-620"}
         ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "420-620"}
         ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "420-620"}
   };

    var  decodePrimaryResult03 = {
          "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "620-820"}
          ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "620-820"}
          ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "620-820"}
          ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "No", LEXILE: "620-820"}
          ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "No", LEXILE: "620-820"}
          ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "No", LEXILE: "620-820"}
          ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "No", LEXILE: "620-820"}
          ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "No", LEXILE: "620-820"}
          ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "No", LEXILE: "620-820"}
          ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "No", LEXILE: "620-820"}
          ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "No", LEXILE: "620-820"}
          ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "Yes", LEXILE: "620-820"}
          ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "Yes", LEXILE: "620-820"}
          ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "Yes", LEXILE: "620-820"}
          ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "Yes", LEXILE: "620-820"}
          ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "Yes", LEXILE: "620-820"}
          ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "Yes", LEXILE: "620-820"}
          ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "Yes", LEXILE: "620-820"}
          ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "Yes", LEXILE: "620-820"}
          ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "Yes", LEXILE: "620-820"}
          ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "Yes", LEXILE: "620-820"}
          ,"T" : {NUMERIC: "20", DRA: "40-50", PASSED: "Yes", LEXILE: "620-820"}
          ,"U" : {NUMERIC: "21", DRA: "40-50", PASSED: "Yes", LEXILE: "620-820"}
          ,"V" : {NUMERIC: "22", DRA: "40-50", PASSED: "Yes", LEXILE: "620-820"}
          ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "620-820"}
          ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "620-820"}
          ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "620-820"}
          ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "620-820"}
          ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "620-820"}
    };

   var  decodePrimaryResult04 = {
          "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "740-875"}
          ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "740-875"}
          ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "740-875"}
          ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "No", LEXILE: "740-875"}
          ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "No", LEXILE: "740-875"}
          ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "No", LEXILE: "740-875"}
          ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "No", LEXILE: "740-875"}
          ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "No", LEXILE: "740-875"}
          ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "No", LEXILE: "740-875"}
          ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "No", LEXILE: "740-875"}
          ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "No", LEXILE: "740-875"}
          ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "No", LEXILE: "740-875"}
          ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "No", LEXILE: "740-875"}
          ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "No", LEXILE: "740-875"}
          ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "Yes", LEXILE: "740-875"}
          ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "Yes", LEXILE: "740-875"}
          ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "Yes", LEXILE: "740-875"}
          ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "Yes", LEXILE: "740-875"}
          ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "Yes", LEXILE: "740-875"}
          ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "Yes", LEXILE: "740-875"}
          ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "Yes", LEXILE: "740-875"}
          ,"T" : {NUMERIC: "20", DRA: "40-50", PASSED: "Yes", LEXILE: "740-875"}
          ,"U" : {NUMERIC: "21", DRA: "40-50", PASSED: "Yes", LEXILE: "740-875"}
          ,"V" : {NUMERIC: "22", DRA: "40-50", PASSED: "Yes", LEXILE: "740-875"}
          ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "740-875"}
          ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "740-875"}
          ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "740-875"}
          ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "740-875"}
          ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "740-875"}
   };

   var  decodePrimaryResult05 = {
          "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "875-1010"}
          ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "875-1010"}
          ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "875-1010"}
          ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "No", LEXILE: "875-1010"}
          ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "No", LEXILE: "875-1010"}
          ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "No", LEXILE: "875-1010"}
          ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "No", LEXILE: "875-1010"}
          ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "No", LEXILE: "875-1010"}
          ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "No", LEXILE: "875-1010"}
          ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "No", LEXILE: "875-1010"}
          ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "No", LEXILE: "875-1010"}
          ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "No", LEXILE: "875-1010"}
          ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "No", LEXILE: "875-1010"}
          ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "No", LEXILE: "875-1010"}
          ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "No", LEXILE: "875-1010"}
          ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "No", LEXILE: "875-1010"}
          ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "No", LEXILE: "875-1010"}
          ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "No", LEXILE: "875-1010"}
          ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "Yes", LEXILE: "875-1010"}
          ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "Yes", LEXILE: "875-1010"}
          ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "Yes", LEXILE: "875-1010"}
          ,"T" : {NUMERIC: "20", DRA: "40-50", PASSED: "Yes", LEXILE: "875-1010"}
          ,"U" : {NUMERIC: "21", DRA: "40-50", PASSED: "Yes", LEXILE: "875-1010"}
          ,"V" : {NUMERIC: "22", DRA: "40-50", PASSED: "Yes", LEXILE: "875-1010"}
          ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "875-1010"}
          ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "875-1010"}
          ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "875-1010"}
          ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "875-1010"}
          ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "875-1010"}
   };
   var  decodePrimaryResult06 = {
          "Pre-A" : {NUMERIC: "0", DRA: "Below A", PASSED: "No", LEXILE: "925-1010"}
          ,"AA" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "925-1010"}
          ,"A" : {NUMERIC: "1", DRA: "A-1", PASSED: "No", LEXILE: "925-1010"}
          ,"B" : {NUMERIC: "2", DRA: "2", PASSED: "No", LEXILE: "925-1010"}
          ,"C" : {NUMERIC: "3", DRA: "3-4", PASSED: "No", LEXILE: "925-1010"}
          ,"D" : {NUMERIC: "4", DRA: "6", PASSED: "No", LEXILE: "925-1010"}
          ,"E" : {NUMERIC: "5", DRA: "8", PASSED: "No", LEXILE: "925-1010"}
          ,"F" : {NUMERIC: "6", DRA: "10", PASSED: "No", LEXILE: "925-1010"}
          ,"G" : {NUMERIC: "7", DRA: "12", PASSED: "No", LEXILE: "925-1010"}
          ,"H" : {NUMERIC: "8", DRA: "14", PASSED: "No", LEXILE: "925-1010"}
          ,"I" : {NUMERIC: "9", DRA: "16", PASSED: "No", LEXILE: "925-1010"}
          ,"J" : {NUMERIC: "10", DRA: "16-18", PASSED: "No", LEXILE: "925-1010"}
          ,"K" : {NUMERIC: "11", DRA: "16-18", PASSED: "No", LEXILE: "925-1010"}
          ,"L" : {NUMERIC: "12", DRA: "20-24", PASSED: "No", LEXILE: "925-1010"}
          ,"M" : {NUMERIC: "13", DRA: "20-24", PASSED: "No", LEXILE: "925-1010"}
          ,"N" : {NUMERIC: "14", DRA: "28-30", PASSED: "No", LEXILE: "925-1010"}
          ,"O" : {NUMERIC: "15", DRA: "34-38", PASSED: "No", LEXILE: "925-1010"}
          ,"P" : {NUMERIC: "16", DRA: "34-38", PASSED: "No", LEXILE: "925-1010"}
          ,"Q" : {NUMERIC: "17", DRA: "40", PASSED: "No", LEXILE: "925-1010"}
          ,"R" : {NUMERIC: "18", DRA: "40", PASSED: "No", LEXILE: "925-1010"}
          ,"S" : {NUMERIC: "19", DRA: "40-50", PASSED: "No", LEXILE: "925-1010"}
          ,"T" : {NUMERIC: "20", DRA: "50", PASSED: "Yes", LEXILE: "925-1010"}
          ,"U" : {NUMERIC: "21", DRA: "50", PASSED: "Yes", LEXILE: "925-1010"}
          ,"V" : {NUMERIC: "22", DRA: "50", PASSED: "Yes", LEXILE: "925-1010"}
          ,"W" : {NUMERIC: "23", DRA: "60", PASSED: "Yes", LEXILE: "925-1010"}
          ,"X" : {NUMERIC: "24", DRA: "60", PASSED: "Yes", LEXILE: "925-1010"}
          ,"Y" : {NUMERIC: "25", DRA: "60", PASSED: "Yes", LEXILE: "925-1010"}
          ,"Z" : {NUMERIC: "26", DRA: "70", PASSED: "Yes", LEXILE: "925-1010"}
          ,"Z+" : {NUMERIC: "27", DRA: "70", PASSED: "Yes", LEXILE: "925-1010"}
   };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function decodePrimaryResultCode(result, grade){
        var decodedGrade = gradeLookup[grade];
        if(decodedGrade==="KG"){
            return decodePrimaryResultKG[result];
        }
        else if(decodedGrade==="01"){
            return decodePrimaryResult01[result];
        }
        else if(decodedGrade==="02"){
            return decodePrimaryResult02[result];
        }
        else if(decodedGrade==="03"){
            return decodePrimaryResult03[result];
        }
        else if(decodedGrade==="04"){
            return decodePrimaryResult04[result];
        }
        else if(decodedGrade==="05"){
            return decodePrimaryResult05[result];
        }
        else if(decodedGrade==="06"){
            return decodePrimaryResult06[result];
        }
        else{
            return {NUMERIC: "0", DRA: "n/a", PASSED: "n/a", LEXILE: ""};
        }
    }
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var testDate = _util.coalesce(row.getField("TESTDATE"), row.getField("TESTDATE_2"));
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
                    record.REPORTING_PERIOD = _util.coalesce(row.getField("TESTTERMID"), periodDecode[row.getField("TESTPERIOD")]);//hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(testDate, "M/d/yyyy").STANDARD_DATE;
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOLID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                    break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeLookup[row.getField("GRADE_LEVEL")];
                     break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row){
    //Add commented lines if files remain multi-year
        //var acaYear = row.getField("ACAYEAR");
        //var acaSplit = acaYear.split("-");
        //var acaFull = "20"+acaSplit[0]+"-20"+acaSplit[1];
        var admin = {};


        //admin.PARTICIPATION_YEAR = acaFull;
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
     function mapGRLScore(row, testMetadata) {
        var score = {};
        var testNumber = row.getField("NAME");

        if (testNumber === null || testNumber === undefined) {
            testNumber = generateTestNumber(row, testMetadata);
        }

     	var rawScore = _util.coalesce(row.getField("TESTTERMID"), row.getField("TESTPERIOD"));
     	var primaryResult = row.getField('ALPHASCORE');

     	if(primaryResult === null || primaryResult === undefined || primaryResult == ""){
     		return null;
     	}
       var scaleScore = decodePrimaryResultCode(primaryResult, row.getField("GRADE_LEVEL")).NUMERIC;
        if(scaleScore==="0"){
            scaleScore = null;
        }

     	score["TEST_NUMBER"] = testNumber;
     	score["TEST_SCORE_TEXT"] = primaryResult;
     	score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;

     	if (row.getField("PERFORMANCE_LEVEL")) {
            score["TEST_PRIMARY_RESULT"] = row.getField("PERFORMANCE_LEVEL");
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassIndicator(row.getField("PERFORMANCE_LEVEL")).PASSED;
        } else {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_PRIMARY_RESULT"] = scaleScore;
            score["TEST_SECONDARY_RESULT_CODE"] = "Lexile";
            score["TEST_SECONDARY_RESULT"] = decodePrimaryResultCode(primaryResult, row.getField("GRADE_LEVEL")).LEXILE;
            score["TEST_TERTIARY_RESULT_CODE"] = "DRA";
            score["TEST_TERTIARY_RESULT"] = decodePrimaryResultCode(primaryResult, row.getField("GRADE_LEVEL")).DRA;
            score["TEST_PASSED_INDICATOR"] = decodePrimaryResultCode(primaryResult, row.getField("GRADE_LEVEL")).PASSED;
        }
     	score["TEST_RAW_SCORE"] = rawScore;

     	return score;
     }

     function decodePerformancePassIndicator(level) {
       if (level === null || level === undefined) {
         return null;
       } else {
         return performancePassedIndicator[level];
       }
     }

     var performancePassedIndicator = {
           "Standard Exceed" : {PASSED: "Yes"}
           ,"Standard Exceeded" : {PASSED: "Yes"}
           ,"Standard Met" : {PASSED: "Yes"}
           ,"Standard Nearly Met" : {PASSED: "No"}
           ,"Standard Not Met" : {PASSED: "No"}
     };

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

    function generateTestNumber(row, testMetadata) {
        var testNumber = null;
        testNumber = testMetadata.TEST
        + "_" + row.getField('GRADE_LEVEL');
        return testNumber;
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
         var adminDate = _util.coalesce(srcRecord.getField("TESTDATE"), srcRecord.getField("TESTDATE_2"));
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
             assessmentAdminKey = assessmentAdminKey + "_" + adminDate;

        return assessmentAdminKey;
    }

    return module;
}());
