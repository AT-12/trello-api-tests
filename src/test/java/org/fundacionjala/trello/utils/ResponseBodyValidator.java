package org.fundacionjala.trello.utils;

import io.restassured.response.Response;
import org.fundacionjala.core.utils.Mapper;
import org.testng.Assert;

import java.util.HashMap;
import java.util.Map;

/**
 * Defines utility methods for response body validation.
 */
public final class ResponseBodyValidator {

    /**
     * Private constructor for {@link ResponseBodyValidator} utility class.
     */
    private ResponseBodyValidator() {

    }

    /**
     * Validates response body values.
     *
     * @param response       response.
     * @param expectedValues expected values.
     */
    public static void validate(final Response response, final Map<String, String> expectedValues) {
        for (Map.Entry<String, String> entry : expectedValues.entrySet()) {
            String actualValue = response.jsonPath().getString(entry.getKey());
            String expectedValue = entry.getValue();
            Assert.assertEquals(actualValue, expectedValue);
        }
    }

    /**
     * Validates response body values.
     *
     * @param response
     * @param actualContext
     * @param expect
     */
    public static void validateBody(final Response response, final Map<String, String> actualContext,
                                    final Map<String, String> expect) {
        Map<String, String> expectedData = new HashMap<>();
        for (Map.Entry<String, String> data : expect.entrySet()) {
            String key = data.getKey();
            String value = Mapper.mapValue(data.getValue(), actualContext);
            expectedData.put(key, value);
        }
        validate(response, expectedData);
    }
}
