var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MATH_XL";
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

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "SAVVAS", CODE:"savvas", FIELD: "OVERALL", MAP_FUNCTION: mapScaledScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
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
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
       ,"" : null
       ,null : null
      };

    var assessmentNameDecode = {
    "1.3 Multiplying Fractions and Mixed Numbers 1" : "1-3_MFMN"
    ,"1.5 Dividing Fractions by Fractions" : "1-5_DFF"
    ,"1.6 Dividing Mixed Numbers" : "1-6_DMN"
    ,"1.6 Dividing Mixed Numbers " : "1-6_DMN"
    ,"10-1: Analyzing Data Displays" : "10-1_ADD"
    ,"10-2: Comparing Data Sets" : "10-2_CDS"
    ,"10-3: Interpreting the Shapes of Data Displays" : "10-3_ISDD"
    ,"10-4: Standard Deviation" : "10-4_SD"
    ,"10-5: 2 Way Frequency Tables" : "10-5_WFT"
    ,"10-5: 2 Way Frequency Tables Additional Practice" : "10-5_WFTAP"
    ,"10-5: 2 Way Frequency Tables Additional Practice " : "10-5_WFTAP"
    ,"1-1: Lesson Quiz" : "1-1_LQ"
    ,"1-1: MathXL for School: Additional Practice" : "1-1_MXL_AP"
    ,"1-1: MathXL for School: Enrichment" : "1-1_MXL_ENRCH"
    ,"1-1: MathXL for School: Practice & Problem Solving" : "1-1_MXL_PPS"
    ,"1-1: MathXL for School: Practice & Problem Solving " : "1-1_MXL_PPS"
    ,"1-1: MathXL for School: Practice & Problem Solving Version A" : "1-1_MXL_PPSVA"
    ,"1-1: Solving Linear Equations" : "1-1_SLE"
    ,"1-10: MathXL for School: Practice & Problem Solving" : "1-10_MXL_PPS"
    ,"1-2: Dividing Decimals" : "1-2_DD"
    ,"1-2: Dividing Whole Numbers and Decimals Version A" : "1-2_DWNDVA"
    ,"1-2: Lesson Quiz" : "1-2_LQ"
    ,"1-2: MathXL for School: Additional Practice" : "1-2_MXL_AP"
    ,"1-2: MathXL for School: Enrichment" : "1-2_MXL_ENRCH"
    ,"1-2: MathXL for School: Practice & Problem Solving" : "1-2_MXL_PPS"
    ,"1-2: MathXL for School: Practice & Problem Solving Version A" : "1-2_MXL_PPSVA"
    ,"1-2: MathXL for School: Practice & Problem Solving Version B" : "1-2_MXL_PPSVB"
    ,"1-2: Solving Equations with Variables on Both Sides" : "1-2_SEWVBS"
    ,"1-2: Solving Equations with Variables on Both Sides " : "1-2_SEWVBS"
    ,"1-3: MathXL for School: Additional Practice" : "1-3_MXL_AP"
    ,"1-3: MathXL for School: Enrichment" : "1-3_MXL_ENRCH"
    ,"1-3: MathXL for School: Practice & Problem Solving" : "1-3_MXL_PPS"
    ,"1-3: MathXL for School: Practice & Problem Solving Copy" : "1-3_MXL_PPSC"
    ,"1-3: MathXL for School: Practice & Problem Solving Copy " : "1-3_MXL_PPSC"
    ,"1-3: MathXL for School: Practice & Problem Solving S" : "1-3_MXL_PPSS"
    ,"1-3: MathXL for School: Practice & Problem Solving Version A" : "1-3_MXL_PPSVA"
    ,"1-3: Multiplying Fractions" : "1-3_MF"
    ,"1-3: Solving Literal Equations and Formulas" : "1-3_SLEF"
    ,"1-3: Solving Literal Equations and Formulas (9.2)" : "1-3_SLEF(9.2)"
    ,"1-4: MathXL for School: Additional Practice" : "1-4_MXL_AP"
    ,"1-4: MathXL for School: Practice & Problem Solving" : "1-4_MXL_PPS"
    ,"1-4: MathXL for School: Practice & Problem Solving Copy 1" : "1-4_MXL_PPSC1"
    ,"1-4: MathXL for School: Practice & Problem Solving Version A" : "1-4_MXL_PPSVA"
    ,"1-4: MathXL for School: Practice & Problem Solving Version B" : "1-4_MXL_PPSVB"
    ,"1-4: MathXL for School: Practice and Problem Solving " : "1-4_MXL_PPS"
    ,"1-4: Solving Inequalities in One Variable" : "1-4_SIOV"
    ,"1-4: Understanding Division with Fractions" : "1-4_UDWF"
    ,"1-5: Compound Inequalities" : "1-5_CI"
    ,"1-5: Compound Inequalities " : "1-5_CI"
    ,"1-5: Dividing Fractions by Fractions" : "1-5_DFBF"
    ,"1-5: MathXL for School: Additional Practice" : "1-5_MXL_AP"
    ,"1-5: MathXL for School: Practice & Problem Solving" : "1-5_MXL_PPS"
    ,"1-5: MathXL for School: Practice & Problem Solving Version A" : "1-5_MXL_PPSVA"
    ,"1-5: MathXL for School: Practice & Problem Solving Version B" : "1-5_MXL_PPSVB"
    ,"1-6: Divide Mixed Numbers" : "1-6_DMN"
    ,"1-6: MathXL for School: Additional Practice" : "1-6_MXL_AP"
    ,"1-6: MathXL for School: Practice & Problem Solving" : "1-6_MXL_PPS"
    ,"1-6: MathXL for School: Practice & Problem Solving Medium" : "1-6_MXL_PPSM"
    ,"1-6: MathXL for School: Practice & Problem Solving Spicy" : "1-6_MXL_PPSS"
    ,"1-6: MathXL for School: Practice & Problem Solving Version A" : "1-6_MXL_PPSVA"
    ,"1-6: MathXL for School: Practice & Problem Solving Version B" : "1-6_MXL_PPSVB"
    ,"1-6: Multiplying Integers" : "1-6_MI"
    ,"1-7: MathXL for School: Practice & Problem Solving" : "1-7_MXL_PPS"
    ,"1-7: MathXL for School: Practice & Problem Solving " : "1-7_MXL_PPS"
    ,"1-7: MathXL for School: Practice & Problem Solving Version A" : "1-7_MXL_PPSVA"
    ,"1-7: MathXL for School: Practice & Problem Solving Version B" : "1-7_MXL_PPSVB"
    ,"1-7: Multiplying Rational Numbers" : "1-7_MRN"
    ,"1-7: Problem Solving with Rational Numbers" : "1-7_PSWRN"
    ,"1-8: Dividing Integers" : "1-8_DI"
    ,"1-8: MathXL for School: Practice & Problem Solving" : "1-8_MXL_PPS"
    ,"1-8: MathXL for School: Practice & Problem Solving " : "1-8_MXL_PPS"
    ,"1-8: MathXL for School: Practice & Problem Solving Version A" : "1-8_MXL_PPSVA"
    ,"1-8: MathXL for School: Practice & Problem Solving Version B" : "1-8_MXL_PPSVB"
    ,"1-8: MathXL for School: Practice & Problem Solving Version C" : "1-8_MXL_PPSVC"
    ,"1-9: Dividing Rational Numbers" : "1-9_DRN"
    ,"1-9: MathXL for School: Additional Practice" : "1-9_MXL_AP"
    ,"1-9: MathXL for School: Additional Practice Copy M" : "1-9_MXL_APCM"
    ,"1-9: MathXL for School: Practice & Problem Solving" : "1-9_MXL_PPS"
    ,"1-9: MathXL for School: Practice & Problem Solving Version A" : "1-9_MXL_PPSVA"
    ,"1-9: MathXL for School: Practice & Problem Solving Version B" : "1-9_MXL_PPSVB"
    ,"1-9: MathXL for School: Practice & Problem Solving Version C" : "1-9_MXL_PPSVC"
    ,"2-1: Connect Ratios, Rates and Unit Rates" : "2-1_CRRUR"
    ,"2-1: MathXL for School: Practice & Problem Solving" : "2-1_MXL_PPS"
    ,"2-1: MathXL for School: Practice & Problem Solving Version A" : "2-1_MXL_PPSVA"
    ,"2-2: Determine Unit Rates with Ratios and Fractions" : "2-2_DURRF"
    ,"2-2: MathXL for School: Additional Practice" : "2-2_MXL_AP"
    ,"2-2: MathXL for School: Enrichment" : "2-2_MXL_ENRCH"
    ,"2-2: MathXL for School: Practice & Problem Solving" : "2-2_MXL_PPS"
    ,"2-2: MathXL for School: Practice & Problem Solving Version A" : "2-2_MXL_PPSVA"
    ,"2-2: Rational Numbers on Number Lines" : "2-2_RNNL"
    ,"2-2:Additional Practice" : "2-2_AP"
    ,"2-3: Absolute Value" : "2-3_AV"
    ,"2-3: Absolute Value " : "2-3_AV"
    ,"2-3: Additional Practice" : "2-3_AP"
    ,"2-3: Additional Practice " : "2-3_AP"
    ,"2-3: MathXL for School: Practice & Problem Solving" : "2-3_MXL_PPS"
    ,"2-3: MathXL for School: Practice & Problem Solving Version A" : "2-3_MXL_PPSVA"
    ,"2-4: Constant of Proportionality" : "2-4_CP"
    ,"2-4: MathXL for School: Practice & Problem Solving" : "2-4_MXL_PPS"
    ,"2-4: MathXL for School: Practice & Problem Solving Version A" :  "2-4_MXL_PPSVA"
    ,"2-4: Rational Number on the Coordinate Plane" : "2-4_RNCP"
    ,"2-5: Distances on the Coordinate Plane" : "2-5_DCP"
    ,"2-5: MathXL for School: Practice & Problem Solving" : "2-5_MXL_PPS"
    ,"2-5: MathXL for School: Practice & Problem Solving Version A" : "2-5_MXL_PPSVA"
    ,"2-6: MathXL for School: Practice & Problem Solving" : "2-6_MXL_PPS"
    ,"2-7: MathXL for School: Practice & Problem Solving" : "2-7_MXL_PPS"
    ,"2-8: MathXL for School: Practice & Problem Solving" : "2-8_MXL_PPS"
    ,"2-9: MathXL for School: Practice & Problem Solving" : "2-9_MXL_PPS"
    ,"3-1: MathXL for School: Practice & Problem Solving" : "3-1_MXL_PPS"
    ,"3-1: MathXL for School: Practice & Problem Solving Version A" : "3-1_MXL_PPSVA"
    ,"3-2: Connecting Percent and Proportion" : "3-2_CPP"
    ,"3-2: GCF and LCM" : "3-2_GCF_LCM"
    ,"3-2: MathXL for School: Additional Practice" : "3-2_MXL_AP"
    ,"3-2: MathXL for School: Additional Practice " : "3-2_MXL_AP"
    ,"3-2: MathXL for School: Practice & Problem Solving" : "3-2_MXL_PPS"
    ,"3-2: MathXL for School: Practice & Problem Solving Version A" : "3-2_MXL_PPSVA"
    ,"3-2: MathXL for School: Practice & Problem Solving Version A " : "3-2_MXL_PPSVA"
    ,"3-3: Create and Evaluate Numerical Expressions" : "3-3_CENE"
    ,"3-3: MathXL for School: Practice & Problem Solving"  : "3-3_MXL_PPS"
    ,"3-3: MathXL for School: Practice & Problem Solving Version A" : "3-3_MXL_PPSVA"
    ,"3-3: Proportion and the Percent Equation" : "3-3_PPE"
    ,"3-4: MathXL for School: Practice & Problem Solving" : "3-4_MXL_PPS"
    ,"3-4: MathXL for School: Practice & Problem Solving Version A" : "3-4_MXL_PPSVA"
    ,"3-4: Percent Change and Percent Error" : "3-4_PCPE"
    ,"3-4: Writing Algebraic Expresions" : "3-4_WAE"
    ,"3-5: Evaluating Algebraic Expressions" : "3-5_EAE"
    ,"3-5: MathXL for School: Additional Practice Copy 1" : "3-5_MXL_APC1"
    ,"3-5: MathXL for School: Practice & Problem Solving" : "3-5_MXL_PPS"
    ,"3-5: MathXL for School: Practice & Problem Solving Version A" : "3-5_MXL_PPSVA"
    ,"3-5: Percent Mark Up and Mark Down" : "3-5_PMUMD"
    ,"3-5: Scatter Plots and Lines of Fit" : "3-5_SPLF"
    ,"3-6: MathXL for School: Additional Practice Copy 1" : "3-6_MXL_APC1"
    ,"3-6: MathXL for School: Practice & Problem Solving" : "3-6_MXL_PPS"
    ,"3-6: MathXL for School: Practice & Problem Solving Version A" : "3-6_MXL_PPSVA"
    ,"3-6: Simple Interest" : "3-6_SI"
    ,"3-7: MathXL for School: Practice & Problem Solving" : "3-7_MXL_PPS"
    ,"4-1: Generate Equivalent Expressions" : "4-1_GEE"
    ,"4-1: MathXL for School: Practice & Problem Solving" : "4-1_MXL_PPS"
    ,"4-1: MathXL for School: Practice & Problem Solving 7B-1" : "4-1_MXL_PPS_7B_1"
    ,"4-1: MathXL for School: Practice & Problem Solving Version A" : "4-1_MXL_PPSVA"
    ,"4-1: MathXL for School: Practice and Problem Solving" : "4-1_MXL_PPS"
    ,"4-1: Solving Systems of Equations by Graphing" : "4-1_SSEG"
    ,"4-1: Solving Systems of Equations by Graphing " : "4-1_SSEG"
    ,"4-2: Apply Properties of Equality" : "4-2_APE"
    ,"4-2: Apply Properties of Equality " : "4-2_APE"
    ,"4-2: Generate Equivalent Expressions" : "4-2_GEE"
    ,"4-2: MathXL for School: Practice & Problem Solving" : "4-2_MXL_PPS"
    ,"4-2: Solving Systems of Equations Using Substitution (GR9)" : "4-2_SSEUS_GR_9"
    ,"4-2: Solving Systems of Linear Equations Using Substitution" : "4-2_SSLEUS"
    ,"4-3: MathXL for School: Additional Practice Copy 1" : "4-3_MXL_APC1"
    ,"4-3: MathXL for School: Practice & Problem Solving" : "4-3_MXL_PPS"
    ,"4-3: MathXL for School: Practice & Problem Solving Version A" : "4-3_MXL_PPSVA"
    ,"4-3: Solving Systems of Equations Using Elimination (Gr 8)" : "4-3_SSEUE_GR_8"
    ,"4-3: Solving Systems of Equations Using Elimination (Gr 9)" : "4-3_SSEUE_GR_9"
    ,"4-4: Inequalities in Two Variables (Gr 8)" : "4-4_ITV_GR_8"
    ,"4-4: Inequalities in Two Variables (Gr 9)" : "4-4_ITV_GR_9"
    ,"4-4: MathXL for School: Practice & Problem Solving" : "4-4_MXL_PPS"
    ,"4-4: MathXL for School: Practice & Problem Solving Version A" : "4-4_MXL_PPSVA"
    ,"4-4: Solving Equations with Multiplication and Division AP" : "4-4_SEMD_AP"
    ,"4-5: MathXL for School: Practice & Problem Solving" : "4-5_MXL_PPS"
    ,"4-5: MathXL for School: Practice & Problem Solving Version A" : "4-5_MXL_PPSVA"
    ,"4-5: Solving Systems of Inequalities (Gr 8)" : "4-5_SSI_GR_8"
    ,"4-5: Solving Systems of Inequalities (Gr 9)" : "4-5_SSI_GR_9"
    ,"4-6: MathXL for School: Practice & Problem Solving" : "4-6_MXL_PPS"
    ,"4-7: MathXL for School: Practice & Problem Solving" : "4-7_MXL_PPS"
    ,"5-1: MathXL for School: Practice & Problem Solving" : "5-1_MXL_PPS"
    ,"5-1: MathXL for School: Practice & Problem Solving Version A" : "5-1_MXL_PPSVA"
    ,"5-1: Rational Exponents and Properties of Exponents" : "5-1_REPE"
    ,"5-1: Rational Exponents and Properties of Exponents " : "5-1_REPE"
    ,"5-1: Write Two Step Equations" : "5-1_WTSE"
    ,"5-2: Exponential Functions" : "5-2_EF"
    ,"5-2: Generate Equivalent Ratios" : "5-2_GER"
    ,"5-2: MathXL for School: Practice & Problem Solving" : "5-2_MXL_PPS"
    ,"5-2: MathXL for School: Practice & Problem Solving Version A" : "5-2_MXL_PPSVA"
    ,"5-2: Solve Two Step Equations" : "5-2_STSE"
    ,"5-3: Additional Practice" : "5-3_AP"
    ,"5-3: Additional Practice " : "5-3_AP"
    ,"5-3: MathXL for School: Practice & Problem Solving" : "5-3_MXL_PPS"
    ,"5-3: MathXL for School: Practice & Problem Solving Version A" : "5-3_MXL_PPSVA"
    ,"5-3: Solving Equations Using the Distributive Property" : "5-3_SEUDP"
    ,"5-4: MathXL for School: Practice & Problem Solving" : "5-4_MXL_PPS"
    ,"5-4: MathXL for School: Practice & Problem Solving Version A" : "5-4_MXL_PPSVA"
    ,"5-4: Represent and Graph Ratios" : "5-4_RGR"
    ,"5-5: MathXL for School: Practice & Problem Solving" : "5-5_MXL_PPS"
    ,"5-5: MathXL for School: Practice & Problem Solving Version A" : "5-5_MXL_PPSVA"
    ,"5-5: Transformations of Exponential Functions" : "5-5_TEF"
    ,"5-6: MathXL for School: Practice & Problem Solving" : "5-6_MXL_PPS"
    ,"5-6: MathXL for School: Practice & Problem Solving Version A" : "5-6_MXL_PPSVA"
    ,"5-7: MathXL for School: Practice & Problem Solving" : "5-7_MXL_PPS"
    ,"5-7: MathXL for School: Practice & Problem Solving Version A" : "5-7_MXL_PPSVA"
    ,"6-8: MathXL for School: Practice & Problem Solving" : "6-8_MXL_PPS"
    ,"6-9: MathXL for School: Practice & Problem Solving" : "6-9_MXL_PPS"
    ,"7-1: MathXL for School: Practice & Problem Solving" : "7-1_MXL_PPS"
    ,"7-2: MathXL for School: Practice & Problem Solving" : "7-2_MXL_PPS"
    ,"7-3: MathXL for School: Practice & Problem Solving Version A" : "7-3_MXL_PPSVA"
    ,"7-4: MathXL for School: Practice & Problem Solving" : "7-4_MXL_PPS"
    ,"8-2: Mean, Median, Mode" : "8-2_MMM"
    ,"8-4: MathXL for School: Practice & Problem Solving" : "8-4_MXL_PPS"
    ,"8-4: MathXL for School: Practice & Problem Solving Version A" : "8-4_MXL_PPSVA"
    ,"Bellwork: Mean, Median, Mode, and Range" : "BELL_MMMR"
    ,"Exponential Functions Reassessment Assignment" : "EFRA"
    ,"Exponential Functions Reassessment Assignment " : "EFRA"
    ,"Major Summative #1 Retake Questions" : "MS_1_RQ"
    ,"Major Summative #1 Retake Questions " : "MS_1_RQ"
    ,"Major Summative #2 Retake Question Set" : "MS_2_RQS"
    ,"Major Summative #3 Retake Problem Set" : "MS_3_RPS"
    ,"Major Summative #4 Retake Problem Set" : "MS_4_RPS"
    ,"Major Summative #5 Retake Problem Set" : "MS_5_RPS"
    ,"Major Summative Retake #3" : "MS_R3"
    ,"Major Summative Retake #3 " : "MS_R3"
    ,"Major Summative Retake Problem Set" : "MS_RPS"
    ,"Reassessment Practice Task" : "RPT"
    ,"Reassessment Practice Task " : "RPT"
    ,"Savvas Lesson Major Summative #3 Retake Problem Set" : "MS_3_RPS"
    ,"Solving Inequalities Reassessment Assignment" : "SIRA"
    ,"Statistics Reassessment Assignment" : "SRA"
    ,"Statistics Reassessment Assignment " : "SRA"
    ,"Summative #2 Retake Practice Questions" : "S_2_RPQ"
    ,"Topic 1 Mid-Topic Assessment" : "TP1_MTA"
    ,"Topic 1 ReAssessment Prep" : "TP1_RP"
    ,"Topic 5 Mid-Topic Assessment" : "TP5_MTA"
    ,"Unit 1 Part II Review: MathXL for School: Retake Questions" : "U1P2_MXL_RQ"
    ,"Unit 1 Part II Review: Retake Questions" : "U1P2_RQ"
    ,"Unit 2 Major Summative Retake Review" : "U2_MS_RR"
    ,"Unit 2 Major Summative Retake Review " : "U2_MS_RR"
    ,"Unit 2 Reassessment Task" : "U2_RT"
    ,"Unit 3 Major Summative Retake Questions" : "U3_MS_RQ"
    ,"Unit 4 Reassessment Assignment" : "U4_RA"

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
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

        var studentName = row.getField("STUDENT_NAME");
            if (studentName !== null) {
                var newName = studentName.split(" ");
                var studentFirstName = newName[0];
                var studentLastName = newName[1];
            }

        var tad = row.getField("TEST_DATE");
        if (tad !== null){
        var testDate = tad.split(' ')[0];
                if(testDate!==null && testDate!==undefined){
                    testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
                }
                else{
                    testDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
                }
            }


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
                    record.TEST_ADMIN_DATE = testDate;
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = studentFirstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = studentLastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'), null);
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField('GRADE')], null);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
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
    function mapAdditionalAdminFields(row) {
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + getGrade(row) + "_" + assessmentNameDecode[row.getField("ASSESSMENT")];
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        var maxScore = row.getField(testMetadata.FIELD + "_MAX_SCORE");
        var percentScore = row.getField(testMetadata.FIELD + "_PERCENT_SCORE");
        var assessment = row.getField("ASSESSMENT")


        // Check for key fields and do not map score and exit if conditions met.
        if((rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") &&
        (maxScore === null || maxScore === undefined || _util.trim(maxScore) === "--" || _util.trim(maxScore) === "") &&
        (percentScore === null || percentScore === undefined || _util.trim(percentScore) === "--" || _util.trim(percentScore) === ""))
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PERCENTAGE_SCORE"] = percentScore.replace("%", '');//TODO make sure it isn't undefined or null here
        score["TEST_ITEMS_POSSIBLE"] = maxScore;
        score["TEST_SCORE_ATTRIBUTES"] = assessment;


        return score;
    }

    function getGrade(row, testMetadata) {
        var commonGrade = "";
        var extractGrade = row.getField("PROGRAM");
        if (extractGrade.indexOf('Common Core Grade 6') > -1){
                commonGrade = "CCG6";
        }else if(extractGrade.indexOf('Common Core Grade 7') > -1){
                commonGrade = "CCG7";
        }else if(extractGrade.indexOf('Common Core Grade 8') > -1){
                commonGrade = "CCG8";
        }else{
                commonGrade = "CCGHS";
             }
        return commonGrade;
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());