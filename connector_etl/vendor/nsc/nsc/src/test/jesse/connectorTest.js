var BASE_APP_SCRIPT_PATH = __params__.get("APP_PATH");
var CONNECTOR_PATH =__params__.get("CONNECTOR_PATH");
var DEV_DIR = __params__.get("DEV_PATH");
var AssessmentLoader;

load("jesse:third_party/commonjs/jvm-npm.js");
function main() {
    load("jesse:api/file.js");
    load("jesse:util/util.js");
    load("jesse:api/dataflow.js");
    load("jesse:api/io.js");
    load("jesse:api/database.js");

    var QUnitModule = require("scripts/jesse/core/third_party/testing/qunit.js");

    load("${BASE_APP_SCRIPT_PATH}src/main/jesse/assessment_framework/AppUtil.js");
    load("${DEV_DIR}/etc/AppConfig.js");
    load("${BASE_APP_SCRIPT_PATH}src/main/jesse/assessment_framework/stages/AppMatching.js");

    /** Simulate loading config into main loader **/
    AssessmentLoader = {
        config  : Appconfig
    };

    var QUnit = QUnitModule.QUnit;

    QUnit.log(function (details) {
        if (!details.result) {
            var message = "\n" + details.name + "\nFAIL: \t\t" + details.message + "\n";
            message += "Actual: \t" + details.actual + "  \nExpected: \t" + details.expected + "\n";
            _util.printException(message + "\n");
        }
    });

    QUnit.done(function (details) {
        _util.printInfo("QUnit Test Results\n");
        _util.printInfo("Time:\t ${details.runtime} ms\n");
        _util.printInfo("Total:\t ${details.total}\n");
        _util.printInfo("Passed:\t ${details.passed}\n");
        _util.printInfo("Failed:\t ${details.failed}\n");
    });

    /** Tests of Load Entity **/

    load("${CONNECTOR_PATH}/src/main/jesse/LoadEntities.js");

    if (AppNSCEntities.checkDateDifference("${CONNECTOR_PATH}/src/main/", AssessmentLoader.config.UTL_CONFIG.DB_TARGET.DATABASE) < 14) {
        _util.printInfo("The majaority of entities less then 2 weeks old.  Bypassing entity lookup with data.gov\n");
    } else {
        var keymap = AppNSCEntities.getXtblEntityData("${CONNECTOR_PATH}/src/main/", AssessmentLoader.config.UTL_CONFIG.DB_TARGET.DATABASE);
        var firstLoad = Object.keys(keymap).length === 0;
        if (firstLoad) {
            keymap = AppNSCEntities.getFileEntityData("${CONNECTOR_PATH}/src/test/resource/test_results/entities.csv");
        }
        AppNSCEntities.getEntityData("${CONNECTOR_PATH}/src/test/resource/test_results/entities.csv");
        AppNSCEntities.checkEntityData("${CONNECTOR_PATH}/src/test/resource/test_results/entities.csv", AssessmentLoader.config.UTL_CONFIG.DB_TARGET.DATABASE, keymap, firstLoad);
    }

}