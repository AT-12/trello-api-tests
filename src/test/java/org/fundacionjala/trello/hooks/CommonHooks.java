package org.fundacionjala.trello.hooks;

import io.cucumber.java.Before;
import org.testng.SkipException;

public class CommonHooks {
    /**
     * Skips a test scenario.
     */
    @Before(value = "@skipScenario",  order = 0)
    public void skipTestScenario() {
        throw new SkipException("Test Skipped");
    }
}
