var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "SOL";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

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
            print("Loading using signature file ${signatureFormatName}\n");

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
    var scoresToMap = [
        { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra I (09)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra I (16)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra I (2016)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra 1 (23)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "PE_ALG_I", FIELD: "PE Algebra I (09)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra II (09)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra 2 (23)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra II (16)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra II (2016)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "BIO", FIELD: "Biology (10)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "BIO", FIELD: "Biology (18)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "BIO", FIELD: "Biology (2010)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "CHEM", FIELD: "Chemistry (10)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "EAR_SCI", FIELD: "Earth Sci (10)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "EOC Reading (10)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "EOC Reading (17)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "EOC Reading (24)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 3 Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 4 Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 5 Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 6 Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 7 Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Reading (02)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Reading (10)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Reading (17)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "GEOM", FIELD: "Geometry (09)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "GEOM", FIELD: "Geometry (16)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "GEOM", FIELD: "Geometry (23)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "GEOM", FIELD: "Geometry (2016)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Gr 8 Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Gr 5 Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Gr 5 Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Q8 Gr 8 Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Q8 Gr 5 Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "PE_ALG_I", FIELD: "PE Algebra I", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_US_HIST", FIELD: "VA&US Hist", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_US_HIST", FIELD: "VA&US Hist (08)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_US_HIST", FIELD: "VA&US Hist (15)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_US_HIST", FIELD: "VA&US Hist (2008)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_STU", FIELD: "Virginia Studies", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_GEO", FIELD: "W Geography", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_GEO", FIELD: "W Geography (08)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_I", FIELD: "W Hist I", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_I", FIELD: "W Hist I (08)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_I", FIELD: "W Hist I (2008)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_II", FIELD: "W Hist II", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_II", FIELD: "W Hist II (08)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "CIV_ECON", FIELD: "Civics & Economics", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "Y", CODE: "WR", FIELD: "SCALED_SCORE-", MAP_FUNCTION: mapWritingTotalScore }
        , { TEST: "SOL", WR_FLAG: "W", CODE: "WR_COMP_WR_EX", FIELD: "COMPOSING_OR_COMPOSING/WRITTEN_EXPRESSION", MAP_FUNCTION: mapWritingSPScore }
        , { TEST: "SOL", WR_FLAG: "W", CODE: "WR_WR_EX", FIELD: "WRITTEN_EXPRESSION", MAP_FUNCTION: mapWritingSPScore }
        , { TEST: "SOL", WR_FLAG: "W", CODE: "WR_USE_MECH", FIELD: "USAGE/MECHANICS", MAP_FUNCTION: mapWritingSPScore }
        , { TEST: "SOL", WR_FLAG: "W", CODE: "WR_SP_WRTOT", FIELD: "WRITING_TOTAL", MAP_FUNCTION: mapWritingSPScore }
        , { TEST: "SOL", WR_FLAG: "Y", CODE: "WR_MC_TEI_NCWR", FIELD: "EOC Writing (10)", MAP_FUNCTION: mapWritingScaledScore }
        , { TEST: "SOL", WR_FLAG: "Y", CODE: "WR_MC_TEI_NCWR", FIELD: "Gr 8 Writing", MAP_FUNCTION: mapWritingScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 3 Math CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 3 Reading CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 8 Read CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 4 Math CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 4 Reading CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 5 Math CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 5 Reading CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 6 Math CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 6 Reading CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 7 Math CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 8 Math CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 7 Reading CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 8 Math (16) CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_CAT", FIELD: "Gr 8 Math (09) CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 8 Read (10) CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_CAT", FIELD: "Gr 8 Read (17) CAT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 3 Mathematics", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 4 Mathematics", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 5 Mathematics", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 6 Mathematics", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 7 Mathematics", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math (16)", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_MA", FIELD: "Remote Gr 3 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_RD", FIELD: "Remote Gr 3 Read", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_MA", FIELD: "Remote Gr 4 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_RD", FIELD: "Remote Gr 4 Read", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_MA", FIELD: "Remote Gr 5 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_RD", FIELD: "Remote Gr 5 Read", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_SCI", FIELD: "Remote Gr 5 Sci", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_MA", FIELD: "Remote Gr 6 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_RD", FIELD: "Remote Gr 6 Read", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_MA", FIELD: "Remote Gr 7 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_RD", FIELD: "Remote Gr 7 Read", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_MA", FIELD: "Remote Gr 8 Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_RD", FIELD: "Remote Gr 8 Read", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "REM_SCI", FIELD: "Remote Gr 8 Sci", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_FALL", FIELD: "Gr 3 Math Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_FALL", FIELD: "Gr 3 Read Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_FALL", FIELD: "Gr 4 Math Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_FALL", FIELD: "Gr 4 Read Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_FALL", FIELD: "Gr 5 Math Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_FALL", FIELD: "Gr 5 Read Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_FALL", FIELD: "Gr 6 Math Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_FALL", FIELD: "Gr 6 Read Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_FALL", FIELD: "Gr 7 Math Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_FALL", FIELD: "Gr 7 Read Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA_FALL", FIELD: "Gr 8 Math Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD_FALL", FIELD: "Gr 8 Read Fall", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 3 Mathematics", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 3 Math CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 3 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Q8 Gr 3 Math", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 4 Mathematics", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 4 Math CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 4 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Q8 Gr 4 Math", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 5 Mathematics", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 5 Math CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 5 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 5 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 6 Mathematics", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 6 Math CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 6 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 6 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Q8 Gr 6 Math", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 7 Mathematics", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 7 Math CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 7 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Q8 Gr 7 Math", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 3 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 3 Reading CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Read CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 3 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Q8 Gr 3 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 4 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 4 Reading CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 4 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 4 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Q8 Gr 4 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 5 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 5 Reading CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 5 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 5 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 6 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 6 Reading CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 6 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 6 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Q8 Gr 6 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 7 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 7 Reading CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 7 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 7 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Q8 Gr 7 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Reading (17)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Read (17) CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Gr 8 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "Q8 Gr 8 Reading", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math (16)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math (16) CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Gr 8 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "Q8 Gr 8 Math", MAP_FUNCTION: mapGrowthScaledScore }

       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "3 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "3 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "4 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "4 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "5 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "5 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "6 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "6 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "7 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "7 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "8 Read Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "8 Read Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }

       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "3 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "3 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "4 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "4 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "5 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "5 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "6 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "6 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "7 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "7 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "8 Math Growth", MAP_FUNCTION: mapGrowthScaledScore }
       , { TEST: "SOL", WR_FLAG: "N", CODE: "MA", FIELD: "8 Math Growth CAT", MAP_FUNCTION: mapGrowthScaledScore }

        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra I (16)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra 1 (23)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_I", FIELD: "Algebra I (2016)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra II (16)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra 2 (23)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "ALG_II", FIELD: "Algebra II (2016)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "BIO", FIELD: "Biology (10)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "BIO", FIELD: "Biology (18)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "CHEM", FIELD: "Chemistry (10)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "EAR_SCI", FIELD: "Earth Sci (10)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Gr 5 Science", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Gr 8 Science", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Q8 Gr 8 Science", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "SCI", FIELD: "Q8 Gr 5 Science", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "EOC Reading (10)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "EOC Reading (17)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "RD", FIELD: "EOC Reading (24)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "GEOM", FIELD: "Geometry (16)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "GEOM", FIELD: "Geometry (23)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_US_HIST", FIELD: "VA&US Hist (15)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_US_HIST", FIELD: "VA&US Hist (08)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "VA_STU", FIELD: "Virginia Studies", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_GEO", FIELD: "W Geography (08)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_I", FIELD: "W Hist I (08)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "WLD_HIST_II", FIELD: "W Hist II (08)", MAP_FUNCTION: mapGrowthScaledScore }
        , { TEST: "SOL", WR_FLAG: "N", CODE: "CIV_ECON", FIELD: "Civics & Economics", MAP_FUNCTION: mapGrowthScaledScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
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
        , "TT": "TT"
        , "HS ": "HS"
        , "HS": "HS"
        , null: null
        , "": null
    };

    var decodeLevel = {
        "1": "1"
        , "01": "1"
        , "001": "1"
        , "2": "2"
        , "02": "2"
        , "002": "2"
        , "3": "3"
        , "03": "3"
        , "003": "3"
        , "4": "4"
        , "04": "4"
        , "004": "4"
        , "5": "5"
        , "05": "5"
        , "005": "5"
        , "6": "6"
        , "06": "6"
        , "006": "6"
        , "7": "7"
        , "07": "7"
        , "007": "7"
        , "8": "8"
        , "08": "8"
        , "008": "8"
        , "9": "9"
        , "09": "9"
        , "009": "9"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , "EOC": "EOC"
        , "CSH": "CSH"
        , "HS ": "HS"
        , "HS": "HS"
        , null: null
        , "": null
    };
    var decodePerformance = {
        "1": "Does Not Meet"
        , "2": "Proficient"
        , "3": "Advanced"
        , "8": "Pass Advanced/College Path"
        , "9": "Did Not Attempt/No Score"
        , null: null
        , "": null
    };
    var decodePerformancePass = {
        "1": "No"
        , "2": "No"
        , "3": "Yes"
        , "8": "Yes"
        , "9": null
        , null: null
        , "": null
    };

    //specific to Writing Scores : UIHN-2481
    var decodeNWPerformance = {
        "1": "Pass/Advanced"
        , "2": "Pass/Proficient"
        , "3": "Fail"
        , "4": "Fail/Basic"
        , "5": "Fail/Below Basic"
        , "8": "Pass Advanced/College Path"
        , "9": "Did Not Attempt/No Score"
        , null: null
        , "": null
    };
    var decodeNWPerformancePass = {
        "1": "Yes"
        , "2": "Yes"
        , "3": "No"
        , "4": "No"
        , "5": "No"
        , "8": "Yes"
        , "9": "--"
        , null: null
        , "": null
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                //component
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                //non-writing strands
                if ((testMetadata.WR_FLAG === "N") && (testMetadata.MAP_FUNCTION === mapScaledScore)) {
                    for (var i = 1; i <= 7; i++) {
                        var reportingCategory = mapReportingCategoryScore(row, testMetadata, i);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, reportingCategory);
                    }
                }
                //writing tests with strands
                if (testMetadata.WR_FLAG === "Y") {
                    for (var i = 1; i <= 2; i++) {
                        var reportingCategory = mapWritingReportingCategoryScore(row, testMetadata, i);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, reportingCategory);
                    }
                }

                else if (row.getField("SCALED_SCORE-WRITING_TOTAL")) {
                    for (var i = 1; i <= 2; i++) {
                        var reportingCategory = mapWritingReportingCategoryScore(row, testMetadata, i);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, reportingCategory);
                    }
                }
            } catch (exception) {
                print(e);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
        try {
            var record = {};
            var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
            var birthDateString = _util.coalesce(row.getField("BIRTH_DATE"), row.getField("DOB_MONTH") + "/" + row.getField("DOB_DAY") + "/" + row.getField("DOB_YEAR"));
            var birthDateObject = {
                RAW_DATE: null
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            };

                birthDateObject = AppUtil.getMonthFollowedByDay(birthDateString);


//            if(row.getField("BIRTH_DATE")!==undefined && row.getField("BIRTH_DATE") !==null && row.getField("BIRTH_DATE").substring(2,3)==="-"){
//                var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "dd-MM-yyyy");
//            }
//            else if(row.getField("BIRTH_DATE")!==undefined && row.getField("BIRTH_DATE") !==null && row.getField("BIRTH_DATE").toString().indexOf("-")>-1){
//                var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "yyyy-MM-dd");
//            }
//            else if(row.getField("BIRTH_DATE")!==undefined && row.getField("BIRTH_DATE") !==null && row.getField("BIRTH_DATE").toString().indexOf("-")>-1){
//                var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "MM-dd-yyyy");
//            }
//            else{
//                var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "MM/dd/yyyy");
//            }


//            if(row.getField("TEST_ADMIN_DATE")!==undefined && row.getField("TEST_ADMIN_DATE") !==null && row.getField("TEST_ADMIN_DATE").substring(2,3)==="-"){
//                var assessmentDateObject = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "MM-dd-yyyy");
//            }
//            else if(row.getField("TEST_ADMIN_DATE")!==undefined && row.getField("TEST_ADMIN_DATE") !==null && row.getField("TEST_ADMIN_DATE").toString().indexOf("-")>-1){
//                var assessmentDateObject = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "yyyy-MM-dd");
//             }
//            else if(row.getField("TEST_ADMIN_DATE")!==undefined && row.getField("TEST_ADMIN_DATE") !==null && row.getField("TEST_ADMIN_DATE").toString().indexOf("-")>-1){
//                var assessmentDateObject = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "dd-MM-yyyy");
//             }
//            else{
//                var assessmentDateObject = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "MM/dd/yyyy");
//            }


//            if (birthDateString.toString().length == 10) {
//                birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "MM/dd/yyyy");
//            }
//            else if (birthDateString.toString().length == 9) {
//                birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "MM/dd/yyyy")
//            }
//            else if (birthDateString.toString().length == 8) {
//                birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "MM/dd/yyyy")
//            }
            if (row.getField("TEST_ADMIN_DATE")) {
            var testDate = row.getField("TEST_ADMIN_DATE");
            }
            else{
             testDate = row.getField("TEST_MONTH")
                + "/" + row.getField("TEST_DAY")
                + "/" + row.getField("TEST_YEAR");
            }


//            var testDate = row.getField("TEST_MONTH")
//                + "/" + row.getField("TEST_DAY")
//                + "/" + row.getField("TEST_YEAR");

            if (testDate === "null/null/null") {
                if (row.getField("MC_TEST_MONTH") > row.getField("SP_TEST_MONTH") && row.getField("MC_TEST_MONTH") !== null && row.getField("SP_TEST_MONTH") !== null) {
                    testDate = row.getField("MC_TEST_MONTH") + "/" + row.getField("MC_TEST_DAY") + "/" + row.getField("MC_TEST_YEAR");
                }
                else if (row.getField("MC_TEST_MONTH") == row.getField("SP_TEST_MONTH") && row.getField("MC_TEST_DAY") > row.getField("SP_TEST_DAY")
                    && row.getField("MC_TEST_MONTH") !== null && row.getField("SP_TEST_MONTH") !== null) {
                    testDate = row.getField("MC_TEST_MONTH") + "/" + row.getField("MC_TEST_DAY") + "/" + row.getField("MC_TEST_YEAR");
                }
                else if (row.getField("MC_TEST_MONTH") !== row.getField("SP_TEST_MONTH") && row.getField("SP_TEST_MONTH") !== null) {
                    testDate = row.getField("SP_TEST_MONTH") + "/" + row.getField("SP_TEST_DAY") + "/" + row.getField("SP_TEST_YEAR");
                }
                else if (row.getField("MC_TEST_MONTH") !== null) {
                    testDate = row.getField("MC_TEST_MONTH") + "/" + row.getField("MC_TEST_DAY") + "/" + row.getField("MC_TEST_YEAR");
                }
            }
            if (testDate === "null/null/null" || testDate.toString().indexOf("null") > -1) {
                var testDate = null;
            }

            if (testDate == null && row.getField("TEST_ADMINISTRATION-YEAR") !== null) {
                testDate = "05/15/" + row.getField("TEST_ADMINISTRATION-YEAR");
            }
            if (testDate !== null) {
                try {
                    var assmDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
                } catch (e) {
                    print(e);
                }
            }
            else {
                assmDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
            }
            var testAdminPeriod;
            var toy = row.getField("TEST_ADMIN_TIME_OF_YEAR")
            var fileName = row.getRawField("LINEAGE_FILE").toUpperCase();

            if(toy){
                if(toy.indexOf("3")>-1){
                testAdminPeriod = "Summer"
                }
                else if (toy.indexOf("2")>-1){
                testAdminPeriod = "Spring"
                }
                else if (toy.indexOf("1")>-1 || toy.indexOf("5") > -1){
                testAdminPeriod = "Fall"
                }
                else if (toy.indexOf("6") > -1){
                testAdminPeriod = "Winter";
                }
                else {
                testAdminPeriod = "ALL";
                }
            }
            else{
                if(fileName.indexOf("SUMMER") > -1){
                    testAdminPeriod = "Summer";
                }
                else{
                    testAdminPeriod = "ALL";
//          Commenting the code as part of change from UIHN-72308
//                    var month = assmDate.substring(0,2);
//                    if( month === "08" || month === "09" || month === "10" || month === "11")
//                        testAdminPeriod = "Fall";
//                    else if(month === "12" || month === "01" || month === "02" || month === "03")
//                        testAdminPeriod = "Winter";
//                    else if(month === "04" || month === "05" || month === "06" || month === "07")
//                        testAdminPeriod = "Spring";
                }
            }
            //Todo confirm otherpossiblenames works...else 2 sigs each
            normalizedFileFields.forEach(function (field) {
                switch (field) {
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
                        record.REPORTING_PERIOD = _util.coalesce(testAdminPeriod, hierarchy.REPORTING_PERIOD);
                        break;
                    case "ASSESSMENT_VENDOR":
                        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                        break;
                    case "ASSESSMENT_PRODUCT":
                        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                        break;
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE = _util.coalesce(assmDate);
                        break;
                   // case "TEST_REPORTING_DATE":
                   //    record.TEST_REPORTING_DATE = assmDate;
                   //    break;
                   case "STUDENT_DOB_MONTH":
                        record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, "");
                        break;
                    case "STUDENT_DOB_DAY":
                        record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, "");
                        break;
                    case "STUDENT_DOB_YEAR":
                        record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, "");
                        break;
                    case "SCHOOL_VENDOR_ID":
                        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                        break;
                    case "SCHOOL_LOCAL_ID":
                        record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                        break;
                    case "SCHOOL_NAME":
                        record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                        break;
                    case "STUDENT_STATE_ID":
                        //Required for student matching.  Tracks new keys to match.
                        record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_NUMBER"), row.getField("STATE_TESTING_IDENTIFIER_(STI)"));
                        break;
                    case "STUDENT_VENDOR_ID":
                        record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_NUMBER"), row.getField("STATE_TESTING_IDENTIFIER_(STI)"));
                        break;
                    case "STUDENT_LOCAL_ID":
                        record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_NUMBER"), row.getField("STATE_TESTING_IDENTIFIER_(STI)"));
                        break;
                    case "STUDENT_FIRST_NAME":
                        record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                        break;
                    case "STUDENT_MIDDLE_NAME":
                        record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("MIDDLE_INITIAL"));
                        break;
                    case "STUDENT_LAST_NAME":
                        record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                        break;
                    case "STUDENT_GENDER_CODE":
                        record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                        break;
                    case "STUDENT_GRADE_CODE":
                        record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
                        break;
                    default:
                        record[field] = row.getField(field);
                        break;
                }
            });
            return record;
        }
        catch (e) {
            print("mapNormalizedAdminFields issues" + e);
        }
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(admin, row) {
        var updateDate = row.getField("DATE_LAST_UPDATE-MONTH")
            + "/" + row.getField("DATE_LAST_UPDATE-DAY")
            + "/" + row.getField("DATE_LAST_UPDATE-YEAR");
        admin.TEST_INTERVENTION_DESC = updateDate;
        return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata, signature) {

        var score = {};
        // var dayCheck = row.getField("TEST_DAY");
        // var monthCheck = row.getField("TEST_MONTH");
        // var yearCheck = row.getField("TEST_YEAR");
        // if (!dayCheck || dayCheck === "0") {
        //     return null;
        // } else if (!monthCheck || monthCheck === "0") {
        //     return null;
        // } else if (!yearCheck || yearCheck === "0" || yearCheck === "0000") {
        //     return null;
        // }

        if (row.getField("TEST_NAME") !== testMetadata.FIELD) {
            return null;
        }
        var testNumber = generateTestNumber(row, testMetadata) + "_TOT";

        var scaleScore = _util.coalesce(row.getField("TEST_SCALED_SCORE"), row.getField("TEST_UNWEIGHTED_SCORE"));
        var achievLevel = row.getField("PERFORMANCE_LEVEL");
        var progMeasure = row.getField("PROGRESS_MEASURE"); //Does this have data?
        var form = row.getField("FORM");
        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }



        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            if (row.getField("TEST_SCALED_SCORE") !== null && row.getField("TEST_SCALED_SCORE") !== undefined && (parseInt(scaleScore) >= 900)) {
                return null;
            }
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }
        //score["TEST_SECONDARY_RESULT_CODE"] = achievLevel;
        //score["TEST_SECONDARY_RESULT"] = decodeNWPerformance[achievLevel];
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[achievLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[achievLevel];
        score["TEST_SCORE_ATTRIBUTES"] = row.getField("TEST_NAME");
        score["TEST_CUSTOM_RESULT"] = form;
        return score;

    }

    function mapGrowthScaledScore(row, testMetadata, signature) {

        var score = {};

        var testName = row.getField("TEST_NAME");
        if (testName !== testMetadata.FIELD) {
            return null;
        }
        var testNumber = generateTestNumber(row, testMetadata) + "_TOT_GROWTH";

        var scaleScore = _util.coalesce(row.getField("VERTICAL_SCALED_SCORE"));
        var form = row.getField("FORM");
        var achievLevel = _util.coalesce(row.getField("MILITARY_CONNECTED_STUDENT_CODE"), row.getField("PERFORMANCE_LEVEL"));
        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCORE_ATTRIBUTES"] = testName;
        score["TEST_CUSTOM_RESULT"] = form;
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[achievLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[achievLevel];
        return score;

    }

    function mapReportingCategoryScore(row, testMetadata, reportingNumber) {
        var score = {};
        // var dayCheck = row.getField("TEST_DAY");
        // var monthCheck = row.getField("TEST_MONTH");
        // var yearCheck = row.getField("TEST_YEAR");
        // if (!dayCheck || dayCheck === "0") {
        //     return null;
        // } else if (!monthCheck || monthCheck === "0") {
        //     return null;
        // } else if (!yearCheck || yearCheck === "0" || yearCheck === "0000") {
        //     return null;
        // }

        var testName = row.getField("TEST_NAME");
        if (testName !== testMetadata.FIELD) {
            return null;
        }

        var testNumber = generateTestNumber(row, testMetadata) + "_" + reportingNumber;

        var scaleScore = _util.coalesce(
            row.getField("REPORTING_CAT_SCALED_SCORE" + reportingNumber),
            row.getField("SCALED_SCORE-REPORTING_CATEGORY_" + reportingNumber)
        );
        var form = row.getField("FORM");
        var achievLevel = row.getField("PERFORMANCE_LEVEL");
        // Check for key fields and do not map score and exit if conditions met.

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            if (parseInt(scaleScore) >= 900) {
                return null;
            }
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }
        //score["TEST_RAW_SCORE"] = numberCorrect;
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[achievLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[achievLevel];
        score["TEST_SCORE_ATTRIBUTES"] = testName;
        score["TEST_CUSTOM_RESULT"] = form;
        return score;


    }
    function mapWritingReportingCategoryScore(row, testMetadata, reportingNumber) {
        var score = {};
        // var dayCheck = row.getField("TEST_DAY");
        // var monthCheck = row.getField("TEST_MONTH");
        // var yearCheck = row.getField("TEST_YEAR");
        // if (!dayCheck || dayCheck === "0") {
        //     return null;
        // } else if (!monthCheck || monthCheck === "0") {
        //     return null;
        // } else if (!yearCheck || yearCheck === "0" || yearCheck === "0000") {
        //     return null;
        // }

        var testName = row.getField("TEST_NAME");
        if (testName === testMetadata.FIELD) {



        if(testName.indexOf('Writing')> -1){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + decodeLevel[row.getField("LEVEL")] + "_" + reportingNumber;

            var itemsAttempted = _util.coalesce(row.getField("MC/TEI_NUMBER_CORRECT-REPORTING_CATEGORY_" + reportingNumber));

            var scaleScore = _util.coalesce(row.getField("REPORTING_CAT_SCALED_SCORE" + reportingNumber),
                row.getField("SCALED_SCORE-REPORTING_CATEGORY_" + reportingNumber)
            );
            var form = row.getField("FORM");
            var numberCorrect = row.getField("TOTAL_(MC/TEI+SP)_NUMBER_CORRECT-REPORTING_CATEGORY_" + reportingNumber);
            // Check for key fields and do not map score and exit if conditions met.
        }else {
            return null;
            }


        }
        else if(testMetadata.CODE === "WR" && testName === null ){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + decodeLevel[row.getField("LEVEL")] + "_" + reportingNumber;

            var itemsAttempted = _util.coalesce(row.getField("MC/TEI_NUMBER_CORRECT-REPORTING_CATEGORY_" + reportingNumber));

            var scaleScore = _util.coalesce(row.getField("REPORTING_CAT_SCALED_SCORE" + reportingNumber),
                row.getField("SCALED_SCORE-REPORTING_CATEGORY_" + reportingNumber)
            );

            var form = row.getField("FORM");
            var numberCorrect = row.getField("TOTAL_(MC/TEI+SP)_NUMBER_CORRECT-REPORTING_CATEGORY_" + reportingNumber);
            var achievLevel = row.getField("PERFORMANCE_LEVEL");
        }

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            if (parseInt(scaleScore) >= 900) {
                return null;
            }
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
        score["TEST_RAW_SCORE"] = numberCorrect;
        score["TEST_SCORE_ATTRIBUTES"] = testName;
        score["TEST_CUSTOM_RESULT"] = form;
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[achievLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[achievLevel];
        return score;
    }
    function mapWritingScaledScore(row, testMetadata, signature) {
        var score = {};
        // var dayCheck = row.getField("TEST_DAY");
        // var monthCheck = row.getField("TEST_MONTH");
        // var yearCheck = row.getField("TEST_YEAR");
        // if (!dayCheck || dayCheck === "0") {
        //     return null;
        // } else if (!monthCheck || monthCheck === "0") {
        //     return null;
        // } else if (!yearCheck || yearCheck === "0" || yearCheck === "0000") {
        //     return null;
        // }

        if (row.getField("TEST_NAME") !== testMetadata.FIELD) {
            return null;
        }
        var decodeLevelVal = decodeLevel[row.getField("LEVEL")]
        if (decodeLevelVal !==null){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + decodeLevelVal + "_TOT";
        }
        else if (signature.getFormat().getFormatName() == "SOL_COLS_28" && testMetadata.FIELD == "EOC Writing (10)"){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + "EOC" + "_TOT";
        }
        else if (signature.getFormat().getFormatName() == "SOL_COLS_28" && testMetadata.FIELD == "Gr 8 Writing"){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + "8" + "_TOT";
        }
        else{//Some files do not have LEVEL
            var testNumber = generateTestNumber(row, testMetadata) + "_TOT";
        }
        var scaleScore = _util.coalesce (row.getField("MC/TEI_NUMBER_CORRECT-_SCORE"), row.getField("MC/TEI_NUMBER_CORRECT-WRITING_TOTAL"));

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
        }
        if (signature.getFormat().getFormatName() == "SOL_COLS_28" && (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")) {
            scaleScore = row.getField("TEST_SCALED_SCORE");
        }
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        var pointsEarned = row.getField("SP_POINTS_EARNED-" + testMetadata.FIELD);
        var form = row.getField("FORM");


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            if (parseInt(scaleScore) >= 900) {
                return null;
            }
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"));
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[_util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"))];
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[_util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"))];
        score["TEST_SCORE_ATTRIBUTES"] = row.getField("TEST_NAME");
        score["TEST_CUSTOM_RESULT"] = form;

        return score;
    }
    function mapWritingSPScore(row, testMetadata, signature) {
        var score = {};
        // var dayCheck = row.getField("TEST_DAY");
        // var monthCheck = row.getField("TEST_MONTH");
        // var yearCheck = row.getField("TEST_YEAR");
        // if (!dayCheck || dayCheck === "0") {
        //     return null;
        // } else if (!monthCheck || monthCheck === "0") {
        //     return null;
        // } else if (!yearCheck || yearCheck === "0" || yearCheck === "0000") {
        //     return null;
        // }

        var testNumber = generateTestNumber(row, testMetadata) + "_" + decodeLevel[row.getField("LEVEL")] + "_TOT";
        var rawScore = row.getField("SP_POINTS_EARNED-" + testMetadata.FIELD);
        var scaleScore = row.getField(testMetadata.FIELD + "_SCORE")
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }
        var form = row.getField("FORM");


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = rawScore;
        if (!isNaN(rawScore)) {
            if (parseInt(rawScore) >= 900) {
                return null;
            }
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
        }

        if(!isNaN(scaleScore)) {
         score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"));
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[_util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"))];
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[_util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"))];
        score["TEST_SCORE_ATTRIBUTES"] = row.getField("TEST_NAME");
        score["TEST_CUSTOM_RESULT"] = form;
        return score;
    }



    function mapWritingTotalScore(row, testMetadata, signature) {
        var score = {};
        // var dayCheck = row.getField("TEST_DAY");
        // var monthCheck = row.getField("TEST_MONTH");
        // var yearCheck = row.getField("TEST_YEAR");
        // if (!dayCheck || dayCheck === "0") {
        //     return null;
        // } else if (!monthCheck || monthCheck === "0") {
        //     return null;
        // } else if (!yearCheck || yearCheck === "0" || yearCheck === "0000") {
        //     return null;
        // }
      var testName = row.getField("TEST_NAME");

      if (testName) {
          if (testName.indexOf("Writing") > -1) {
              if (row.getField("TEST_NAME") !== testMetadata.FIELD && (testMetadata.CODE!=="WR" && testMetadata.FIELD!=="SCALE_SCORE")) {
                  return null;
              }

              var decodeLevelVal = decodeLevel[row.getField("LEVEL")];

              if (decodeLevelVal !== null) {
                  var testNumber = generateTestNumber(row, testMetadata) + "_" + decodeLevelVal + "_TOT";
              } else {
                  // Some files do not have LEVEL
                  var testNumber = generateTestNumber(row, testMetadata) + "_TOT";
              }

              var scaleScore = _util.coalesce(row.getField("SCALED_SCORE-WRITING_TOTAL"), row.getField("TEST_SCALED_SCORE"));
              var pointsEarned = row.getField("SP_POINTS_EARNED-WRITING_TOTAL");
              var form = row.getField("FORM");
          } else {
              return null;
          }
      }
        // Check for key fields and do not map score and exit if conditions met.
        else if (testName === null){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + decodeLevel[row.getField("LEVEL")] + "_TOT";

            var scaleScore = _util.coalesce(row.getField("SCALED_SCORE-WRITING_TOTAL"), row.getField("TEST_SCALED_SCORE"));
            var pointsEarned = row.getField("SP_POINTS_EARNED-WRITING_TOTAL");
            var form = row.getField("FORM");
        }
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""  ) {
            return null;
        };
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            if (parseInt(scaleScore) >= 900) {
                return null;
            }
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = pointsEarned;
        score["TEST_SCORE_ATTRIBUTES"] = testName;
        score["TEST_CUSTOM_RESULT"] = form;


        score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"));
        score["TEST_PRIMARY_RESULT"] = decodeNWPerformance[_util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"))];
        score["TEST_PASSED_INDICATOR"] = decodeNWPerformancePass[_util.coalesce(row.getField("PERFORMANCE_LEVEL_TOTAL_(MC/TEI_+_SP)"), row.getField("PERFORMANCE_LEVEL"))];
        score["TEST_RAW_SCORE"] = row.getField("TOTAL_(MC/TEI+SP)_NUMBER_CORRECT-WRITING_TOTAL");
        return score;
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

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key), ""));
        });
        if(srcRecord.getField("TEST_MONTH") !==null && srcRecord.getField("TEST_DAY") !==null && srcRecord.getField( "TEST_YEAR") !==null)
        {
            assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("TEST_MONTH") + "/" + srcRecord.getField("TEST_DAY") + "/" + srcRecord.getField( "TEST_YEAR");
        }
        else if(srcRecord.getField("MC_TEST_MONTH") !==null && srcRecord.getField("MC_TEST_DAY") !==null && srcRecord.getField( "MC_TEST_YEAR") !==null)
        {
            assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("MC_TEST_MONTH") + "/" + srcRecord.getField("MC_TEST_DAY") + "/" + srcRecord.getField( "MC_TEST_YEAR");
        }
        else if(srcRecord.getField("SP_TEST_MONTH") !==null && srcRecord.getField("SP_TEST_DAY") !==null && srcRecord.getField( "SP_TEST_YEAR") !==null)
        {
            assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("SP_TEST_MONTH") + "/" + srcRecord.getField("SP_TEST_DAY") + "/" + srcRecord.getField( "SP_TEST_YEAR");
        }
        else
        {
            assessmentAdminKey += "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
        }

        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        return testNumber;

    }

    return module;


}());