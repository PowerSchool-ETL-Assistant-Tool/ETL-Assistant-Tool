const BASE_APP_SCRIPT_PATH = __params__.get("APP_PATH");
const DEV_DIR = __params__.get("DEV_PATH");
const CONNECTOR_PATH =__params__.get("CONNECTOR_PATH");

function main() {
    load("${BASE_APP_SCRIPT_PATH}src/test/jesse/AppConnectorTest.js");
    load("${CONNECTOR_PATH}/src/main/jesse/GENERIC_normalize.js");
    load("${CONNECTOR_PATH}/src/main/resource/etc/config.js");

    AppConnectorTest.setModulePath(DEV_DIR, BASE_APP_SCRIPT_PATH, CONNECTOR_PATH);

    /**
     * Sample arguments
     */
    const sampleSize = 5;
    const testDistinctFields = ["TEST_PRIMARY_RESULT", "TEST_PRIMARY_RESULT_CODE"];

    AppConnectorTest.run(sampleSize, testDistinctFields)

    const assessmentMetadata = AppConnectorTest.getAssessmentMetadata();

    if (Array.isArray(AppAssessmentConfig.VENDOR_NAME)) {
        AppAssessmentConfig.VENDOR_NAME.sort()
    }

    if (Array.isArray(AppAssessmentConfig.PRODUCT_NAME)) {
        AppAssessmentConfig.PRODUCT_NAME.sort()
    }

    AppConnectorTest.QUnit.test("GENERIC TESTS", function (assert) {
        assert.equal(1, 1);
    });

    AppConnectorTest.QUnit.load();
}