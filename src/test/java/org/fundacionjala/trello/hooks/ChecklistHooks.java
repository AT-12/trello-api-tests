package org.fundacionjala.trello.hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.messages.internal.com.google.gson.JsonObject;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.fundacionjala.trello.config.EnvironmentTrello;
import org.fundacionjala.trello.context.Context;
import org.fundacionjala.trello.utils.AuthenticationUtils;

import java.io.File;

import static io.restassured.RestAssured.given;

public class ChecklistHooks {

    private Context context;

    /**
     * Initializes an instance of Context class.
     * @param dataContext
     */
    public ChecklistHooks(final Context dataContext) {
        this.context = dataContext;
    }

    /**
     * Delete the board after execute Stepdefs with the deleteBoard tag.
     */
    @After(value = "@deleteList", order = 1)
    public void deleteList() {
        String idList = context.getDataCollection("list").get("id");
        given(context.getRequestSpecification()).when().delete("/boards/".concat(idList));
    }

    /**
     * Creates thee board before execute the step with the createBoard tag.
     */
    @Before(value = "@createList", order = 0)
    public void createList() {
        String idBoard = context.getDataCollection("board").get("id");
         context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        JsonObject data = new JsonObject();
        data.addProperty("name","new list hook");
        data.addProperty("idBoard",idBoard);
         Response response = given(context.getRequestSpecification())
                 .contentType(ContentType.JSON)
                 .body(data.toString())
                 .when()
                 .post("/boards/");
         context.saveDataCollection("list", response.jsonPath().getMap(""));
    }
    /**
     * Delete the board after execute Stepdefs with the deleteBoard tag.
     */
    @After(value = "@deleteCard", order = 1)
    public void deleteCard() {
        String idBoard = context.getDataCollection("card").get("id");
        given(context.getRequestSpecification()).when().delete("/cards/".concat(idBoard));
    }

    /**
     * Creates thee board before execute the step with the createBoard tag.
     */
    @Before(value = "@createCard", order = 0)
    public void createCard() {
        String idList = context.getDataCollection("list").get("id");
        context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
        JsonObject data = new JsonObject();
        data.addProperty("name","new card hook");
        data.addProperty("idList",idList);
        //String path = EnvironmentTrello.getInstance().getEnvTemplate() + "/board/createBoard.json";
        Response response = given(context.getRequestSpecification())
                .contentType(ContentType.JSON)
                .body(data.toString())
                .when()
                .post("/cards/");
        context.saveDataCollection("card", response.jsonPath().getMap(""));
    }
}
