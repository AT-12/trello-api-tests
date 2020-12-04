package org.fundacionjala.trello.context;

import io.restassured.specification.RequestSpecification;

import java.util.HashMap;
import java.util.Map;

/**
 * Context class.
 */
public class Context {

    private RequestSpecification requestSpecification;
    private Map<String, String> data;

    /**
     * Constructor for the Context.
     */
    public Context() {
        data = new HashMap<>();
        requestSpecification = null;
    }

    /**
     * Sets request specification.
     * @param requestSpe
     */
    public void setRequestSpec(final RequestSpecification requestSpe) {
        this.requestSpecification = requestSpe;
    }

    /**
     * Gets request specification.
     * @return RequestSpecification
     */
    public RequestSpecification getRequestSpecification() {
        return requestSpecification;
    }

    /**
     * Saves the data of form data in data.
     *
     * @param key
     * @param value
     */
    public void saveData(final String key, final String value) {
        data.put(key, value);
    }

    /**
     * Gets the value of key given.
     *
     * @param key
     * @return a String data
     */
    public String getValueData(final String key) {
        return data.getOrDefault(key, "");
    }

    /**
     * Gets data map.
     * @return data map
     */
    public Map<String, String> getData() {
        return data;
    }
}
