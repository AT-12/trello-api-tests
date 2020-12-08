Feature: Test POST, GET, PUT and DELETE without token

  Background: Sets authentication
    Given The user sets authentication using only an API key

  @negative @createBoard @deleteBoard
  Scenario: Verify that is not possible to create a Label without token
    When The user sends a POST "board" request to "/labels/" with the following Json data
    """
      {
        "name" : "testLabel",
        "color" : "sky",
        "idBoard": "{id}"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized permission requested
    """

  @negative @createBoard @createLabel @deleteBoard
  Scenario: Verify that is not possible to obtain a Label without token
    When The user sends a GET "label" request to "/labels/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized permission requested
    """

  @negative @createBoard @createLabel @deleteBoard
  Scenario: Verify that is not possible to update a Label without token
    When The user sends a PUT "label" request to "/labels/{id}" with the following Json data
    """
      {
        "name" : "newLabelName",
        "color": "lime"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized permission requested
    """

  @negative @createBoard @createLabel @deleteBoard
  Scenario: Verify that is not possible to delete a Label without token
    When The user sends a DELETE "label" request to "/labels/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized permission requested
    """