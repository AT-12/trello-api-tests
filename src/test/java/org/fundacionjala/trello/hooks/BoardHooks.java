package org.fundacionjala.trello.hooks;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.fundacionjala.trello.config.EnvironmentTrello;
import org.fundacionjala.trello.context.Context;
import org.fundacionjala.trello.utils.AuthenticationUtils;

import java.io.File;

import static io.restassured.RestAssured.given;

public class BoardHooks {

    private Context context;

    /**
     * Initializes an instance of Context class.
     * @param dataContext
     */
    public BoardHooks(final Context dataContext) {
        this.context = dataContext;
    }

    /**
     * Delete the board after execute Stepdefs with the deleteBoard tag.
     */
    @After(value = "@deleteBoard")
    public void deleteBoard() {
        String boardID = context.getValueData("boardID");
        given(context.getRequestSpecification()).when().delete("/boards/".concat(boardID));
    }

    /*ese nuevo board hay q crear desde el hhok
     * Delete the board after execute Stepdefs with the deleteBoard tag.
     */
    @Before(value = "@createBoard")
    public void createBoard() {
         context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
         String path = EnvironmentTrello.getInstance().getEnvTemplate() + "/board/createBoard.json";
         Response response = given(context.getRequestSpecification())
                 .contentType(ContentType.JSON)
                 .body(new File(path))
                 .when()
                 .post("/boards/");
         String boardID = response.path("id");
         context.saveData("boardID", boardID);
    }
}
