const BASE_APP_SCRIPT_PATH = __params__.get("APP_PATH");
const DEV_DIR = __params__.get("DEV_PATH");
const CONNECTOR_PATH =__params__.get("CONNECTOR_PATH");

function main() {
    load("${BASE_APP_SCRIPT_PATH}src/test/jesse/AppConnectorTest.js");
    load("${CONNECTOR_PATH}/src/main/jesse/PRE_ACT_normalize.js");
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

    AppConnectorTest.QUnit.test("PRE_ACT TESTS", function (assert) {
        assert.equal(assessmentMetadata.test_vendor.toString(), AppAssessmentConfig.VENDOR_NAME, "Test Vendor Name Matches");
        assert.equal(assessmentMetadata.test_product.toString(), AppAssessmentConfig.PRODUCT_NAME, "Test Product Name Matches");
    });

    AppConnectorTest.QUnit.test("PRE_ACT DATE TRANSFORMATION TESTS", function (assert) {
        const hierarchy = { SCHOOL_YEAR: '2020-2021' }
        assert.equal(AppNormalize.mapDateObject(hierarchy, null, '20050505').STANDARD_DATE, '05/05/2005');
        assert.equal(AppNormalize.mapDateObject(hierarchy, null, '3-Jun').STANDARD_DATE, '06/03/2021');
        assert.equal(AppNormalize.mapDateObject(hierarchy, null, '14-Nov').STANDARD_DATE, '11/14/2020');
    });



    AppConnectorTest.QUnit.load();
}