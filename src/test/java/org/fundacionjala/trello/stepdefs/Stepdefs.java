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
     * Sends post request.
     *
     * @param endpoint
     * @param body
     */
    @When("the user sends a POST request to {string} with the following Json data")
    public void sendsAPOSTRequestToWithTheFollowingJsonData(final String endpoint, final String body) {
        context.saveData("endpoint", endpoint);
        response = RequestManager.post(endpoint, body);
    }

    /**
     * Validate the response status code.
     *
     * @param expectedStatusCode
     */
    @Then("verifies response should have the \"{int}\" status code")
    public void verifiesResponseShouldHaveTheStatusCode(final int expectedStatusCode) {
        Assert.assertEquals(response.statusCode(), expectedStatusCode);
    }

    /**
     * Validates response body json schema.
     *
     * @param schema
     */
    @And("verifies response body should match with {string} JSON schema")
    public void verifiesResponseBodyShouldMatchWithJSONSchema(final String schema) {
        JsonSchemaValidator.validate(response, EnvironmentTrello.getInstance().getSchemasPath() + schema);
        context.saveData("boardID", response.jsonPath().getString("id"));
    }

    /**
     * Validates response values.
     *
     * @param expectedValues
     */
    @And("verifies response should contain the following values")
    public void verifiesResponseShouldContainTheFollowingValues(final Map<String, String> expectedValues) {
        ResponseBodyValidator.validate(response, expectedValues);
    }

    /**
     * Sends put request.
     *
     * @param endpoint
     * @param body
     */
    @When("the user sends a PUT request to {string} with the following Json data")
    public void sendsAPUTRequestToWithTheFollowingJsonData(final String endpoint, final String body) {
        Mapper.mapValue("idBoard", context.getData());
        context.saveData("endpoint", endpoint);
        response = RequestManager.post(endpoint, body);
    }
}
