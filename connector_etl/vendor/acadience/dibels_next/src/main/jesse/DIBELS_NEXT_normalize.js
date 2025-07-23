var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "DIBELS Next";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print(`Loading using signature file ${signatureFormatName} \n`);

            var normalizedFile = AppUtil.createResultsFile(file);
            print(`file name ${normalizedFile} \n`);

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

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("TRANSFORM", ["RECORDS"],
                    function (output, rows) {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
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
    const GLOBAL = { normalizedFileFields : null };

    var strandsAndFields =
        [
            // DIBELS V6 STRANDS

            // DIBELS NEXT STRANDS
            { TEST: "DIBNXT", STRAND: "FSF", FIELD: "FSF" },
            { TEST: "DIBNXT", STRAND: "LNF", FIELD: "LNF" },
            { TEST: "DIBNXT", STRAND: "PSF", FIELD: "PSF" },
            { TEST: "DIBNXT", STRAND: "TOT", FIELD: "COMPOSITE" },


            { TEST: "DIBNXT", STRAND: "NWFCLS", FIELD: "NWF-CLS" },
            { TEST: "DIBNXT", STRAND: "NWFWWR", FIELD: "NWF-WWR" },
            { TEST: "DIBNXT", STRAND: "DORFWC", FIELD: "DORF-WORDSCORRECT" },
            { TEST: "DIBNXT", STRAND: "DORFERR", FIELD: "DORF-ERRORS" },
            { TEST: "DIBNXT", STRAND: "DORFACC", FIELD: "DORF-ACCURACY" },
            { TEST: "DIBNXT", STRAND: "DORFRT", FIELD: "DORF-RETELL" },
            { TEST: "DIBNXT", STRAND: "DORFRQ", FIELD: "DORF-RETELLQUALITY" },
            { TEST: "DIBNXT", STRAND: "DAZECOR", FIELD: "DAZE-CORRECT" },
            { TEST: "DIBNXT", STRAND: "DAZEINC", FIELD: "DAZE-INCORRECT" },
            { TEST: "DIBNXT", STRAND: "DAZEADJ", FIELD: "DAZE-ADJUSTED" },
            {TEST: "DIBNXT", STRAND: "DAZE", FIELD: "DAZE"},

            {TEST: "DIBNXT", STRAND: "DORFFL", FIELD: "DORF-FLUENCY"},

            {TEST: "DIBNXT", STRAND: "NWFVOCAB" , FIELD: "VOCABULARY"},
            {TEST: "DIBNXT", STRAND: "NWFSPEL" , FIELD: "SPELLING"},
            {TEST: "DIBNXT", STRAND: "NWFRAN" , FIELD: "RAN"},
            {TEST: "DIBNXT", STRAND: "NWFRISK" , FIELD: "RISK_INDICATOR"},

            { TEST: "DIBNXT", STRAND: "ARK6ACC", FIELD: "ARK6_ACCURACY" },
            { TEST: "DIBNXT", STRAND: "ARK6MAS", FIELD: "ARK6_MAZ_ADJ_SC" },
            { TEST: "DIBNXT", STRAND: "ARK6TOT", FIELD: "ARK6_COMPOSITE" },
            { TEST: "DIBNXT", STRAND: "ACC", FIELD: "ACCURACY" },
            { TEST: "DIBNXT", STRAND: "ORFERR", FIELD: "ERR" },
            { TEST: "DIBNXT", STRAND: "MAZEADJ", FIELD: "MAZ_ADJ_SC" },
            { TEST: "DIBNXT", STRAND: "MAZC", FIELD: "MAZC" },
            { TEST: "DIBNXT", STRAND: "MAZI", FIELD: "MAZI" },
            { TEST: "DIBNXT", STRAND: "ORF", FIELD: "ORF" },
            { TEST: "DIBNXT", STRAND: "ORF", FIELD: "DORF" },
            { TEST: "DIBNXT", STRAND: "RT", FIELD: "RETELL" },
            { TEST: "DIBNXT", STRAND: "ORFRQ", FIELD: "RETELLQR" },
            { TEST: "DIBNXT", STRAND: "CLS", FIELD: "CLS" },
            { TEST: "DIBNXT", STRAND: "WWR", FIELD: "WWR" },
,
            { TEST: "DIBNXT", STRAND: "BQD", FIELD: "BQD" },
            { TEST: "DIBNXT", STRAND: "NIF", FIELD: "NIF" },
            { TEST: "DIBNXT", STRAND: "NNF", FIELD: "NNF" },
            { TEST: "DIBNXT", STRAND: "AM_COMPOSITE", FIELD: "AM_COMPOSITE" },
            { TEST: "DIBNXT", STRAND: "AQD", FIELD: "AQD" },
            { TEST: "DIBNXT", STRAND: "MNF", FIELD: "MNF" },
            { TEST: "DIBNXT", STRAND: "AM_COMPUTATION", FIELD: "AM_COMPUTATION" },
            { TEST: "DIBNXT", STRAND: "COMPA", FIELD: "COMPA" },
            { TEST: "DIBNXT", STRAND: "COMPB", FIELD: "COMPB" },
            { TEST: "DIBNXT", STRAND: "CA", FIELD: "CA" },

            // PASSAGE SCORES
            { TEST: "DIBNXT", STRAND: "ORWC_P1", FIELD: "ORAL_READING_PASSAGE1_WORDCORRECT" },
            { TEST: "DIBNXT", STRAND: "ORWC_P2", FIELD: "ORAL_READING_PASSAGE2_WORDCORRECT" },
            { TEST: "DIBNXT", STRAND: "ORWC_P3", FIELD: "ORAL_READING_PASSAGE3_WORDCORRECT" },
            { TEST: "DIBNXT", STRAND: "ORWC_TOT", FIELD: "ORAL_READING_WORDCORRECT_TOTAL" },
            { TEST: "DIBNXT", STRAND: "ORWC_PM_TOT", FIELD: "ORAL_READING_WORDCORRECT_PER-MIN_TOTAL" },
            { TEST: "DIBNXT", STRAND: "ORERR_P1", FIELD: "ORAL_READING_PASSAGE1_ERRORS" },
            { TEST: "DIBNXT", STRAND: "ORERR_P2", FIELD: "ORAL_READING_PASSAGE2_ERRORS" },
            { TEST: "DIBNXT", STRAND: "ORERR_P3", FIELD: "ORAL_READING_PASSAGE3_ERRORS" },
            { TEST: "DIBNXT", STRAND: "ORERR_TOT", FIELD: "ORAL_READING_ERRORS_TOTAL" },
            { TEST: "DIBNXT", STRAND: "ORCOMP_P1", FIELD: "ORAL_READING_PASSAGE1_COMPREHENSION" },
            { TEST: "DIBNXT", STRAND: "ORCOMP_P2", FIELD: "ORAL_READING_PASSAGE2_COMPREHENSION" },
            { TEST: "DIBNXT", STRAND: "ORCOMP_P3", FIELD: "ORAL_READING_PASSAGE3_COMPREHENSION" },
            { TEST: "DIBNXT", STRAND: "ORCOMP_TOT", FIELD: "ORAL_READING_COMPREHENSION_TOTAL" },
            { TEST: "DIBNXT", STRAND: "ORACC_P1", FIELD: "ORAL_READING_PASSAGE1_ACCURACY" },
            { TEST: "DIBNXT", STRAND: "ORACC_P2", FIELD: "ORAL_READING_PASSAGE2_ACCURACY" },
            { TEST: "DIBNXT", STRAND: "ORACC_P3", FIELD: "ORAL_READING_PASSAGE3_ACCURACY" },
            { TEST: "DIBNXT", STRAND: "ORACC_TOT", FIELD: "ORAL_READING_ACCURACY_TOTAL" },

            { TEST: "DIBNXT", STRAND: "MAZCOR_P1", FIELD: "MAZE_PASSAGE1_CORRECT" },
            { TEST: "DIBNXT", STRAND: "MAZCOR_P2", FIELD: "MAZE_PASSAGE2_CORRECT" },
            { TEST: "DIBNXT", STRAND: "MAZCOR_P3", FIELD: "MAZE_PASSAGE3_CORRECT" },
            { TEST: "DIBNXT", STRAND: "MAZINCOR_P1", FIELD: "MAZE_PASSAGE1_INCORRECT" },
            { TEST: "DIBNXT", STRAND: "MAZINCOR_P2", FIELD: "MAZE_PASSAGE2_INCORRECT" },
            { TEST: "DIBNXT", STRAND: "MAZINCOR_P3", FIELD: "MAZE_PASSAGE3_INCORRECT" },
            { TEST: "DIBNXT", STRAND: "SR_P1", FIELD: "SILENT_READING_PASSAGE1" },
            { TEST: "DIBNXT", STRAND: "SR_P2", FIELD: "SILENT_READING_PASSAGE2" },
            { TEST: "DIBNXT", STRAND: "SR_P3", FIELD: "SILENT_READING_PASSAGE3" },
            { TEST: "DIBNXT", STRAND: "SRTOT", FIELD: "SILENT_READING_TOTAL" },
            { TEST: "DIBNXT", STRAND: "MAZADJ_P1", FIELD: "MAZE_PASSAGE1_ADJUSTED_SCORE" },
            { TEST: "DIBNXT", STRAND: "MAZADJ_P2", FIELD: "MAZE_PASSAGE2_ADJUSTED_SCORE" },
            { TEST: "DIBNXT", STRAND: "MAZADJ_P3", FIELD: "MAZE_PASSAGE3_ADJUSTED_SCORE" },
            { TEST: "DIBNXT", STRAND: "MAZADJ_TOT", FIELD: "MAZE_ADJUSTED_TOTAL_SCORE" },
            { TEST: "DIBNXT", STRAND: "GATE1", FIELD: "GATE1_SCORE" },
            { TEST: "DIBNXT", STRAND: "GATE2", FIELD: "GATE2_SCORE" },
        ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLevels =
        [
            { GRADE_CODE: "KG", FIELD: "K" },
            { GRADE_CODE: "01", FIELD: "1ST" },
            { GRADE_CODE: "02", FIELD: "2ND" },
            { GRADE_CODE: "03", FIELD: "3RD" },
            { GRADE_CODE: "04", FIELD: "4TH" },
            { GRADE_CODE: "05", FIELD: "5TH" },
            { GRADE_CODE: "06", FIELD: "6TH" },
            { GRADE_CODE: "07", FIELD: "7TH" },
            { GRADE_CODE: "08", FIELD: "8TH" },

            { GRADE_CODE: "01", FIELD: "1" },
            { GRADE_CODE: "02", FIELD: "2" },
            { GRADE_CODE: "03", FIELD: "3" },
            { GRADE_CODE: "04", FIELD: "4" },
            { GRADE_CODE: "05", FIELD: "5" },
            { GRADE_CODE: "06", FIELD: "6" },
            { GRADE_CODE: "07", FIELD: "7" },
            { GRADE_CODE: "08", FIELD: "8" },


         ];

    var assessPeriods =
        [
            { PERIOD_CODE: "BEG", FIELD: "BEG" },
            { PERIOD_CODE: "MID", FIELD: "MID" },
            { PERIOD_CODE: "END", FIELD: "END" }
        ];

    //performance level cutoffs
    var perfCutoffs = {
        // FSF
        "FSF_K_BEGINNING": {
            "Intensive Support": "4",
            "Strategic Support": "9"
        },
        "FSF_K_BEG": {
            "Intensive Support": "4",
            "Strategic Support": "9"
        },
        "FSF_K_MIDDLE": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        "FSF_K_MID": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
         // Kinder Garten
        //BQD
        "BQD_K_BEG":{
            "Intensive Support": "1",
            "Strategic Support": "4"
        },
        //NIF
        "NIF_K_BEG":{
            "Intensive Support": "3",
            "Strategic Support": "5"
        },
        //NNF
        "NNF_K_BEG":{
             "Intensive Support": "1",
             "Strategic Support": "4"
        },

        // Composite
        // Kinder Garten
        "COMPOSITE_K_BEGINNING": {
            "Intensive Support": "12",
            "Strategic Support": "25"
        },
        "COMPOSITE_K_BEG": {
            "Intensive Support": "12",
            "Strategic Support": "25"
        },
        "COMPOSITE_K_MIDDLE": {
            "Intensive Support": "84",
            "Strategic Support": "121"
        },
        "COMPOSITE_K_MID": {
            "Intensive Support": "84",
            "Strategic Support": "121"
        },
        "COMPOSITE_K_END": {
            "Intensive Support": "88",
            "Strategic Support": "118"
        },
        //AM_COMPOSITE
        // Kinder Garten
        "AM_COMPOSITE_K_BEG": {
            "Intensive Support": "12",
            "Strategic Support": "23"
        },
        //ARK6_COMPOSITE
        //Kinder Garten
        "ARK6_COMPOSITE_K_BEG": {
            "Intensive Support": "12",
            "Strategic Support": "25"
        },
        "ARK6_COMPOSITE_K_MID": {
             "Intensive Support": "84",
             "Strategic Support": "121"
        },
        "ARK6_COMPOSITE_K_END":{
            "Intensive Support": "88",
            "Strategic Support": "118"

        },

        // Grade 01
        "COMPOSITE_1ST_BEGINNING": {
            "Intensive Support": "96",
            "Strategic Support": "112"
        },
        "COMPOSITE_1ST_BEG": {
            "Intensive Support": "96",
            "Strategic Support": "112"
        },
        "COMPOSITE_1ST_MIDDLE": {
            "Intensive Support": "99",
            "Strategic Support": "129"
        },
        "COMPOSITE_1ST_MID": {
            "Intensive Support": "99",
            "Strategic Support": "129"
        },
        "COMPOSITE_1ST_END": {
            "Intensive Support": "110",
            "Strategic Support": "154"
        },
        "COMPOSITE_1_BEGINNING": {
            "Intensive Support": "96",
            "Strategic Support": "112"
        },
        "COMPOSITE_1_BEG": {
            "Intensive Support": "96",
            "Strategic Support": "112"
        },
        "COMPOSITE_1_MIDDLE": {
            "Intensive Support": "99",
            "Strategic Support": "129"
        },
        "COMPOSITE_1_MID": {
            "Intensive Support": "99",
            "Strategic Support": "129"
        },
        "COMPOSITE_1_END": {
            "Intensive Support": "110",
            "Strategic Support": "154"
        },
        //ARK_COMPOSITE
        //GRADE 01
        "ARK6_COMPOSITE_1_BEG":{
            "Intensive Support": "96",
            "Strategic Support": "112"
        },
        "ARK6_COMPOSITE_1_MID":{
            "Intensive Support": "99",
            "Strategic Support": "129"
        },
        "ARK6_COMPOSITE_1_END":{
            "Intensive Support": "110",
            "Strategic Support": "154"
        },
        // Grade 02
        "COMPOSITE_2ND_BEGINNING": {
            "Intensive Support": "108",
            "Strategic Support": "140"
        },
        "COMPOSITE_2ND_BEG": {
            "Intensive Support": "108",
            "Strategic Support": "140"
        },
        "COMPOSITE_2ND_MIDDLE": {
            "Intensive Support": "144",
            "Strategic Support": "189"
        },
        "COMPOSITE_2ND_MID": {
            "Intensive Support": "144",
            "Strategic Support": "189"
        },
        "COMPOSITE_2ND_END": {
            "Intensive Support": "179",
            "Strategic Support": "237"
        },
        "COMPOSITE_2_BEGINNING": {
            "Intensive Support": "108",
            "Strategic Support": "140"
        },
        "COMPOSITE_2_BEG": {
            "Intensive Support": "108",
            "Strategic Support": "140"
        },
        "COMPOSITE_2_MIDDLE": {
            "Intensive Support": "144",
            "Strategic Support": "189"
        },
        "COMPOSITE_2_MID": {
            "Intensive Support": "144",
            "Strategic Support": "189"
        },
        "COMPOSITE_2_END": {
            "Intensive Support": "179",
            "Strategic Support": "237"
        },
        //ARK_COMPOSITE
        //GRADE 02
        "ARK6_COMPOSITE_2_BEG":{
            "Intensive Support": "108",
            "Strategic Support": "140"
        },
        "ARK6_COMPOSITE_2_MID":{
             "Intensive Support": "144",
             "Strategic Support": "189"
        },
        "ARK6_COMPOSITE_2_END":{
             "Intensive Support": "179",
             "Strategic Support": "237"
        },
        // Grade 03
        "COMPOSITE_3RD_BEGINNING": {
            "Intensive Support": "179",
            "Strategic Support": "219"
        },
        "COMPOSITE_3RD_BEG": {
            "Intensive Support": "179",
            "Strategic Support": "219"
        },
        "COMPOSITE_3RD_MIDDLE": {
            "Intensive Support": "234",
            "Strategic Support": "284"
        },
        "COMPOSITE_3RD_MID": {
            "Intensive Support": "234",
            "Strategic Support": "284"
        },
        "COMPOSITE_3RD_END": {
            "Intensive Support": "279",
            "Strategic Support": "329"
        },
        "COMPOSITE_3_BEGINNING": {
            "Intensive Support": "179",
            "Strategic Support": "219"
        },
        "COMPOSITE_3_BEG": {
            "Intensive Support": "179",
            "Strategic Support": "219"
        },
        "COMPOSITE_3_MIDDLE": {
            "Intensive Support": "234",
            "Strategic Support": "284"
        },
        "COMPOSITE_3_MID": {
            "Intensive Support": "234",
            "Strategic Support": "284"
        },
        "COMPOSITE_3_END": {
            "Intensive Support": "279",
            "Strategic Support": "329"
        },
        //ARK_COMPOSITE
        //GRADE 03
        "ARK6_COMPOSITE_3_BEG":{
            "Intensive Support": "179",
            "Strategic Support": "219"
        },
        "ARK6_COMPOSITE_3_MID":{
             "Intensive Support": "234",
             "Strategic Support": "284"
        },
        "ARK6_COMPOSITE_3_END":{
              "Intensive Support": "279",
              "Strategic Support": "329"
        },
        // Grade 04
        "COMPOSITE_4TH_BEGINNING": {
            "Intensive Support": "244",
            "Strategic Support": "289"
        },
        "COMPOSITE_4TH_BEG": {
            "Intensive Support": "244",
            "Strategic Support": "289"
        },
        "COMPOSITE_4TH_MIDDLE": {
            "Intensive Support": "289",
            "Strategic Support": "329"
        },
        "COMPOSITE_4TH_MID": {
            "Intensive Support": "289",
            "Strategic Support": "329"
        },
        "COMPOSITE_4TH_END": {
            "Intensive Support": "329",
            "Strategic Support": "390"
        },
        "COMPOSITE_4_BEGINNING": {
            "Intensive Support": "244",
            "Strategic Support": "289"
        },
        "COMPOSITE_4_BEG": {
            "Intensive Support": "244",
            "Strategic Support": "289"
        },
        "COMPOSITE_4_MIDDLE": {
            "Intensive Support": "289",
            "Strategic Support": "329"
        },
        "COMPOSITE_4_MID": {
            "Intensive Support": "289",
            "Strategic Support": "329"
        },
        "COMPOSITE_4_END": {
            "Intensive Support": "329",
            "Strategic Support": "390"
        },
        //ARK_COMPOSITE
        //GRADE 04
        "ARK6_COMPOSITE_4_BEG":{
             "Intensive Support": "244",
             "Strategic Support": "289"
        },
        "ARK6_COMPOSITE_4_MID":{
             "Intensive Support": "289",
             "Strategic Support": "329"
        },
        "ARK6_COMPOSITE_4_END":{
             "Intensive Support": "329",
             "Strategic Support": "390"
        },
        // Grade 05
        "COMPOSITE_5TH_BEGINNING": {
            "Intensive Support": "257",
            "Strategic Support": "356"
        },
        "COMPOSITE_5TH_BEG": {
            "Intensive Support": "257",
            "Strategic Support": "356"
        },
        "COMPOSITE_5TH_MIDDLE": {
            "Intensive Support": "309",
            "Strategic Support": "371"
        },
        "COMPOSITE_5TH_MID": {
            "Intensive Support": "309",
            "Strategic Support": "371"
        },
        "COMPOSITE_5TH_END": {
            "Intensive Support": "339",
            "Strategic Support": "414"
        },
        "COMPOSITE_5_BEGINNING": {
            "Intensive Support": "257",
            "Strategic Support": "356"
        },
        "COMPOSITE_5_BEG": {
            "Intensive Support": "257",
            "Strategic Support": "356"
        },
        "COMPOSITE_5_MIDDLE": {
            "Intensive Support": "309",
            "Strategic Support": "371"
        },
        "COMPOSITE_5_MID": {
            "Intensive Support": "309",
            "Strategic Support": "371"
        },
        "COMPOSITE_5_END": {
            "Intensive Support": "339",
            "Strategic Support": "414"
        },
        //ARK_COMPOSITE
        //GRADE 05
        "ARK6_COMPOSITE_5_BEG":{
             "Intensive Support": "257",
             "Strategic Support": "356"
        },
        "ARK6_COMPOSITE_5_MID":{
             "Intensive Support": "309",
             "Strategic Support": "371"
        },
        "ARK6_COMPOSITE_5_END":{
              "Intensive Support": "339",
              "Strategic Support": "414"
        },
        // Grade 06
        "COMPOSITE_6TH_BEGINNING": {
            "Intensive Support": "279",
            "Strategic Support": "343"
        },
        "COMPOSITE_6TH_BEG": {
            "Intensive Support": "279",
            "Strategic Support": "343"
        },
        "COMPOSITE_6TH_MIDDLE": {
            "Intensive Support": "284",
            "Strategic Support": "357"
        },
        "COMPOSITE_6TH_MID": {
            "Intensive Support": "284",
            "Strategic Support": "357"
        },
        "COMPOSITE_6TH_END": {
            "Intensive Support": "323",
            "Strategic Support": "379"
        },
        "COMPOSITE_6_BEGINNING": {
            "Intensive Support": "279",
            "Strategic Support": "343"
        },
        "COMPOSITE_6_BEG": {
            "Intensive Support": "279",
            "Strategic Support": "343"
        },
        "COMPOSITE_6_MIDDLE": {
            "Intensive Support": "284",
            "Strategic Support": "357"
        },
        "COMPOSITE_6_MID": {
            "Intensive Support": "284",
            "Strategic Support": "357"
        },
        "COMPOSITE_6_END": {
            "Intensive Support": "323",
            "Strategic Support": "379"
        },
        //ARK_COMPOSITE
                //GRADE 05
        "ARK6_COMPOSITE_6_BEG":{
            "Intensive Support": "279",
            "Strategic Support": "343"
        },
        "ARK6_COMPOSITE_6_MID":{
             "Intensive Support": "284",
             "Strategic Support": "357"
        },
        "ARK6_COMPOSITE_6_END":{
             "Intensive Support": "323",
             "Strategic Support": "379"
        },


        // PSF
        // Kinder Garten
        "PSF_K_MIDDLE": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "PSF_K_MID": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "PSF_K_END": {
            "Intensive Support": "24",
            "Strategic Support": "39"
        },
        // Grade 01
        "PSF_1ST_BEGINNING": {
            "Intensive Support": "24",
            "Strategic Support": "39"
        },
        "PSF_1ST_BEG": {
            "Intensive Support": "24",
            "Strategic Support": "39"
        },
        "PSF_1_BEGINNING": {
            "Intensive Support": "24",
            "Strategic Support": "39"
        },
        "PSF_1_BEG": {
            "Intensive Support": "24",
            "Strategic Support": "39"
        },
        "PSF_F_MIDDLE": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "PSF_F_MID": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },

        // CLS
        // Kinder Garten
        "CLS_K_MIDDLE": {
            "Intensive Support": "7",
            "Strategic Support": "16"
        },
        "CLS_K_MID": {
            "Intensive Support": "7",
            "Strategic Support": "16"
        },
        "CLS_K_END": {
            "Intensive Support": "14",
            "Strategic Support": "27"
        },
        // Grade 01
        "CLS_1ST_BEGINNING": {
            "Intensive Support": "17",
            "Strategic Support": "26"
        },
        "CLS_1ST_BEG": {
            "Intensive Support": "17",
            "Strategic Support": "26"
        },
        "CLS_1ST_MIDDLE": {
            "Intensive Support": "32",
            "Strategic Support": "42"
        },
        "CLS_1ST_MID": {
            "Intensive Support": "32",
            "Strategic Support": "42"
        },
        "CLS_1ST_END": {
            "Intensive Support": "46",
            "Strategic Support": "57"
        },
        "CLS_1_BEGINNING": {
            "Intensive Support": "17",
            "Strategic Support": "26"
        },
        "CLS_1_BEG": {
            "Intensive Support": "17",
            "Strategic Support": "26"
        },
        "CLS_1_MIDDLE": {
            "Intensive Support": "32",
            "Strategic Support": "42"
        },
        "CLS_1_MID": {
            "Intensive Support": "32",
            "Strategic Support": "42"
        },
        "CLS_1_END": {
            "Intensive Support": "46",
            "Strategic Support": "57"
        },
        // Grade 02
        "CLS_2ND_BEGINNING": {
            "Intensive Support": "34",
            "Strategic Support": "53"
        },
        "CLS_2ND_BEG": {
            "Intensive Support": "34",
            "Strategic Support": "53"
        },
        "CLS_2_BEGINNING": {
            "Intensive Support": "34",
            "Strategic Support": "53"
        },
        "CLS_2_BEG": {
            "Intensive Support": "34",
            "Strategic Support": "53"
        },

        // WWR
        // Grade 01
        "NWF-WWR_1ST_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "0"
        },
        "NWF-WWR_1ST_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "0"
        },
        "NWF-WWR_1ST_MIDDLE": {
            "Intensive Support": "2",
            "Strategic Support": "7"
        },
        "NWF-WWR_1ST_MID": {
            "Intensive Support": "2",
            "Strategic Support": "7"
        },
        "NWF-WWR_1ST_END": {
            "Intensive Support": "5",
            "Strategic Support": "12"
        },
        "WWR_1_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "0"
        },
        "WWR_1_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "0"
        },
        "WWR_1_MIDDLE": {
            "Intensive Support": "2",
            "Strategic Support": "7"
        },
        "WWR_1_MID": {
            "Intensive Support": "2",
            "Strategic Support": "7"
        },
        "WWR_1_END": {
            "Intensive Support": "5",
            "Strategic Support": "12"
        },
        // Grade 02
        "NWF-WWR_2ND_BEGINNING": {
            "Intensive Support": "5",
            "Strategic Support": "12"
        },
        "NWF-WWR_2ND_BEG": {
            "Intensive Support": "5",
            "Strategic Support": "12"
        },
        "WWR_2_BEGINNING": {
            "Intensive Support": "5",
            "Strategic Support": "12"
        },
        "WWR_2_BEG": {
            "Intensive Support": "5",
            "Strategic Support": "12"
        },

        // ORF
        // Grade 01
        "DORF-WORDSCORRECT_1ST_MIDDLE": {
            "Intensive Support": "15",
            "Strategic Support": "22"
        },
        "DORF-WORDSCORRECT_1ST_MID": {
            "Intensive Support": "15",
            "Strategic Support": "22"
        },
        "DORF-WORDSCORRECT_1ST_END": {
            "Intensive Support": "31",
            "Strategic Support": "46"
        },
        "ORF_1_MIDDLE": {
            "Intensive Support": "15",
            "Strategic Support": "22"
        },
        "ORF_1_MID": {
            "Intensive Support": "15",
            "Strategic Support": "22"
        },
        "ORF_1_END": {
            "Intensive Support": "31",
            "Strategic Support": "46"
        },
        // Grade 02
        "DORF-WORDSCORRECT_2ND_BEGINNING": {
            "Intensive Support": "36",
            "Strategic Support": "51"
        },
        "DORF-WORDSCORRECT_2ND_BEG": {
            "Intensive Support": "36",
            "Strategic Support": "51"
        },
        "DORF-WORDSCORRECT_2ND_MIDDLE": {
            "Intensive Support": "54",
            "Strategic Support": "71"
        },
        "DORF-WORDSCORRECT_2ND_MID": {
            "Intensive Support": "54",
            "Strategic Support": "71"
        },
        "DORF-WORDSCORRECT_2ND_END": {
            "Intensive Support": "64",
            "Strategic Support": "86"
        },
        "ORF_2_BEGINNING": {
            "Intensive Support": "36",
            "Strategic Support": "51"
        },
        "ORF_2_BEG": {
            "Intensive Support": "36",
            "Strategic Support": "51"
        },
        "ORF_2_MIDDLE": {
            "Intensive Support": "54",
            "Strategic Support": "71"
        },
        "ORF_2_MID": {
            "Intensive Support": "54",
            "Strategic Support": "71"
        },
        "ORF_2_END": {
            "Intensive Support": "64",
            "Strategic Support": "86"
        },
        // Grade 03
        "DORF-WORDSCORRECT_3RD_BEGINNING": {
            "Intensive Support": "54",
            "Strategic Support": "69"
        },
        "DORF-WORDSCORRECT_3RD_BEG": {
            "Intensive Support": "54",
            "Strategic Support": "69"
        },
        "DORF-WORDSCORRECT_3RD_MIDDLE": {
            "Intensive Support": "67",
            "Strategic Support": "85"
        },
        "DORF-WORDSCORRECT_3RD_MID": {
            "Intensive Support": "67",
            "Strategic Support": "85"
        },
        "DORF-WORDSCORRECT_3RD_END": {
            "Intensive Support": "79",
            "Strategic Support": "99"
        },
        "ORF_3_BEGINNING": {
            "Intensive Support": "54",
            "Strategic Support": "69"
        },
        "ORF_3_BEG": {
            "Intensive Support": "54",
            "Strategic Support": "69"
        },
        "ORF_3_MIDDLE": {
            "Intensive Support": "67",
            "Strategic Support": "85"
        },
        "ORF_3_MID": {
            "Intensive Support": "67",
            "Strategic Support": "85"
        },
        "ORF_3_END": {
            "Intensive Support": "79",
            "Strategic Support": "99"
        },
        // Grade 04
        "DORF-WORDSCORRECT_4TH_BEGINNING": {
            "Intensive Support": "69",
            "Strategic Support": "89"
        },
        "DORF-WORDSCORRECT_4TH_BEG": {
            "Intensive Support": "69",
            "Strategic Support": "89"
        },
        "DORF-WORDSCORRECT_4TH_MID": {
            "Intensive Support": "78",
            "Strategic Support": "102"
        },
        "DORF-WORDSCORRECT_4TH_MIDDLE": {
            "Intensive Support": "78",
            "Strategic Support": "102"
        },
        "DORF-WORDSCORRECT_4TH_END": {
            "Intensive Support": "94",
            "Strategic Support": "114"
        },
        "ORF_4_BEGINNING": {
            "Intensive Support": "69",
            "Strategic Support": "89"
        },
        "ORF_4_BEG": {
            "Intensive Support": "69",
            "Strategic Support": "89"
        },
        "ORF_4_MID": {
            "Intensive Support": "78",
            "Strategic Support": "102"
        },
        "ORF_4_MIDDLE": {
            "Intensive Support": "78",
            "Strategic Support": "102"
        },
        "ORF_4_END": {
            "Intensive Support": "94",
            "Strategic Support": "114"
        },
        // Grade 05
        "DORF-WORDSCORRECT_5TH_BEGINNING": {
            "Intensive Support": "95",
            "Strategic Support": "110"
        },
        "DORF-WORDSCORRECT_5TH_BEG": {
            "Intensive Support": "95",
            "Strategic Support": "110"
        },
        "DORF-WORDSCORRECT_5TH_MID": {
            "Intensive Support": "100",
            "Strategic Support": "119"
        },
        "DORF-WORDSCORRECT_5TH_MIDDLE": {
            "Intensive Support": "100",
            "Strategic Support": "119"
        },
        "DORF-WORDSCORRECT_5TH_END": {
            "Intensive Support": "104",
            "Strategic Support": "129"
        },
        "ORF_5_BEGINNING": {
            "Intensive Support": "95",
            "Strategic Support": "110"
        },
        "ORF_5_BEG": {
            "Intensive Support": "95",
            "Strategic Support": "110"
        },
        "ORF_5_MID": {
            "Intensive Support": "100",
            "Strategic Support": "119"
        },
        "ORF_5_MIDDLE": {
            "Intensive Support": "100",
            "Strategic Support": "119"
        },
        "ORF_5_END": {
            "Intensive Support": "104",
            "Strategic Support": "129"
        },
        // Grade 06
        "DORF-WORDSCORRECT_6TH_BEGINNING": {
            "Intensive Support": "89",
            "Strategic Support": "106"
        },
        "DORF-WORDSCORRECT_6TH_BEG": {
            "Intensive Support": "89",
            "Strategic Support": "106"
        },
        "DORF-WORDSCORRECT_6TH_MIDDLE": {
            "Intensive Support": "91",
            "Strategic Support": "108"
        },
        "DORF-WORDSCORRECT_6TH_MID": {
            "Intensive Support": "91",
            "Strategic Support": "108"
        },
        "DORF-WORDSCORRECT_6TH_END": {
            "Intensive Support": "94",
            "Strategic Support": "119"
        },
        "ORF_6_BEGINNING": {
            "Intensive Support": "89",
            "Strategic Support": "106"
        },
        "ORF_6_BEG": {
            "Intensive Support": "89",
            "Strategic Support": "106"
        },
        "ORF_6_MIDDLE": {
            "Intensive Support": "91",
            "Strategic Support": "108"
        },
        "ORF_6_MID": {
            "Intensive Support": "91",
            "Strategic Support": "108"
        },
        "ORF_6_END": {
            "Intensive Support": "94",
            "Strategic Support": "119"
        },

        // ACCURACY
        // Grade 01
        "DORF-ACCURACY_1ST_MID": {
            "Intensive Support": "67",
            "Strategic Support": "77"
        },
        "DORF-ACCURACY_1ST_END": {
            "Intensive Support": "81",
            "Strategic Support": "89"
        },
        "ACCURACY_1_MID": {
            "Intensive Support": "67",
            "Strategic Support": "77"
        },
        "ACCURACY_1_END": {
            "Intensive Support": "81",
            "Strategic Support": "89"
        },
        // Grade 02
        "DORF-ACCURACY_2ND_BEGINNING": {
            "Intensive Support": "80",
            "Strategic Support": "89"
        },
        "DORF-ACCURACY_2ND_BEG": {
            "Intensive Support": "80",
            "Strategic Support": "89"
        },
        "DORF-ACCURACY_2ND_MIDDLE": {
            "Intensive Support": "90",
            "Strategic Support": "95"
        },
        "DORF-ACCURACY_2ND_MID": {
            "Intensive Support": "90",
            "Strategic Support": "95"
        },
        "DORF-ACCURACY_2ND_END": {
            "Intensive Support": "92",
            "Strategic Support": "96"
        },
        "ACCURACY_2_BEGINNING": {
            "Intensive Support": "80",
            "Strategic Support": "89"
        },
        "ACCURACY_2_BEG": {
            "Intensive Support": "80",
            "Strategic Support": "89"
        },
        "ACCURACY_2_MIDDLE": {
            "Intensive Support": "90",
            "Strategic Support": "95"
        },
        "ACCURACY_2_MID": {
            "Intensive Support": "90",
            "Strategic Support": "95"
        },
        "ACCURACY_2_END": {
            "Intensive Support": "92",
            "Strategic Support": "96"
        },
        // Grade 03
        "DORF-ACCURACY_3RD_BEGINNING": {
            "Intensive Support": "88",
            "Strategic Support": "94"
        },
        "DORF-ACCURACY_3RD_BEG": {
            "Intensive Support": "88",
            "Strategic Support": "94"
        },
        "DORF-ACCURACY_3RD_MIDDLE": {
            "Intensive Support": "91",
            "Strategic Support": "95"
        },
        "DORF-ACCURACY_3RD_MID": {
            "Intensive Support": "91",
            "Strategic Support": "95"
        },
        "DORF-ACCURACY_3RD_END": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_3_BEGINNING": {
            "Intensive Support": "88",
            "Strategic Support": "94"
        },
        "ACCURACY_3_BEG": {
            "Intensive Support": "88",
            "Strategic Support": "94"
        },
        "ACCURACY_3_MIDDLE": {
            "Intensive Support": "91",
            "Strategic Support": "95"
        },
        "ACCURACY_3_MID": {
            "Intensive Support": "91",
            "Strategic Support": "95"
        },
        "ACCURACY_3_END": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        // Grade 04
        "DORF-ACCURACY_4TH_BEGINNING": {
            "Intensive Support": "92",
            "Strategic Support": "95"
        },
        "DORF-ACCURACY_4TH_BEG": {
            "Intensive Support": "92",
            "Strategic Support": "95"
        },
        "DORF-ACCURACY_4TH_MIDDLE": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "DORF-ACCURACY_4TH_MID": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "DORF-ACCURACY_4TH_END": {
            "Intensive Support": "94",
            "Strategic Support": "97"
        },
        "ACCURACY_4_BEGINNING": {
            "Intensive Support": "92",
            "Strategic Support": "95"
        },
        "ACCURACY_4_BEG": {
            "Intensive Support": "92",
            "Strategic Support": "95"
        },
        "ACCURACY_4_MIDDLE": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_4_MID": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_4_END": {
            "Intensive Support": "94",
            "Strategic Support": "97"
        },
        // Grade 05
        "DORF-ACCURACY_5TH_BEGINNING": {
            "Intensive Support": "94",
            "Strategic Support": "97"
        },
        "DORF-ACCURACY_5TH_BEG": {
            "Intensive Support": "94",
            "Strategic Support": "97"
        },
        "DORF-ACCURACY_5TH_MIDDLE": {
            "Intensive Support": "95",
            "Strategic Support": "97"
        },
        "DORF-ACCURACY_5TH_MID": {
            "Intensive Support": "95",
            "Strategic Support": "97"
        },
        "DORF-ACCURACY_5TH_END": {
            "Intensive Support": "96",
            "Strategic Support": "98"
        },
        "ACCURACY_5_BEGINNING": {
            "Intensive Support": "94",
            "Strategic Support": "97"
        },
        "ACCURACY_5_BEG": {
            "Intensive Support": "94",
            "Strategic Support": "97"
        },
        "ACCURACY_5_MIDDLE": {
            "Intensive Support": "95",
            "Strategic Support": "97"
        },
        "ACCURACY_5_MID": {
            "Intensive Support": "95",
            "Strategic Support": "97"
        },
        "ACCURACY_5_END": {
            "Intensive Support": "96",
            "Strategic Support": "98"
        },
        // Grade 06
        "DORF-ACCURACY_6TH_BEGINNING": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "DORF-ACCURACY_6TH_BEG": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "DORF-ACCURACY_6TH_MIDDLE": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "DORF-ACCURACY_6TH_MID": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "DORF-ACCURACY_6TH_END": {
            "Intensive Support": "95",
            "Strategic Support": "97"
        },
        "ACCURACY_6_BEGINNING": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_6_BEG": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_6_MIDDLE": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_6_MID": {
            "Intensive Support": "93",
            "Strategic Support": "96"
        },
        "ACCURACY_6_END": {
            "Intensive Support": "95",
            "Strategic Support": "97"
        },

        // RETELL
        // Grade 01
        "DORF-RETELL_1ST_END": {
            "Intensive Support": "-1",
            "Strategic Support": "14"
        },
        "RETELL_1_END": {
            "Intensive Support": "-1",
            "Strategic Support": "14"
        },
        // Grade 02
        "DORF-RETELL_2ND_BEGINNING": {
            "Intensive Support": "7",
            "Strategic Support": "15"
        },
        "DORF-RETELL_2ND_BEG": {
            "Intensive Support": "7",
            "Strategic Support": "15"
        },
        "DORF-RETELL_2ND_MIDDLE": {
            "Intensive Support": "12",
            "Strategic Support": "20"
        },
        "DORF-RETELL_2ND_MID": {
            "Intensive Support": "12",
            "Strategic Support": "20"
        },
        "DORF-RETELL_2ND_END": {
            "Intensive Support": "17",
            "Strategic Support": "26"
        },
        "RETELL_2_BEGINNING": {
            "Intensive Support": "7",
            "Strategic Support": "15"
        },
        "RETELL_2_BEG": {
            "Intensive Support": "7",
            "Strategic Support": "15"
        },
        "RETELL_2_MIDDLE": {
            "Intensive Support": "12",
            "Strategic Support": "20"
        },
        "RETELL_2_MID": {
            "Intensive Support": "12",
            "Strategic Support": "20"
        },
        "RETELL_2_END": {
            "Intensive Support": "17",
            "Strategic Support": "26"
        },
        // Grade 03
        "DORF-RETELL_3RD_BEGINNING": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "DORF-RETELL_3RD_BEG": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "DORF-RETELL_3RD_MIDDLE": {
            "Intensive Support": "17",
            "Strategic Support": "25"
        },
        "DORF-RETELL_3RD_MID": {
            "Intensive Support": "17",
            "Strategic Support": "25"
        },
        "DORF-RETELL_3RD_END": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        "RETELL_3_BEGINNING": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "RETELL_3_BEG": {
            "Intensive Support": "9",
            "Strategic Support": "19"
        },
        "RETELL_3_MIDDLE": {
            "Intensive Support": "17",
            "Strategic Support": "25"
        },
        "RETELL_3_MID": {
            "Intensive Support": "17",
            "Strategic Support": "25"
        },
        "RETELL_3_END": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        // Grade 04
        "DORF-RETELL_4TH_BEGINNING": {
            "Intensive Support": "13",
            "Strategic Support": "26"
        },
        "DORF-RETELL_4TH_BEG": {
            "Intensive Support": "13",
            "Strategic Support": "26"
        },
        "DORF-RETELL_4TH_MIDDLE": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        "DORF-RETELL_4TH_MID": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        "DORF-RETELL_4TH_END": {
            "Intensive Support": "23",
            "Strategic Support": "32"
        },
        "RETELL_4_BEGINNING": {
            "Intensive Support": "13",
            "Strategic Support": "26"
        },
        "RETELL_4_BEG": {
            "Intensive Support": "13",
            "Strategic Support": "26"
        },
        "RETELL_4_MIDDLE": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        "RETELL_4_MID": {
            "Intensive Support": "19",
            "Strategic Support": "29"
        },
        "RETELL_4_END": {
            "Intensive Support": "23",
            "Strategic Support": "32"
        },
        // Grade 05
        "DORF-RETELL_5TH_BEGINNING": {
            "Intensive Support": "21",
            "Strategic Support": "32"
        },
        "DORF-RETELL_5TH_BEG": {
            "Intensive Support": "21",
            "Strategic Support": "32"
        },
        "DORF-RETELL_5TH_MIDDLE": {
            "Intensive Support": "24",
            "Strategic Support": "35"
        },
        "DORF-RETELL_5TH_MID": {
            "Intensive Support": "24",
            "Strategic Support": "35"
        },
        "DORF-RETELL_5TH_END": {
            "Intensive Support": "24",
            "Strategic Support": "35"
        },
        "RETELL_5_BEGINNING": {
            "Intensive Support": "21",
            "Strategic Support": "32"
        },
        "RETELL_5_BEG": {
            "Intensive Support": "21",
            "Strategic Support": "32"
        },
        "RETELL_5_MIDDLE": {
            "Intensive Support": "24",
            "Strategic Support": "35"
        },
        "RETELL_5_MID": {
            "Intensive Support": "24",
            "Strategic Support": "35"
        },
        "RETELL_5_END": {
            "Intensive Support": "24",
            "Strategic Support": "35"
        },
        // Grade 06
        "DORF-RETELL_6TH_BEGINNING": {
            "Intensive Support": "15",
            "Strategic Support": "26"
        },
        "DORF-RETELL_6TH_BEG": {
            "Intensive Support": "15",
            "Strategic Support": "26"
        },
        "DORF-RETELL_6TH_MIDDLE": {
            "Intensive Support": "17",
            "Strategic Support": "28"
        },
        "DORF-RETELL_6TH_MID": {
            "Intensive Support": "17",
            "Strategic Support": "28"
        },
        "DORF-RETELL_6TH_END": {
            "Intensive Support": "23",
            "Strategic Support": "31"
        },
        "RETELL_6_BEGINNING": {
            "Intensive Support": "15",
            "Strategic Support": "26"
        },
        "RETELL_6_BEG": {
            "Intensive Support": "15",
            "Strategic Support": "26"
        },
        "RETELL_6_MIDDLE": {
            "Intensive Support": "17",
            "Strategic Support": "28"
        },
        "RETELL_6_MID": {
            "Intensive Support": "17",
            "Strategic Support": "28"
        },
        "RETELL_6_END": {
            "Intensive Support": "23",
            "Strategic Support": "31"
        },

        // RETELLQR
        // Grade 02
        "DORF-RETELLQUALITY_2ND_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_2ND_END": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_2_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_2_END": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        // Grade 03
        "DORF-RETELLQUALITY_3RD_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_3RD_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_3RD_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_3RD_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "RETELLQR_3_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_3_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_3_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_3_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        // Grade 04
        "DORF-RETELLQUALITY_4TH_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_4TH_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_4TH_MIDDLE": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_4TH_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_4TH_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "RETELLQR_4_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_4_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_4_MIDDLE": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_4_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_4_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        // Grade 05
        "DORF-RETELLQUALITY_5TH_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_5TH_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_5TH_MIDDLE": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "DORF-RETELLQUALITY_5TH_MID": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "DORF-RETELLQUALITY_5TH_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "RETELLQR_5_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_5_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_5_MIDDLE": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "RETELLQR_5_MID": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "RETELLQR_5_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        // Grade 06
        "DORF-RETELLQUALITY_6TH_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_6TH_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_6TH_MIDDLE": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_6TH_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "DORF-RETELLQUALITY_6TH_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },
        "RETELLQR_6_BEGINNING": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_6_BEG": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_6_MIDDLE": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_6_MID": {
            "Intensive Support": "-1",
            "Strategic Support": "1"
        },
        "RETELLQR_6_END": {
            "Intensive Support": "1",
            "Strategic Support": "2"
        },

        // Maze Adjust Score
        // Grade 03
        "DAZE-ADJUSTED_3RD_BEGINNING": {
            "Intensive Support": "4",
            "Strategic Support": "7"
        },
        "DAZE-ADJUSTED_3RD_BEG": {
            "Intensive Support": "4",
            "Strategic Support": "7"
        },
        "DAZE-ADJUSTED_3RD_MID": {
            "Intensive Support": "6",
            "Strategic Support": "10"
        },
        "DAZE-ADJUSTED_3RD_END": {
            "Intensive Support": "13",
            "Strategic Support": "18"
        },
        "MAZ_ADJ_SC_3_BEGINNING": {
            "Intensive Support": "4",
            "Strategic Support": "7"
        },
        "MAZ_ADJ_SC_3_BEG": {
            "Intensive Support": "4",
            "Strategic Support": "7"
        },
        "MAZ_ADJ_SC_3_MID": {
            "Intensive Support": "6",
            "Strategic Support": "10"
        },
        "MAZ_ADJ_SC_3_END": {
            "Intensive Support": "13",
            "Strategic Support": "18"
        },
        // Grade 04
        "DAZE-ADJUSTED_4TH_BEGINNING": {
            "Intensive Support": "9",
            "Strategic Support": "14"
        },
        "DAZE-ADJUSTED_4TH_BEG": {
            "Intensive Support": "9",
            "Strategic Support": "14"
        },
        "DAZE-ADJUSTED_4TH_MIDDLE": {
            "Intensive Support": "11",
            "Strategic Support": "16"
        },
        "DAZE-ADJUSTED_4TH_MID": {
            "Intensive Support": "11",
            "Strategic Support": "16"
        },
        "DAZE-ADJUSTED_4TH_END": {
            "Intensive Support": "19",
            "Strategic Support": "23"
        },
        "MAZ_ADJ_SC_4_BEGINNING": {
            "Intensive Support": "9",
            "Strategic Support": "14"
        },
        "MAZ_ADJ_SC_4_BEG": {
            "Intensive Support": "9",
            "Strategic Support": "14"
        },
        "MAZ_ADJ_SC_4_MIDDLE": {
            "Intensive Support": "11",
            "Strategic Support": "16"
        },
        "MAZ_ADJ_SC_4_MID": {
            "Intensive Support": "11",
            "Strategic Support": "16"
        },
        "MAZ_ADJ_SC_4_END": {
            "Intensive Support": "19",
            "Strategic Support": "23"
        },
        // Grade 05
        "DAZE-ADJUSTED_5TH_BEGINNING": {
            "Intensive Support": "11",
            "Strategic Support": "17"
        },
        "DAZE-ADJUSTED_5TH_BEG": {
            "Intensive Support": "11",
            "Strategic Support": "17"
        },
        "DAZE-ADJUSTED_5TH_MIDDLE": {
            "Intensive Support": "12",
            "Strategic Support": "19"
        },
        "DAZE-ADJUSTED_5TH_MID": {
            "Intensive Support": "12",
            "Strategic Support": "19"
        },
        "DAZE-ADJUSTED_5TH_END": {
            "Intensive Support": "17",
            "Strategic Support": "23"
        },
        "MAZ_ADJ_SC_5_BEGINNING": {
            "Intensive Support": "11",
            "Strategic Support": "17"
        },
        "MAZ_ADJ_SC_5_BEG": {
            "Intensive Support": "11",
            "Strategic Support": "17"
        },
        "MAZ_ADJ_SC_5_MIDDLE": {
            "Intensive Support": "12",
            "Strategic Support": "19"
        },
        "MAZ_ADJ_SC_5_MID": {
            "Intensive Support": "12",
            "Strategic Support": "19"
        },
        "MAZ_ADJ_SC_5_END": {
            "Intensive Support": "17",
            "Strategic Support": "23"
        },
        // Grade 06
        "DAZE-ADJUSTED_6TH_BEGINNING": {
            "Intensive Support": "13",
            "Strategic Support": "17"
        },
        "DAZE-ADJUSTED_6TH_BEG": {
            "Intensive Support": "13",
            "Strategic Support": "17"
        },
        "DAZE-ADJUSTED_6TH_MIDDLE": {
            "Intensive Support": "13",
            "Strategic Support": "18"
        },
        "DAZE-ADJUSTED_6TH_MID": {
            "Intensive Support": "13",
            "Strategic Support": "18"
        },
        "DAZE-ADJUSTED_6TH_END": {
            "Intensive Support": "14",
            "Strategic Support": "20"
        },
        "MAZ_ADJ_SC_6_BEGINNING": {
            "Intensive Support": "13",
            "Strategic Support": "17"
        },
        "MAZ_ADJ_SC_6_BEG": {
            "Intensive Support": "13",
            "Strategic Support": "17"
        },
        "MAZ_ADJ_SC_6_MIDDLE": {
            "Intensive Support": "13",
            "Strategic Support": "18"
        },
        "MAZ_ADJ_SC_6_MID": {
            "Intensive Support": "13",
            "Strategic Support": "18"
        },
        "MAZ_ADJ_SC_6_END": {
            "Intensive Support": "14",
            "Strategic Support": "20"
        },
        // Grade 01
        "NIF_1_BEG": {
            "Intensive Support": "15",
            "Strategic Support": "26"
        },
        "NNF_1_BEG": {
            "Intensive Support": "8",
            "Strategic Support": "11"
        },
        "AQD_1_BEG": {
            "Intensive Support": "5",
            "Strategic Support": "9"
        },
        "MNF_1_BEG": {
            "Intensive Support": "1",
            "Strategic Support": "3"
        },
        "COMPA_1_BEG": {
            "Intensive Support": "2",
            "Strategic Support": "4"
        },
        "COMPB_1_BEG": {
            "Intensive Support": "2",
            "Strategic Support": "4"
        },
        "AM_COMPUTATION_1_BEG": {
            "Intensive Support": "2",
            "Strategic Support": "4"
        },
        "AM_COMPOSITE_1_BEG": {
            "Intensive Support": "80",
            "Strategic Support": "123"
        },
         // Grade 02
        "COMPA_2_BEG": {
            "Intensive Support": "2",
            "Strategic Support": "5"
        },
        "COMPB_2_BEG": {
            "Intensive Support": "2",
            "Strategic Support": "5"
        },
        "CA_2_BEG": {
            "Intensive Support": "7",
            "Strategic Support": "13"
        },
        "AM_COMPUTATION_2_BEG": {
             "Intensive Support": "2",
             "Strategic Support": "5"
        },
        "AM_COMPOSITE_2_BEG": {
             "Intensive Support": "15",
             "Strategic Support": "23"
        },
          // Grade 03
        "COMPA_3_BEG": {
             "Intensive Support": "8",
             "Strategic Support": "12"
        },
        "COMPB_3_BEG": {
             "Intensive Support": "8",
             "Strategic Support": "12"
        },
        "CA_3_BEG":   {
             "Intensive Support": "12",
             "Strategic Support": "22"
        },
        "AM_COMPUTATION_3_BEG": {
              "Intensive Support": "8",
              "Strategic Support": "12"
        },
        "AM_COMPOSITE_3_BEG": {
              "Intensive Support": "32",
              "Strategic Support": "48"
        },
         // Grade 04
         "COMPA_4_BEG": {
              "Intensive Support": "11",
              "Strategic Support": "16"
         },
         "COMPB_4_BEG": {
              "Intensive Support": "11",
              "Strategic Support": "16"
         },
         "CA_4_BEG":   {
              "Intensive Support": "20",
              "Strategic Support": "33"
         },
         "AM_COMPUTATION_4_BEG": {
               "Intensive Support": "11",
               "Strategic Support": "16"
         },
         "AM_COMPOSITE_4_BEG": {
               "Intensive Support": "46",
               "Strategic Support": "69"
         },
          // Grade 05
         "COMPA_5_BEG": {
              "Intensive Support": "17",
              "Strategic Support": "26"
         },
         "COMPB_5_BEG": {
              "Intensive Support": "17",
              "Strategic Support": "26"
         },
         "CA_5_BEG":   {
              "Intensive Support": "14",
              "Strategic Support": "24"
         },
         "AM_COMPUTATION_5_BEG": {
               "Intensive Support": "17",
               "Strategic Support": "26"
         },
         "AM_COMPOSITE_5_BEG": {
               "Intensive Support": "34",
               "Strategic Support": "52"
         },
         // Kinder Garten
         "BQD_K_MID": {
              "Intensive Support": "3",
              "Strategic Support": "6"
         },
         "NIF_K_MID": {
               "Intensive Support": "7",
               "Strategic Support": "13"
         },
         "NNF_K_MID": {
               "Intensive Support": "6",
               "Strategic Support": "10"
         },
         "AM_COMPOSITE_K_MID": {
               "Intensive Support": "48",
               "Strategic Support": "71"
         },
         "BQD_K_END": {
               "Intensive Support": "8",
               "Strategic Support": "12"
         },
         "NIF_K_END": {
               "Intensive Support": "13",
               "Strategic Support": "24"
         },
         "NNF_K_END": {
               "Intensive Support": "9",
               "Strategic Support": "13"
         },
         "AM_COMPOSITE_K_END": {
               "Intensive Support": "66",
               "Strategic Support": "91"
         },
         // Grade 01
         "AQD_1_MID": {
              "Intensive Support": "13",
              "Strategic Support": "18"
         },
         "MNF_1_MID": {
               "Intensive Support": "5",
               "Strategic Support": "7"
         },
         "COMPA_1_MID": {
               "Intensive Support": "6",
               "Strategic Support": "10"
         },
         "COMPB_1_MID": {
               "Intensive Support": "6",
               "Strategic Support": "10"
         },
         "AM_COMPUTATION_1_MID": {
               "Intensive Support": "6",
               "Strategic Support": "10"
         },
         "AM_COMPOSITE_1_MID": {
               "Intensive Support": "32",
               "Strategic Support": "45"
         },
         "AQD_1_END": {
               "Intensive Support": "16",
               "Strategic Support": "21"
         },
         "MNF_1_END": {
               "Intensive Support": "7",
               "Strategic Support": "9"
         },
         "COMPA_1_END": {
               "Intensive Support": "10",
               "Strategic Support": "16"
         },
         "COMPB_1_END": {
               "Intensive Support": "10",
               "Strategic Support": "16"
         },
         "AM_COMPUTATION_1_END": {
               "Intensive Support": "10",
               "Strategic Support": "16"
         },
         "AM_COMPOSITE_1_END": {
               "Intensive Support": "43",
               "Strategic Support": "58"
         },
         // Grade 02
         "COMPA_2_MID": {
              "Intensive Support": "7",
              "Strategic Support": "10"
         },
         "COMPB_2_MID": {
               "Intensive Support": "7",
               "Strategic Support": "10"
         },
         "CA_2_MID": {
               "Intensive Support": "14",
               "Strategic Support": "23"
         },
         "AM_COMPUTATION_2_MID": {
               "Intensive Support": "7",
               "Strategic Support": "10"
         },
         "AM_COMPOSITE_2_MID": {
               "Intensive Support": "29",
               "Strategic Support": "45"
         },
         "COMPA_2_END": {
               "Intensive Support": "9",
               "Strategic Support": "14"
         },
         "COMPB_2_END": {
               "Intensive Support": "9",
               "Strategic Support": "14"
         },
         "CA_2_END": {
               "Intensive Support": "22",
               "Strategic Support": "34"
         },
         "AM_COMPUTATION_2_END": {
               "Intensive Support": "9",
               "Strategic Support": "14"
         },
         "AM_COMPOSITE_2_END": {
               "Intensive Support": "47",
               "Strategic Support": "65"
         },
         // Grade 03
         "COMPA_3_MID": {
              "Intensive Support": "15",
              "Strategic Support": "21"
         },
         "COMPB_3_MID": {
               "Intensive Support": "15",
               "Strategic Support": "21"
         },
         "CA_3_MID": {
               "Intensive Support": "23",
               "Strategic Support": "39"
         },
         "AM_COMPUTATION_3_MID": {
               "Intensive Support": "15",
               "Strategic Support": "21"
         },
         "AM_COMPOSITE_3_MID": {
               "Intensive Support": "56",
               "Strategic Support": "82"
         },
         "COMPA_3_END": {
               "Intensive Support": "20",
               "Strategic Support": "28"
         },
         "COMPB_3_END": {
               "Intensive Support": "20",
               "Strategic Support": "28"
         },
         "CA_3_END": {
               "Intensive Support": "31",
               "Strategic Support": "46"
         },
         "AM_COMPUTATION_3_END": {
               "Intensive Support": "20",
               "Strategic Support": "28"
         },
         "AM_COMPOSITE_3_END": {
               "Intensive Support": "73",
               "Strategic Support": "100"
         },
         // Grade 04
         "COMPA_4_MID": {
              "Intensive Support": "20",
              "Strategic Support": "30"
         },
         "COMPB_4_MID": {
               "Intensive Support": "20",
               "Strategic Support": "30"
         },
         "CA_4_MID": {
               "Intensive Support": "29",
               "Strategic Support": "48"
         },
         "AM_COMPUTATION_4_MID": {
               "Intensive Support": "20",
               "Strategic Support": "30"
         },
         "AM_COMPOSITE_4_MID": {
               "Intensive Support": "54",
               "Strategic Support": "82"
         },
         "COMPA_4_END": {
               "Intensive Support": "32",
               "Strategic Support": "45"
         },
         "COMPB_4_END": {
               "Intensive Support": "32",
               "Strategic Support": "45"
         },
         "CA_4_END": {
               "Intensive Support": "45",
               "Strategic Support": "70"
         },
         "AM_COMPUTATION_4_END": {
               "Intensive Support": "32",
               "Strategic Support": "45"
         },
         "AM_COMPOSITE_4_END": {
               "Intensive Support": "80",
               "Strategic Support": "116"
         },
         // Grade 05
         "COMPA_5_MID": {
              "Intensive Support": "30",
              "Strategic Support": "51"
         },
         "COMPB_5_MID": {
               "Intensive Support": "30",
               "Strategic Support": "51"
         },
         "CA_5_MID": {
               "Intensive Support": "25",
               "Strategic Support": "41"
         },
         "AM_COMPUTATION_5_MID": {
               "Intensive Support": "30",
               "Strategic Support": "51"
         },
         "AM_COMPOSITE_5_MID": {
               "Intensive Support": "62",
               "Strategic Support": "91"
         },
         "COMPA_5_END": {
               "Intensive Support": "37",
               "Strategic Support": "55"
         },
         "COMPB_5_END": {
               "Intensive Support": "37",
               "Strategic Support": "55"
         },
         "CA_5_END": {
               "Intensive Support": "45",
               "Strategic Support": "70"
         },
         "AM_COMPUTATION_5_END": {
               "Intensive Support": "37",
               "Strategic Support": "55"
         },
         "AM_COMPOSITE_5_END": {
               "Intensive Support": "78",
               "Strategic Support": "115"
         }



    };

    var perfLevels = {
        "Intensive Support": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "Strategic Support": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "Core Support": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark"
        },
        "--": {
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT: "--",
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        "Well Below Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark",
            TEST_PASSED_INDICATOR: "No"
        },
        "well below benchmark": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark",
            TEST_PASSED_INDICATOR: "No"
        },
        "Below Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark",
            TEST_PASSED_INDICATOR: "No"
        },
        "below benchmark": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark",
            TEST_PASSED_INDICATOR: "No"
        },
        "At or Above Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark",
            TEST_PASSED_INDICATOR: "Yes"
        },
        "Above Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT: "Core Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "Above Benchmark",
                TEST_PASSED_INDICATOR: "Yes"

        },
        "above benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "Above Benchmark",
            TEST_PASSED_INDICATOR: "Yes"

        },
        "At Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT: "Core Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Benchmark",
                TEST_PASSED_INDICATOR: "Yes"
         },
        "at benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Benchmark",
            TEST_PASSED_INDICATOR: "Yes"
        },
           "Benchmark": {
               TEST_PRIMARY_RESULT_CODE: "CS",
               TEST_PRIMARY_RESULT: "Core Support",
               TEST_SECONDARY_RESULT_CODE: "B",
               TEST_SECONDARY_RESULT: "Benchmark",
               TEST_PASSED_INDICATOR: "Yes"
           },
            "Not Determined": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "Not Determined",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            },
           "": {
               TEST_PRIMARY_RESULT_CODE: "--",
               TEST_PRIMARY_RESULT: "--",
               TEST_SECONDARY_RESULT_CODE: "--",
               TEST_SECONDARY_RESULT: "--"
           }
    };

    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "1st Grade": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "2nd Grade": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "3rd Grade": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "4th Grade": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "5th Grade": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "6th Grade": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "7th Grade": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "8th Grade": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "9th Grade": "09",
        "10": "10",
        "Grade 10": "10",
        "10th Grade": "10",
        "10th":"10",
        "11": "11",
        "Grade 11": "11",
        "11th Grade": "11",
        "11th":"11",
        "12": "12",
        "Grade 12": "12",
        "12th Grade": "12",
        "12th":"12",
        "H.S. Graduate":"13",
        "College Student":"14",
        "Other":"15",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "0": "KG",
        "Kindergarten": "KG"
        , "": null
        , null: null
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
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];

        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        if (signature.getFormat().getFormatName() === "DIBELS_ACADIENCE_2122") {
            var record;
            var year = hierarchy.SCHOOL_YEAR.split("-")[0];
            var gLevel = row.getField("GRADE");
            var assessPeriod = getShortAdminPeriod(assessPeriod, row);
            record = mapSingleNormalizedRecord(signature, hierarchy, row, gLevel, assessPeriod, year);
            AppUtil.nullSafePush(normalizedRecords, record);
        } else {
            gradeLevels.forEach(function(gradeLevel) {
                var record;
                year = "";
                if (row.getField("YEAR_${gradeLevel.FIELD}") !== null && row.getField("YEAR_${gradeLevel.FIELD}") !== "") {
                    year = row.getField("YEAR_${gradeLevel.FIELD}");
                }
                //Acadience
                else if (row.getField("YEAR") !== null && row.getField("YEAR") !== "" && row.getField("GRADE") === gradeLevel.FIELD) {
                    if (row.getField("YEAR").length > 4) {
                        year = row.getField("YEAR").split(" ")[1]
                    } else {
                        year = row.getField("YEAR");
                    }
                } else if (row.getField("YEAR_GRADE${gradeLevel.FIELD}") !== null && row.getField("YEAR_GRADE${gradeLevel.FIELD}") !== "") {
                    year = row.getField("YEAR_GRADE${gradeLevel.FIELD}").split("-")[0];
                } else if (signature.getFormat().getFormatName() === "DIBELS_FAIRFAX_ACADIENCE_21") {
                    year = hierarchy.SCHOOL_YEAR.split("-")[0];
                }

                if (year) {
                    assessPeriods.forEach(function(assessPeriod) {
                        record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year);
                        AppUtil.nullSafePush(normalizedRecords, record);
                    });
                }
            });
        }

        return normalizedRecords;
    }


    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} Mapped normalized record.
     */
    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year);
        strandsAndFields.forEach(function(strandsAndField) {
            var performanceCode = "";
            var score;

            if (signature.getFormat().getFormatName() === "DIBELS_ACADIENCE_2122") {
                if (gradeLevel) {
                    gradeLevel = gradeDecode[gradeLevel];
                };

                var testNumber = "ACA_${strandsAndField.TEST}" + gradeLevel + assessPeriod + "${strandsAndField.STRAND}";
                var assessmentCode = "ASSESSMENT_MEASURE-" + "${strandsAndField.FIELD}";
                score = row.getField("${assessmentCode}" + "-SCORE");
                performanceCode = _util.coalesce(_util.trim(row.getField("${assessmentCode}" + "-LEVELS")), "--");
                var growthlevel= row.getField("PATHWAY_ACHIEVED-COMPOSITE");
            } else {
                var testNumber = "ACA_${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}";
                var assessmentCode = "${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}";
                score = row.getField("${assessmentCode}");
            }

            if (score !== null && score !== "" && signature.getFormat().getFormatName() !== "DIBELS_ACADIENCE_2122") {
                var lexileValue = _util.coalesce(row.getField("LEXILE_${assessmentCode}"), "--");
                performanceCode = _util.coalesce(row.getField("NEED_FOR_SUPPORT_${assessmentCode}"), "--");//TODO for this sig
                //check BEGINNING, MIDDLE, and END
                if (performanceCode == '--' && assessmentCode in perfCutoffs) {
                    var temp = perfCutoffs[assessmentCode];
                    var performance_score = _util.coalesce(row.getField("${assessmentCode}"), "--");
                    if (parseInt(performance_score) <= temp["Intensive Support"]) {
                        performanceCode = "Intensive Support";
                    } else if (parseInt(performance_score) <= temp["Strategic Support"]) {
                        performanceCode = "Strategic Support";
                    } else {
                        performanceCode = "Core Support"
                    }
                }
            }
            if (score !== null && performanceCode !== '--') {
                let scoreMapping = {
                    "TEST_NUMBER": testNumber,
                    "TEST_SCORE_VALUE": score,
                    "TEST_SCORE_TEXT": score,
                    "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                    "TEST_PRIMARY_RESULT_CODE": perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE,
                    "TEST_PRIMARY_RESULT": perfLevels[performanceCode].TEST_PRIMARY_RESULT,
                    "TEST_SECONDARY_RESULT_CODE": perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE,
                    "TEST_SECONDARY_RESULT": perfLevels[performanceCode].TEST_SECONDARY_RESULT,
                    "TEST_PASSED_INDICATOR": perfLevels[performanceCode].TEST_PASSED_INDICATOR,
                    "TEST_READING_LEVEL": lexileValue,
                    "TEST_GROWTH_RESULT":growthlevel
                };
                mappingObject.SCORE_MAPPINGS.push(scoreMapping);
            } else if (score !== null && performanceCode === '--') {
                let scoreMapping = {
                    "TEST_NUMBER": testNumber,
                    "TEST_SCORE_VALUE": score,
                    "TEST_SCORE_TEXT": score,
                    "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                    "TEST_PRIMARY_RESULT_CODE": "--",
                    "TEST_PRIMARY_RESULT": "--",
                    "TEST_SECONDARY_RESULT_CODE": "--",
                    "TEST_SECONDARY_RESULT": "--",
                    "TEST_READING_LEVEL": lexileValue,
                    "TEST_GROWTH_RESULT":growthlevel
                };
                mappingObject.SCORE_MAPPINGS.push(scoreMapping);
            }

        });

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year) {

        var record = {};

        var schoolName, schoolCode, birthDateObject = AppUtil.getEmptyDateObj();

        // Just to make sure normalizedFileFields load once, as it was creating issue in linux (MacOS) based machines
        if (!GLOBAL.normalizedFileFields) {
            GLOBAL.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }
        let dateString = _util.coalesce(
            row.getField("STUDENT_BIRTHDATE"),
            row.getField("BIRTHDATE"),
            row.getField("DATE_OF_BIRTH")
        );

        if (dateString) {
            let dateChunk, dateSeparator;

            if (dateString.indexOf("-") > -1) {
                dateChunk = dateString.split("-");
                dateSeparator = "-";
            } else if (dateString.indexOf("/") > -1) {
                dateChunk = dateString.split("/");
                dateSeparator = "/";
            }

            dateChunk.forEach((dc) => {
                if (dc.length < 2) {
                    dc = ('0' + dc).slice('-2');
                }
            });

            let dateFormat = null;

            if (dateChunk[0].length === 4) {
                dateFormat = "yyyy${dateSeparator}MM${dateSeparator}dd";
            } else if (dateChunk[2].length === 4) {
                dateFormat = "MM${dateSeparator}dd${dateSeparator}yyyy";
            } else {
                dateFormat = "MM${dateSeparator}dd${dateSeparator}yyyy";
                dateChunk[2] = "20" + dateChunk[2]; // TODO: What will be year in case of two digit year?
                dateString = dateChunk[0] + dateSeparator + dateChunk[1] + dateSeparator + dateChunk[2];
            }

            birthDateObject = AppUtil.getDateObjByPattern(dateString, dateFormat);

        }

        var schoolInfo = row.getField("SCHOOL_${gradeLevel.FIELD}");

        if (undefined === row.getField("SCHOOL_${gradeLevel.FIELD}") || null === row.getField("SCHOOL_${gradeLevel.FIELD}")) {
            schoolName = _util.coalesce(
                row.getField("SCHOOL_NAME"),
                row.getField("SCHOOL_NAME_G${gradeLevel.FIELD}")
            );
            schoolCode = null;
        } else if (schoolInfo) {
            schoolName = schoolInfo.substring(0, schoolInfo.lastIndexOf(" "));
            schoolCode = schoolInfo.substr(schoolInfo.lastIndexOf(" ") + 1);
        }

        //Loop through normalized fields and map if possible.
        GLOBAL.normalizedFileFields.forEach(function(field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, assessPeriod);
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(assessPeriod, row, signature);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTEST_ADMIN_DATE_STR(assessPeriod, year, row, signature);
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
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("STUDENT_LOCAL_ID"),
                        row.getField("STUDENT_ID"),
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1"), row.getField("STATE_STUDENT_ID_VERSION_2"), row.getField("SECONDARY_ID"), row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1"), row.getField("STATE_STUDENT_ID_VERSION_2"), row.getField("SECONDARY_ID"), row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(
                        row.getField("STUDENT_FIRST_NAME"),
                        row.getField("FIRST_NAME")
                    );
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(
                        row.getField("STUDENT_MIDDLE_NAME"),
                        row.getField("STUDENT_MIDDLE_INITIAL")
                    );
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(
                        row.getField("STUDENT_LAST_NAME"),
                        row.getField("LAST_NAME")
                    );
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.coalesce(row.getField("STUDENT_ADDRESS"));
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("STUDENT_ZIP_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER_CODE"), row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[gradeLevel], gradeDecode[row.getField("GRADE")]);
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = _util.coalesce(row.getField("TEST_LOCATION"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        schoolName,
                        row.getField("DISTRICT_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = schoolCode;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        schoolCode, row.getField("SCHOOL_STATE_ID"),
                        schoolName
                    );
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};

        return admin;
    }

    function getTEST_ADMIN_PERIOD(assessPeriod, row, signature) {

        var period = null;
        if (signature.getFormat().getFormatName() === "DIBELS_ACADIENCE_2122") {
            var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
            if (benchmarkPeriod === "BOY") {
                period = "Beginning";
            } else if (benchmarkPeriod === "MOY") {
                period = "Middle";
            } else if (benchmarkPeriod === "EOY") {
                period = "End";
            }
        } else {
            switch (assessPeriod.FIELD) {
                case "BEGINNING":
                case "BEG":
                    period = "Beginning";
                    break;
                case "MIDDLE":
                case "MID":
                    period = "Middle";
                    break;
                case "END":
                    period = "End";
                    break;
            }
        }
        return period;
    }

    function getShortAdminPeriod(assessPeriod, row) {

        var period = null;
        var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
        if (benchmarkPeriod === "BOY") {
            period = "BEG";
        } else if (benchmarkPeriod === "MOY") {
            period = "MID";
        } else if (benchmarkPeriod === "EOY") {
            period = "END";
        }

        return period;
    }


    function getTEST_ADMIN_DATE_STR(assessPeriod, year, row, signature) {
        var date = null;
        if (signature.getFormat().getFormatName() === "DIBELS_ACADIENCE_2122") {
            var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
            if (benchmarkPeriod === "BOY") {
                date = "10/15/${year}";
            } else if (benchmarkPeriod === "MOY") {
                year = parseInt(year) + 1;
                date = "01/15/${year}";
            } else if (benchmarkPeriod === "EOY") {
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            }
        } else {
            //return "01/01/1900";
            switch (assessPeriod.FIELD) {

                case "BEGINNING":
                case "BEG":
                    date = "10/15/${year}";
                    break;
                case "MIDDLE":
                case "MID":
                    year = parseInt(year) + 1;
                    date = "01/15/${year}";
                    break;
                case "END":
                    year = parseInt(year) + 1;
                    date = "04/15/${year}";
                    break;
            }
        }
        return date;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/



    /***************************************************************************
        Utility Functions
    ***************************************************************************/

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, assessPeriod) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information
        // TODO: Will this cause any issue in already loaded data?
        const ASSESSMENT_ID_PREFIX = _assessmentIdentifier.split(" ").map((chunk) => chunk.trim().toUpperCase()).join("_");

        if (assessPeriod === undefined) {
            assessmentAdminKey = "${ASSESSMENT_ID_PREFIX}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        } else if (signature.getFormat().getFormatName() === "DIBELS_ACADIENCE_2122") {
            var period = getTEST_ADMIN_PERIOD(assessPeriod, srcRecord, signature);
            assessmentAdminKey = "${ASSESSMENT_ID_PREFIX}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";
        } else {
            assessmentAdminKey = "${ASSESSMENT_ID_PREFIX}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        return assessmentAdminKey;

    }






    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());