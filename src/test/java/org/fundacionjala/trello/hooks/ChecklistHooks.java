package org.fundacionjala.trello.hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.response.Response;
import org.fundacionjala.core.client.RequestManager;
import org.fundacionjala.trello.config.EnvironmentTrello;
import org.fundacionjala.trello.context.Context;
import org.fundacionjala.trello.utils.AuthenticationUtils;
import org.json.JSONObject;

import static io.restassured.RestAssured.given;

public class ChecklistHooks {

    private Context context;
    private static final int ORDER = 3;

    /**
     * Initializes an instance of Context class.
     * @param dataContext
     */
    public ChecklistHooks(final Context dataContext) {
        this.context = dataContext;
    }

    /**
     * Creates checklist before execute the step with the createChecklist tag.
     */
    @Before(value = "@createChecklist", order = ORDER)
    public void createChecklist() {
        String endpoint = EnvironmentTrello.getInstance().getBaseUrl() + "/checklists/";
        JSONObject json = new JSONObject();
        json.put("name", "testChecklist");
        json.put("idCard", context.getDataCollection("card").get("id"));
        RequestManager.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        Response response = RequestManager.post(endpoint, json.toString());
        context.saveDataCollection("checklist", response.jsonPath().getMap(""));
    }

    /**
     * Delete the checklist after execute Stepdefs with the deleteChecklist tag.
     */
    @After(value = "@deleteChecklist", order = 0)
    public void deleteChecklist() {
        String checklistId = context.getDataCollection(("checklist")).get("id");
        context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        given(context.getRequestSpecification()).when().delete("/checklists/".concat(checklistId));
    }
}
