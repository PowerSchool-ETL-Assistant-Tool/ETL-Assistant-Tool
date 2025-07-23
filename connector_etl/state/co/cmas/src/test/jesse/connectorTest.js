const BASE_APP_SCRIPT_PATH = __params__.get("APP_PATH");
const DEV_DIR = __params__.get("DEV_PATH");
const CONNECTOR_PATH =__params__.get("CONNECTOR_PATH");

function main() {
    load("${BASE_APP_SCRIPT_PATH}src/test/jesse/AppConnectorTest.js");
    load("${CONNECTOR_PATH}/src/main/jesse/CMAS_normalize.js");
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

    AppConnectorTest.QUnit.test("CMAS TESTS", function (assert) {
        assert.equal(assessmentMetadata.test_vendor.toString(), AppAssessmentConfig.VENDOR_NAME, "Test Vendor Name Matches");
        assert.equal(assessmentMetadata.test_product.toString(), AppAssessmentConfig.PRODUCT_NAME, "Test Product Name Matches");
    });

    AppConnectorTest.QUnit.test("DATE TRANSFORMATION TESTS", function (assert) {
        assert.equal(AppNormalize.mapDateObject(null, null, '5/6/2021').STANDARD_DATE, '05/06/2021', 'MM/dd/yyyy Date Transform Matches');
        assert.equal(AppNormalize.mapDateObject(null, null, '2021-05-06').STANDARD_DATE, '05/06/2021', 'yyyy-MM-dd Date Transform Matches');
        assert.equal(AppNormalize.mapDateObject(null, null, '05062021').STANDARD_DATE, '05/06/2021', 'MMddyyyy Date Transform Matches');
    });

    AppConnectorTest.QUnit.load();
}