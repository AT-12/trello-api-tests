package org.fundacionjala.trello.hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.response.Response;
import org.fundacionjala.core.client.RequestManager;
import org.fundacionjala.trello.config.EnvironmentTrello;
import org.fundacionjala.trello.utils.AuthenticationUtils;
import org.fundacionjala.trello.context.Context;
import org.json.JSONObject;

import static io.restassured.RestAssured.given;

public class LabelHook {
    private Context context;

    /**
     * Initializes an instance of Context class.
     * @param contextToSet
     */
    public LabelHook(final Context contextToSet) {
        this.context = contextToSet;
    }

    /**
     * Creates label before execute the step with the createLabel tag.
     */
    @Before(value = "@createLabel", order = 1)
    public void createLabel() {
        String endpoint = EnvironmentTrello.getInstance().getBaseUrl() + "/labels/";
        JSONObject json = new JSONObject();
        json.put("name", "testLabel");
        json.put("color", "black");
        json.put("idBoard", context.getDataCollection("board").get("id"));
        RequestManager.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        Response response = RequestManager.post(endpoint, json.toString());
        context.saveDataCollection("label", response.jsonPath().getMap(""));
    }

    /**
     * Delete the label after execute Stepdefs with the deleteLabel tag.
     */
    @After(value = "@deleteLabel")
    public void deleteLabel() {
        String labelId = context.getDataCollection(("label")).get("id");
        context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        given(context.getRequestSpecification()).when().delete("/labels/".concat(labelId));
    }
}
