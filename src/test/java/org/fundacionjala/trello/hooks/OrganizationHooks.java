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

public class OrganizationHooks {

    private Context context;

    /**
     * Initializes an instance of Context class.
     * @param dataContext
     */
    public OrganizationHooks(final Context dataContext) {
        this.context = dataContext;
    }

    /**
     * Delete the board after execute Stepdefs with the deleteBoard tag.
     */
    @After(value = "@deleteOrganization", order = 1)
    public void deleteOrganization() {
        String idOrganization = context.getDataCollection("organization").get("id");
        given(context.getRequestSpecification()).when().delete("/organizations/".concat(idOrganization));
    }

    /**
     * Creates thee board before execute the step with the createBoard tag.
     */
    @Before(value = "@createOrganization", order = 0)
    public void createOrganization() {
         context.setRequestSpec(AuthenticationUtils.getLoggedReqSpec());
         String path = EnvironmentTrello.getInstance().getEnvTemplate() + "/organization/createOrganization.json";
         Response response = given(context.getRequestSpecification())
                 .contentType(ContentType.JSON)
                 .body(new File(path))
                 .when()
                 .post("/organizations/");
         context.saveDataCollection("organization", response.jsonPath().getMap(""));
    }
}
