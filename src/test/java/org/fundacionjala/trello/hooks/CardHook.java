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

public class CardHook {
    private Context context;

    /**
     * Initializes an instance of Context class.
     * @param contextToSet
     */
    public CardHook(final Context contextToSet) {
        this.context = contextToSet;
    }

    /**
     * Creates card before execute the step with the createCard tag.
     */
    @Before(value = "@createCard", order = 2)
    public void createCard() {
        String endpoint = EnvironmentTrello.getInstance().getBaseUrl() + "/cards/";
        JSONObject json = new JSONObject();
        json.put("name", "testCard");
        json.put("idList", context.getDataCollection("list").get("id"));
        RequestManager.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        Response response = RequestManager.post(endpoint, json.toString());
        context.saveDataCollection("card", response.jsonPath().getMap(""));
    }

    /**
     * Delete the card after execute Stepdefs with the deleteCard tag.
     */
    @After(value = "@deleteCard", order = 0)
    public void deleteCard() {
        String cardId = context.getDataCollection(("card")).get("id");
        context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        given(context.getRequestSpecification()).when().delete("/cards/".concat(cardId));
    }
}
