const BASE_APP_SCRIPT_PATH = __params__.get("APP_PATH");
const DEV_DIR = __params__.get("DEV_PATH");
const CONNECTOR_PATH =__params__.get("CONNECTOR_PATH");

function main() {
    load("${BASE_APP_SCRIPT_PATH}src/test/jesse/AppConnectorTest.js");
    load("${CONNECTOR_PATH}/src/main/jesse/CAASPP_INTERIM_normalize.js");
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

    AppConnectorTest.QUnit.test("CAASPP_INTERIM TESTS", function (assert) {
        assert.equal(assessmentMetadata.test_vendor.toString(), AppAssessmentConfig.VENDOR_NAME, "Test Vendor Name Matches");
        assert.equal(assessmentMetadata.test_product.toString(), AppAssessmentConfig.PRODUCT_NAME, "Test Product Name Matches");
    });

    AppConnectorTest.QUnit.test("CAASPP_INTERIM DATE TRANSFORMATION TESTS", function (assert) {
        assert.equal(AppNormalize.mapDateObject(null, null, 'Sep 20, 2021').STANDARD_DATE, '09/20/2021');
        assert.equal(AppNormalize.mapDateObject(null, null, '8 Sep 2020').STANDARD_DATE, '09/08/2020');
        assert.equal(AppNormalize.mapDateObject(null, null, 'Nov 3, 2021').STANDARD_DATE, '11/03/2021');
        assert.equal(AppNormalize.mapDateObject(null, null, '2020-07-05 00:00:00').STANDARD_DATE, '07/05/2020');
        assert.equal(AppNormalize.mapDateObject(null, null, '2005-12-24').STANDARD_DATE, '12/24/2005');
    });

    AppConnectorTest.QUnit.load();
}