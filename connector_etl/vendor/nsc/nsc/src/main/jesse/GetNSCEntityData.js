/**
 * Standalone tool to populate XTBL_ENTITIES from data.gov
 *
 * To Execute ensure proper execution ensure the following has happened:
 *      Project folder named "Assessment_ETL"
 *      The NSC folder containing this file is extracted and files unaltered
 *      The DB_TARGET.DATABASE is populated with the correct database parameters
 *      Command to execute: java -jar {path to bin folder in Assessment_ETL}/jesse.jar -s {path to this file}/GetNSCEntityData.js
 */
var AssessmentLoader = {};

function main() {
    var rootPath = (__DIR__).substring(0, __DIR__.indexOf("Assessment_ETL") + 15);
    var path = (__DIR__).substring(0, __DIR__.indexOf("jesse"));
    var Driver;
    load("jesse:util/util.js");
    load("jesse:api/file.js");
    load("jesse:api/dataflow.js");
    load("jesse:api/database.js");
    load("jesse:api/io.js");
    load("${rootPath}etc/AppConfig.js");
    AssessmentLoader.config =  Appconfig;
    load("${rootPath}src/jesse/assessment_framework/AppUtil.js");
    load("${path}jesse/LoadEntities.js");
    var _thisModuleName = "GetNSCEntityData";
    var DBPARAMS = AssessmentLoader.config.UTL_CONFIG.DB_TARGET.DATABASE;

    try {
        var keymap = AppNSCEntities.getXtblEntityData("${path}", DBPARAMS);
        AppNSCEntities.getEntityData("${path}resource/vendor_data/entities.csv");
        AppNSCEntities.checkEntityData("${path}resource/vendor_data/entities.csv", DBPARAMS, keymap);
    } catch(exception) {
        throw "${_thisModuleName}.main Exception: ${exception}";
    }
}
