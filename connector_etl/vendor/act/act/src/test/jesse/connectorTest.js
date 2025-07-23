const BASE_APP_SCRIPT_PATH = __params__.get("APP_PATH");
const DEV_DIR = __params__.get("DEV_PATH");
const CONNECTOR_PATH =__params__.get("CONNECTOR_PATH");

function main() {
    load("${BASE_APP_SCRIPT_PATH}src/test/jesse/AppConnectorTest.js");
    load("${CONNECTOR_PATH}/src/main/jesse/ACT_normalize.js");
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

    AppConnectorTest.QUnit.test("ACT TESTS", function (assert) {
        assert.equal(assessmentMetadata.test_vendor.toString(), AppAssessmentConfig.VENDOR_NAME, "Test Vendor Name Matches");
        assert.equal(assessmentMetadata.test_product.toString(), AppAssessmentConfig.PRODUCT_NAME, "Test Product Name Matches");
    });

    AppConnectorTest.QUnit.test("DATE TRANSFORMATION TESTS", function (assert) {
        assert.equal(AppNormalize.mapDateObject(null, null, '20170819').STANDARD_DATE, '08/19/2017');
        assert.equal(AppNormalize.mapDateObject(null, null, 'Jun-18').STANDARD_DATE, '06/01/2018');
        assert.equal(AppNormalize.mapDateObject(null, null, '122021').STANDARD_DATE, '12/01/2021');
        assert.equal(AppNormalize.mapDateObject(null, null, 'May 2021').STANDARD_DATE, '05/01/2021');
        assert.equal(AppNormalize.mapDateObject(null, null, 'June 2021').STANDARD_DATE, '06/01/2021');
        assert.equal(AppNormalize.mapDateObject(null, null, 'September 2021').STANDARD_DATE, '09/01/2021');
        assert.equal(AppNormalize.mapDateObject(null, null, '1017').STANDARD_DATE, '10/01/2017');
        assert.equal(AppNormalize.mapDateObject(null, null, '917').STANDARD_DATE, '09/01/2017');



    });

    AppConnectorTest.QUnit.load();
}