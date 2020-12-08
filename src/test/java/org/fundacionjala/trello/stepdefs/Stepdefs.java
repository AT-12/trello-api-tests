package org.fundacionjala.trello.stepdefs;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.fundacionjala.core.client.RequestManager;
import org.fundacionjala.core.utils.JsonSchemaValidator;
import org.fundacionjala.core.utils.Mapper;
import org.fundacionjala.trello.config.EnvironmentTrello;
import org.fundacionjala.trello.context.Context;
import org.fundacionjala.trello.utils.AuthenticationUtils;
import org.fundacionjala.trello.utils.ResponseBodyValidator;
import org.testng.Assert;
import java.util.Map;

public class Stepdefs {

    private final Context context;
    private Response response;

    /**
     * Initializes an instance of Context class.
     *
     * @param dataContext
     */
    public Stepdefs(final Context dataContext) {
        this.context = dataContext;
    }

    /**
     * Sets valid authentication headers.
     */
    @Given("The user sets valid authentication to request")
    public void setsValidAuthenticationToRequest() {
        RequestSpecification reqSpec = AuthenticationUtils.getLoggedReqSpec();
        RequestManager.setRequestSpec(reqSpec);
        context.setRequestSpec(reqSpec);
    }

    /**
     * Sets invalid authentication headers.
     */
    @Given("The user sets authentication using only an API key")
    public void setsAuthenticationUsingOnlyKey() {
        RequestSpecification reqSpec = AuthenticationUtils.getNotLoggedWithKeyReqSpec();
        RequestManager.setRequestSpec(reqSpec);
        context.setRequestSpec(reqSpec);
    }

    /**
     * Sets invalid authentication headers.
     */
    @Given("The user sets authentication using only an API token")
    public void setsAuthenticationUsingOnlyToken() {
        RequestSpecification reqSpec = AuthenticationUtils.getNotLoggedWithTokenReqSpec();
        RequestManager.setRequestSpec(reqSpec);
        context.setRequestSpec(reqSpec);
    }

    /**
     * Sends post request.
     * @param key
     * @param endpoint
     * @param body
     */
    @When("The user sends a POST {string} request to {string} with the following Json data")
    public void sendsPOSTRequestWithFollowingJsonData(final String key, final String endpoint, final String body) {
        response = RequestManager.post(endpoint, Mapper.mapValue(body, context.getDataCollection(key)));
    }

    /**
     * Validates the response status code.
     *
     * @param expectedStatusCode
     */
    @Then("Verifies response should have the \"{int}\" status code")
    public void verifiesResponseShouldHaveTheStatusCode(final int expectedStatusCode) {
        Assert.assertEquals(response.statusCode(), expectedStatusCode);
    }

    /**
     * Validates response body json schema.
     * @param key
     * @param schema
     */
    @And("Verifies the {string} response body should match with {string} JSON schema")
    public void verifiesResponseBodyShouldMatchWithJSONSchema(final String key, final String schema) {
        JsonSchemaValidator.validate(response, EnvironmentTrello.getInstance().getSchemasPath() + schema);
        context.saveDataCollection(key, response.jsonPath().getMap(""));
    }

    /**
     * Validates the response body.
     * @param responseBody
     */
    @And("Verifies response contains the following text value")
    public void verifiesResponseContainsTheFollowingTextValue(final String responseBody) {
        Assert.assertEquals(response.getBody().asString(), responseBody);
    }

    /**
     * Validates response values.
     * @param key
     * @param expectValues
     */
    @And("Verifies the {string} response should contain the following values")
    public void verifiesResponseShouldContainFollowingValues(final String key, final Map<String, String> expectValues) {
        ResponseBodyValidator.validateBody(response, context.getDataCollection(key), expectValues);
    }

    /**
     * Sends put request.
     * @param key
     * @param endpoint
     * @param body
     */
    @When("The user sends a PUT {string} request to {string} with the following Json data")
    public void sendsAPUTRequestToWithTheFollowingJsonData(final String key, final String endpoint, final String body) {
        response = RequestManager.put(Mapper.mapValue(endpoint, context.getDataCollection(key)), body);
    }

    /**
     * Validates response values.
      * @param key
     * @param endpoint
     */
    @When("The user sends a GET {string} request to {string}")
    public void sendsAGETRequestTo(final String key, final String endpoint) {
        response = RequestManager.get(Mapper.mapValue(endpoint, context.getDataCollection(key)));
    }

    /**
     * Validates response values.
     * @param key
     * @param endpoint
     */
    @When("The user sends a DELETE {string} request to {string}")
    public void sendsADELETERequestTo(final String key, final String endpoint) {
        response = RequestManager.delete(Mapper.mapValue(endpoint, context.getDataCollection(key)));
    }
}
