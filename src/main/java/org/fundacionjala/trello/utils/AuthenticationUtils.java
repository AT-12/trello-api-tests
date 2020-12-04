
package org.fundacionjala.trello.utils;

import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;
import org.fundacionjala.trello.config.EnvironmentTrello;


public final class AuthenticationUtils {

    private static final String BASE_URL_API = EnvironmentTrello.getInstance().getBaseUrl();
    private static final String API_KEY = EnvironmentTrello.getInstance().getEnvApiKey();
    private static final String API_TOKEN = EnvironmentTrello.getInstance().getEnvApiToken();
    private static final String KEY = "key";
    private static final String TOKEN = "token";

    /**
     * Constructor for AuthenticationUtils.
     */
    private AuthenticationUtils() {

    }

    /**
     * Get request specifications.
     *
     * @return request.
     */
    public static RequestSpecification getLoggedReqSpec() {
        RequestSpecification request = RestAssured.given();
        request.baseUri(BASE_URL_API)
                .param(KEY, API_KEY)
                .param(TOKEN, API_TOKEN);
        return request;
    }

    /**
     * Get request specifications.
     *
     * @return request.
     */
    public static RequestSpecification getNotLoggedReqSpec() {
        RequestSpecification request = RestAssured.given();
        request.baseUri(BASE_URL_API);
        return request;
    }
}


