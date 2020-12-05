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
    private Map<String, Map<String, String>> dataCollection;

    /**
     * Constructor for the Context.
     */
    public Context() {
        data = new HashMap<>();
        requestSpecification = null;
        dataCollection = new HashMap<String, Map<String, String>>();
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

    /**
     * Sets data map.
     * @param mapData
     */
    public void setData(final Map<String, String> mapData) {
        this.data = mapData;
    }

    /**
     * Gets data map collection.
     * @param key
     * @return dataCollection
     */
    public Map<String, String> getDataCollection(final String key) {
        return dataCollection.getOrDefault(key, new HashMap<String, String>());
    }

    /**
     * Saves the data in to data collection.
     * @param key
     * @param dataMap
     */
    public void saveDataCollection(final String key, final Map<String, String> dataMap) {
        dataCollection.put(key, dataMap);
    }
}
