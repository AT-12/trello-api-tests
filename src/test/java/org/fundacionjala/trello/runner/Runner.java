package org.fundacionjala.trello.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.fundacionjala.trello.config.EnvironmentTrello;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;

/**
 * Cucumber TestNG runner class.
 */
@CucumberOptions(
        plugin = {"pretty"},
        features = {"src/test/resources/features"},
        glue = {"org.fundacionjala.trello"}
)

public final class Runner extends AbstractTestNGCucumberTests {
    @Override
    @DataProvider(parallel = true)
    public Object[][] scenarios() {
        return super.scenarios();
    }
    /**
     * Executes code before all scenarios.
     */
    @BeforeTest
    public void beforeAllScenarios() {
        System.setProperty("dataproviderthreadcount", EnvironmentTrello.getInstance().getCucumberThreadCount());
    }

    /**
     * Executes code after all scenarios.
     */
    @AfterTest
    public void afterAllScenarios() {
        // Code executed after features execution.
    }
}
