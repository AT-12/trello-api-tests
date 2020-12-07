package org.fundacionjala.trello.unit.tests;

import org.fundacionjala.trello.config.EnvironmentTrello;
import org.testng.annotations.Test;
import org.testng.Assert;

public class EnvironmentTrelloTest {

    /**
     * Test get Api Token from the properties file.
     */
    @Test
    public void testGetEnvApiToken() {
        EnvironmentTrello reader = EnvironmentTrello.getInstance();
        Assert.assertNotNull(reader.getEnvApiToken());
    }

    /**
     * Test get Api Key from the properties file.
     */
    @Test
    public void testGetEnvApiKey() {
        EnvironmentTrello reader = EnvironmentTrello.getInstance();
        Assert.assertNotNull(reader.getEnvApiKey());
    }

    /**
     * Test get template from the properties file.
     */
    @Test
    public void testGetEnvTemplate() {
        EnvironmentTrello reader = EnvironmentTrello.getInstance();
        Assert.assertNotNull(reader.getEnvTemplate());
    }
}
