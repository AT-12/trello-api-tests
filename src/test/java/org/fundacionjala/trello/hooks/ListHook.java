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

public class ListHook {
    private Context context;

    /**
     * Initializes an instance of Context class.
     * @param contextToSet
     */
    public ListHook(final Context contextToSet) {
        this.context = contextToSet;
    }

    /**
     * Creates list before execute the step with the createList tag.
     */
    @Before(value = "@createList", order = 1)
    public void createList() {
        String endpoint = EnvironmentTrello.getInstance().getBaseUrl() + "/lists/";
        JSONObject json = new JSONObject();
        json.put("name", "testList");
        json.put("idBoard", context.getDataCollection("board").get("id"));
        RequestManager.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        Response response = RequestManager.post(endpoint, json.toString());
        context.saveDataCollection("list", response.jsonPath().getMap(""));
    }

    /**
     * Delete the list after execute Stepdefs with the deleteList tag.
     */
    @After(value = "@deleteList", order = 1)
    public void deleteList() {
        String labelId = context.getDataCollection(("list")).get("id");
        context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        given(context.getRequestSpecification()).when().delete("/lists/".concat(labelId));
    }
}

