package org.fundacionjala.trello.config;
import org.fundacionjala.core.config.Environment;

/**
 * PropertiesReader Trello class.
 */
public final class EnvironmentTrello extends Environment {

    private static final String GRADLE_FILE = "gradle.properties";
    private static final String API_TOKEN = "token";
    private static final String API_KEY = "key";
    private static final String TEMPLATE_PATH = "templatesPath";
    private static EnvironmentTrello environment;

    /**
     * Initialize an instance of the Environment class.
     */
    private EnvironmentTrello() {
        super(GRADLE_FILE);
    }

    /**
     * Gets a singleton instance of the EnvironmentTrello.
     * @return EnvironmentTrello instance.
     */
    public static EnvironmentTrello getInstance() {
        if (environment == null) {
            environment = new EnvironmentTrello();
        }
        return environment;
    }

    /**
     * Gets environment API Token.
     * @return environment API Token value.
     */
    public String getEnvApiToken() {
        return this.getEnvProperty(API_TOKEN);
    }

    /**
     * Gets environment API Key.
     * @return environment API Key value.
     */
    public String getEnvApiKey() {
        return this.getEnvProperty(API_KEY);
    }

    /**
     * Gets environment template path.
     * @return environment template path.
     */
    public String getEnvTemplate() {
        return this.getEnvProperty(TEMPLATE_PATH);
    }
}
